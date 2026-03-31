import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Paper orientation.
enum PageOrientation { portrait, landscape }

// ═══════════════════════════════════════════════════════════════════════════════
// PreviewShell — PDF-reader-style preview
// ═══════════════════════════════════════════════════════════════════════════════

class PreviewShell extends StatefulWidget {
  final List<Widget> pages;

  /// portrait (794×1123) or landscape (1123×794) at 96 DPI.
  final PageOrientation orientation;

  /// Gap between pages.
  /// - null          → default 24 px for every gap
  /// - [20]          → 20 px for every gap
  /// - [10, 30, 20]  → per-page gaps; last value repeats if pages > list
  final List<double>? pageGaps;

  /// Inner padding on the white paper (printable-area margins).
  final EdgeInsets pagePadding;

  /// When true, if content exceeds page height it scales down to fit.
  /// When false (default), content is clipped at the bottom.
  final bool fitHeight;

  const PreviewShell({
    super.key,
    required this.pages,
    this.orientation = PageOrientation.portrait,
    this.pageGaps,
    this.pagePadding = const EdgeInsets.all(48),
    this.fitHeight = true,
  });

  @override
  State<PreviewShell> createState() => _PreviewShellState();
}

class _PreviewShellState extends State<PreviewShell> {
  static const _a4Short = 794.0;
  static const _a4Long = 1123.0;
  static const _defaultGap = 24.0;
  static const _shellPad = 24.0;
  static const _red = Color(0xFFAD193C);
  static const _scrollBehavior = _ScrollBehavior();

  double? _userZoom;
  double _pinchBaseZoom = 1.0;
  final _zoomNotifier = ValueNotifier<double>(1.0);

  double get _paperW => widget.orientation == PageOrientation.portrait
      ? _a4Short
      : _a4Long;
  double get _paperH => widget.orientation == PageOrientation.portrait
      ? _a4Long
      : _a4Short;

  double _autoFitZoom(double viewportWidth) =>
      ((viewportWidth - _shellPad * 2) / _paperW).clamp(0.1, 1.0);

  double _gapAfter(int index) {
    if (index >= widget.pages.length - 1) return 0;
    final gaps = widget.pageGaps;
    if (gaps == null || gaps.isEmpty) return _defaultGap;
    if (gaps.length == 1) return gaps[0];
    return index < gaps.length ? gaps[index] : gaps.last;
  }

  @override
  void didUpdateWidget(covariant PreviewShell old) {
    super.didUpdateWidget(old);
    if (old.orientation != widget.orientation) {
      _userZoom = null;
    }
  }

  @override
  void dispose() {
    _zoomNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE0E0E0),
        appBar: AppBar(
          backgroundColor: _red,
          title: const Text('Preview',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          actions: [
            IconButton(
              tooltip: 'Zoom out',
              icon: const Icon(Icons.zoom_out, color: Colors.white),
              onPressed: () {
                setState(() =>
                    _userZoom = (_zoomNotifier.value - 0.1).clamp(0.1, 5.0));
              },
            ),
            SizedBox(
              width: 48,
              child: Center(
                child: ValueListenableBuilder<double>(
                  valueListenable: _zoomNotifier,
                  builder: (_, zoom, _) => Text(
                    '${(zoom * 100).toInt()}%',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 12),
                  ),
                ),
              ),
            ),
            IconButton(
              tooltip: 'Zoom in',
              icon: const Icon(Icons.zoom_in, color: Colors.white),
              onPressed: () {
                setState(() =>
                    _userZoom = (_zoomNotifier.value + 0.1).clamp(0.1, 5.0));
              },
            ),
            IconButton(
              tooltip: 'Fit width',
              icon: const Icon(Icons.fit_screen, color: Colors.white),
              onPressed: () => setState(() => _userZoom = null),
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final zoom = _userZoom ?? _autoFitZoom(constraints.maxWidth);
            if (_zoomNotifier.value != zoom) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) _zoomNotifier.value = zoom;
              });
            }

            final zW = _paperW * zoom;
            final zH = _paperH * zoom;

            return GestureDetector(
              onScaleStart: (_) => _pinchBaseZoom = zoom,
              onScaleUpdate: (d) {
                if (d.pointerCount >= 2) {
                  setState(() => _userZoom =
                      (_pinchBaseZoom * d.scale).clamp(0.1, 5.0));
                }
              },
              child: ScrollConfiguration(
                behavior: _scrollBehavior,
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(_shellPad),
                      child: Column(
                        children: [
                          for (int i = 0; i < widget.pages.length; i++)
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: _gapAfter(i) * zoom),
                              child: Container(
                                width: zW,
                                height: zH,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x40000000),
                                        blurRadius: 10,
                                        offset: Offset(0, 4)),
                                  ],
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: _ScaledContent(
                                  key: ValueKey(i),
                                  content: widget.pages[i],
                                  paperWidth: _paperW,
                                  paperHeight: _paperH,
                                  pagePadding: widget.pagePadding,
                                  fitHeight: widget.fitHeight,
                                  zoom: zoom,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ── _ScaledContent ───────────────────────────────────────────────────────────
class _ScaledContent extends StatefulWidget {
  final Widget content;
  final double paperWidth;
  final double paperHeight;
  final EdgeInsets pagePadding;
  final bool fitHeight;
  final double zoom;

  const _ScaledContent({
    super.key,
    required this.content,
    required this.paperWidth,
    required this.paperHeight,
    required this.pagePadding,
    this.fitHeight = true,
    required this.zoom,
  });

  @override
  State<_ScaledContent> createState() => _ScaledContentState();
}

class _ScaledContentState extends State<_ScaledContent> {
  final _measureKey = GlobalKey();
  Size? _natural;

  @override
  void initState() {
    super.initState();
    _scheduleMeasure();
  }

  @override
  void didUpdateWidget(covariant _ScaledContent old) {
    super.didUpdateWidget(old);
    if (old.content != widget.content) {
      _natural = null;
      _scheduleMeasure();
    }
  }

  void _scheduleMeasure() {
    WidgetsBinding.instance.addPostFrameCallback(_measure);
  }

  void _measure(_) {
    if (!mounted) return;
    final rb =
        _measureKey.currentContext?.findRenderObject() as RenderBox?;
    if (rb != null && rb.hasSize && rb.size != _natural) {
      setState(() => _natural = rb.size);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pad = widget.pagePadding;
    final nat = _natural;
    final contentW = widget.paperWidth - pad.left - pad.right;
    final contentH = widget.paperHeight - pad.top - pad.bottom;
    double scale;
    if (nat == null || nat.width <= 0) {
      scale = 1.0;
    } else {
      final scaleW = contentW / nat.width;
      scale = (widget.fitHeight && nat.height > 0)
          ? scaleW.clamp(0, contentH / nat.height)
          : scaleW;
    }
    final effectiveScale = nat != null ? scale * widget.zoom : 0.0;

    // When fitHeight shrinks scale, content is narrower than content area.
    // Calculate extra horizontal space and split evenly to centre content.
    final scaledW = (nat != null) ? nat.width * scale : contentW;
    final extraH = ((contentW - scaledW) / 2).clamp(0.0, double.infinity);

    final effectivePad = EdgeInsets.fromLTRB(
      (pad.left + extraH) * widget.zoom,
      pad.top * widget.zoom,
      (pad.right + extraH) * widget.zoom,
      pad.bottom * widget.zoom,
    );

    return Padding(
      padding: effectivePad,
      child: Transform.scale(
        scale: effectiveScale,
        alignment: Alignment.topLeft,
        child: OverflowBox(
          minWidth: 0,
          minHeight: 0,
          maxWidth: nat?.width ?? double.infinity,
          maxHeight: nat?.height ?? double.infinity,
          alignment: Alignment.topLeft,
          child: UnconstrainedBox(
            alignment: Alignment.topLeft,
            child: Container(
              key: _measureKey,
              child: widget.content,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Scroll behaviour ─────────────────────────────────────────────────────────
class _ScrollBehavior extends ScrollBehavior {
  const _ScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
