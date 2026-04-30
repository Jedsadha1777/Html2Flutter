# Table border stretching: known limitation

When converting HTML tables to Flutter (`html/js/table-handler.js`), border lines can render **wider than the source HTML intended**. This document explains the trigger pattern, the underlying cause, and the recommended workaround.

## Symptom

A horizontal border line at a row boundary spans more columns in the Flutter render than the corresponding HTML cells defined `border-top` / `border-bottom` on. Visually, the line "leaks" past the cells that own the border.

Example from `test_html/demo3.html` → `html_preview/lib/demo3.dart`:

- HTML row 31: `<td colspan="46">PARTS / MATERIALS</td>` — single cell spanning full row, NO border
- HTML row 32: cells from col 1 to col 44 each have `border-top: 2px solid #000` (col 0 and col 45 are empty cells without borders)
- HTML browser would render: 2px line at row 31/32 boundary, only across cols 1–44 (cs[1]→cs[45])
- Flutter render: 2px line at row 31/32 boundary, across the **entire row** (cs[0]→cs[46])

## Root cause

`table-handler.js` has a post-processing pass `_convertTopToBottom` (and the mirror `_convertLeftToRight`) that runs after the matrix is built. Its purpose is to fake HTML's `border-collapse:collapse` by moving each cell's top border to the bottom border of the cell above. This way, all horizontal lines along a row boundary use the same "bottom convention" — every line is owned by the cell above its bottom side. Without this pass, lines drawn from "below cell's top" sit at a different y position than lines drawn from "above cell's bottom" because Flutter's `BorderSide` defaults to `strokeAlignInside` (border drawn inside the cell's box, on its near side of the boundary).

The pass works correctly when the cell ranges line up — e.g., row N has cells of colspan 5 on cols 10–14, and row N+1 has matching cells of colspan 5 on cols 10–14. The move propagates the border one row up, and the line still spans cols 10–14.

It misbehaves when the cell receiving the border (the one above) is **wider** than the cell whose top border is being moved. Flutter's `Border` widget can only set a border on the entire side of a cell — there is no partial-side border. So when `_convertTopToBottom` writes `ap.style.cellBorder.bottom` on a placement that spans more columns than the source, the line stretches to the full width of `ap`.

In the example above:
- Source: B32 (col=1, colspan=2) has `border-top:2px`. Target placement above: A31 (col=0, colspan=46), no border.
- Move: A31 gets `border-bottom:2px` from B32, then B32's top is cleared.
- Result: A31 renders bottom border across cols 0–45 (its full colspan), even though only cols 1–2 of B32 had a top border originally. (D32, V32, AA32, AE32, AK32 all try to set the same A31.bottom, but skip after the first because A31.bottom is now defined.)

## Why we don't fix in code

Several approaches were considered and rejected:

1. **Skip the move when the above cell is wider**: leaves the border on the original cell (correct extent) but introduces a 1–2 px y-offset relative to other rows where the move did succeed. Visual inconsistency.

2. **`BorderSide.strokeAlign: BorderSide.strokeAlignCenter`**: Flutter's `Border` widget asserts that strokeAlign different from `strokeAlignInside` requires uniform colors across all four sides. Cells with mixed-color borders (or with borders overwritten by `_overwriteNeighborSide`) violate this and crash with `A Border can only draw strokeAlign different than BorderSide.strokeAlignInside on borders with uniform colors.`

3. **Overlay layer (Positioned line widgets at the boundary)**: lines drawn on top of cells visually penetrate adjacent rows' content. With opaque colors this clips text or form widgets on neighboring rows.

4. **Custom painter rebuild of the whole table**: would let us draw lines at exact pixel positions and ranges, but it is a major refactor and replaces a known-good cell decoration pipeline.

5. **Detect the pattern at the luckysheet→HTML stage and warn**: detection is feasible (we have `merge` and `borderInfoCompute` data) but the precise filter is fragile — border types (solid/dashed/double), color conflict resolution, future template patterns, and merge-row-boundary edge cases all interact. Detection itself becomes a maintenance liability.

The current decision is to leave the rendering as is and document the trigger pattern instead.

## Trigger pattern

The bug fires when **all** of these hold simultaneously:

1. A merged cell M with `colspan > 1`, in row R.
2. The adjacent row (R±1) contains cells whose column range is **strictly inside** M's column range (i.e., the adjacent cells start later than M and/or end earlier than M).
3. Those adjacent cells have a border on the side facing M (`border-top` if they are below M; `border-bottom` if they are above M).

If any of these is missing — single-column cell, no adjacent borders, adjacent cells covering M's range exactly — the bug does not fire.

## Workaround for template designers

Restructure the template so that adjacent rows have the **same column-boundary structure** as merged title/summary cells. Two practical patterns:

### Pattern A — title cell that matches the table column layout

Instead of one wide title cell spanning the whole row, structure the title row to match the table below. For a parts table whose header row uses cells `[1,2] [3,20] [21,25] [26,29] [30,35] [36,44]` plus empty padding cells at col 0 and col 45:

- Bad (triggers the bug): `<td colspan="46">PARTS / MATERIALS</td>`
- Good: `<td></td><td colspan="44">PARTS / MATERIALS</td><td></td>` if the table columns align inside cols 1–44, OR mirror the exact column structure of the header row below if the title only needs to sit visually above part of the table.

### Pattern B — narrower merge that fits within the bordered region

Make the merged cell exactly span the bordered region of the adjacent row — no wider, no narrower. If the table below has borders only on cols 1–44 (cols 0 and 45 are empty padding), the title merge should be `colspan="44"` starting at col 1, not `colspan="46"` starting at col 0.

## Where it lives in the code

- Trigger pass: `_convertTopToBottom` in `html/js/table-handler.js` (~line 1619). Mirror pass: `_convertLeftToRight` (~line 1646).
- Disabling either pass removes the stretching but reintroduces the y-misalignment between rows that motivated the pass in the first place. Don't disable without first re-evaluating that trade-off.
- The pass is gated on `tableNode.styles?.borderCollapse === 'collapse'` (~line 543), so HTML tables without collapse mode are unaffected.

## When to revisit

If a future requirement makes the y-misalignment unacceptable AND the template-design workaround impractical (e.g., the template must come from arbitrary user-uploaded Excel files where merge structure cannot be controlled), the next step is a custom painter for table grid lines that draws lines at exact pixel positions independent of cell ownership. That refactor is non-trivial and breaks the current per-cell decoration model — only worth doing under those specific constraints.
