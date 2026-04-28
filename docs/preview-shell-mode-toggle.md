# PreviewShell mode-toggle: lessons & invariants

Case study from the edit ↔ review (preview) toggle in
`html_preview/lib/preview_shell.dart`. Read this before touching
`_initMode`, `_toggleMode`, `_contentSize`, `_reviewFitScale`, or
`_editFitScale`.

## TL;DR — the rule

Any function called BEFORE `setState` flips a state flag must take ALL
flag-dependent inputs as parameters. Never read the flag off `this`,
and never call helpers that read the flag transitively.

In our case the flag is `_reviewMode`. The pre-setState init is
`_initMode(review, vp)`. The helpers that secretly depended on
`_reviewMode` were `_contentSize` and `_reviewFitScale` (which calls
`_contentSize`). The fix: thread an explicit `reviewOverride` flag so
the target-mode matrix is computed against the target-mode cSize,
regardless of the in-flight `_reviewMode` value.

## The architecture (so the fix makes sense)

- Two `TransformationController`s: `_editCtrl`, `_reviewCtrl`. Pinch /
  zoom in one mode does not bleed into the other during the
  AnimatedSwitcher slide transition (each subtree keeps its own
  controller).
- `_ctrl` getter returns the current-mode controller.
- `_reviewMode` (bool) drives which controller is active, the body's
  shell padding, the page's inner margin, and the cSize used by
  InteractiveViewer.
- Edit mode: cover scale (`max(sw, sh)`) — paper covers viewport on
  the bound axis, overflows on the other so user pans. cSize equals
  natural paper size. `_shellPad` = 0. Page padding = zero.
- Review mode: contain scale (`min(sw, sh)`) on an
  **aspect-padded cSize**. naturalCw/naturalCh include `_shellPad`
  (24) on each side. cSize is then padded to viewport aspect so
  scaled-fit equals viewport on BOTH axes. Page padding = the user-
  supplied print margin.

The aspect-padded cSize is the key invariant: at fit scale,
`cSize.w * s == vp.w` AND `cSize.h * s == vp.h`. This means the
InteractiveViewer's pan range is zero on both axes, so review mode
cannot drift on touch. Without this, scaled-fit < vp on one axis and
the user's first tap snaps it off-center.

## The bug

Sequence on edit → review:

1. User clicks Preview. `_toggleMode(true)` runs.
2. `_initMode(true, vp)` is called BEFORE `setState`. At this point
   `_reviewMode` is still `false`.
3. `_initMode` does `_contentSize(vp)` and `_reviewFitScale(vp)` (which
   itself calls `_contentSize(vp)`). Both internally read
   `_reviewMode` — which is still `false` — so they return EDIT's
   cSize (no shell pad, no aspect padding).
4. The matrix written into `_reviewCtrl` is therefore wrong: scale
   computed against the wrong cSize, tx/ty centered against the wrong
   cSize.
5. `setState` then flips `_reviewMode = true` and rebuilds. The
   InteractiveViewer wraps a SizedBox(cSize) computed with the now-
   correct `_reviewMode = true`, but the controller's matrix was
   stamped using the wrong cSize. User sees the wrong fit, and on
   first touch InteractiveViewer renormalizes against the new cSize
   bounds, snapping the page sideways.

The reverse direction (review → edit) had the symmetrical bug: edit's
ctrl got a matrix computed against review's aspect-padded cSize,
producing a tx far off-screen and visible gray.

## The fix

```dart
Size _contentSize(Size vp, {bool? reviewOverride}) {
  final review = reviewOverride ?? _reviewMode;
  final pad = review ? _shellPad : 0.0;
  // ...rest of body uses `review` instead of `_reviewMode`
}

double _reviewFitScale(Size viewport) {
  final cs = _contentSize(viewport, reviewOverride: true);
  // ...
}

void _initMode(bool review, Size vp) {
  // ...
  final cSize = _contentSize(vp, reviewOverride: review);
  // ...
}
```

Three sites total. `_reviewFitScale` always passes `true` because by
definition it's the review-mode formula. `_initMode` passes its
`review` parameter through. Steady-state callers (`_zoomTo`,
`_fitWidth`, `_onPointerScroll`, the LayoutBuilder body) keep reading
`_reviewMode` because they only run after `setState` completes — by
then the flag is current.

## Why three rounds of patches before this stuck

This bug took three rounds because earlier patches treated symptoms,
not the cause. Recording the false starts here so future agents (and
future me) recognise the pattern.

1. **Round 1 — review-mode drift.** Symptom: page slid sideways on
   first touch in review. First attempt: clamp matrix in
   `onInteractionUpdate`. That is a workaround — the correct number
   was already computable, the runtime clamp just hid the wrong scale.
   Real fix: aspect-pad cSize so the scaled-fit equals viewport on
   both axes mathematically (no slack to drift through).

2. **Round 2 — edit-mode gray.** Symptom: when viewport aspect
   differed from paper aspect, edit mode showed gray on the bound
   axis. Cause: was using contain scale (`min(sw, sh)`). Fix: cover
   scale (`max(sw, sh)`) — paper now covers viewport, overflow other
   axis is for panning.

3. **Round 3 — toggle flip.** Symptom: gray on edit AND wrong center
   on review, but only after toggling — initial mount was correct.
   Cause: implicit `_reviewMode` reads in helpers called by the pre-
   setState init. Fix: thread the target mode explicitly. (This doc.)

The general failure mode in rounds 1 and 2 was patching where the
problem was *visible* (in the touch handler, in the wrong viewport
aspect) instead of where the wrong number was *produced*. Round 3's
failure mode was different — the helpers looked correct in isolation;
the bug was a dependency-chain interaction across a state-transition
boundary.

## Heuristics for future toggle work

- When you split state into per-mode instances (e.g., separate
  controllers), grep for every read of the mode flag. Any helper
  called before the flag flips must accept the target mode as a
  parameter.
- When fitting content to a viewport that the user can pan and zoom,
  decide first: does scaled-fit equal viewport on both axes, or only
  one? If only one, the other axis has slack and `InteractiveViewer`
  will drift. Either accept the drift (cover mode + pan), or
  eliminate slack (aspect-padded cSize).
- If you find yourself adding `onInteractionUpdate` clamps or
  post-frame callbacks to "snap" things into place, stop. The wrong
  number is being produced upstream. Trace where the matrix value
  comes from and fix that.
- Mentally trace the matrix on at least four viewport shapes
  (square-ish, mobile portrait, wide landscape, tall portrait) before
  declaring done. Each shape can expose a different bug.
