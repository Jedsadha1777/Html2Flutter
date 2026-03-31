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

  double? _userZoom;
  double _pinchBaseZoom = 1.0;
  double _lastLayoutWidth = 0;
  final _vScrollCtrl = ScrollController();
  final _hScrollCtrl = ScrollController();

  double get _paperW => widget.orientation == PageOrientation.portrait
      ? _a4Short
      : _a4Long;
  double get _paperH => widget.orientation == PageOrientation.portrait
      ? _a4Long
      : _a4Short;

  double _autoFitZoom(double viewportWidth) =>
      ((viewportWidth - _shellPad * 2) / _paperW).clamp(0.1, 1.0);

  double get _zoom => _userZoom ??
      (_lastLayoutWidth > 0 ? _autoFitZoom(_lastLayoutWidth) : 1.0);

  double _gapAfter(int index) {
    if (index >= widget.pages.length - 1) return 0;
    final gaps = widget.pageGaps;
    if (gaps == null || gaps.isEmpty) return _defaultGap;
    if (gaps.length == 1) return gaps[0];
    return index < gaps.length ? gaps[index] : gaps.last;
  }

  void _setZoom(double z) {
    final oldZoom = _zoom;
    setState(() => _userZoom = z.clamp(0.1, 5.0));
    _normalizeScroll(oldZoom, _userZoom!);
  }

  void _normalizeScroll(double oldZoom, double newZoom) {
    if (oldZoom == newZoom || oldZoom == 0) return;
    final ratio = newZoom / oldZoom;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_vScrollCtrl.hasClients &&
          _vScrollCtrl.position.maxScrollExtent > 0) {
        _vScrollCtrl.jumpTo((_vScrollCtrl.offset * ratio)
            .clamp(0.0, _vScrollCtrl.position.maxScrollExtent));
      }
      if (_hScrollCtrl.hasClients &&
          _hScrollCtrl.position.maxScrollExtent > 0) {
        _hScrollCtrl.jumpTo((_hScrollCtrl.offset * ratio)
            .clamp(0.0, _hScrollCtrl.position.maxScrollExtent));
      }
    });
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
    _vScrollCtrl.dispose();
    _hScrollCtrl.dispose();
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
            onPressed: () => _setZoom(_zoom - 0.1),
          ),
          SizedBox(
            width: 48,
            child: Center(
              child: Text('${(_zoom * 100).toInt()}%',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 12)),
            ),
          ),
          IconButton(
            tooltip: 'Zoom in',
            icon: const Icon(Icons.zoom_in, color: Colors.white),
            onPressed: () => _setZoom(_zoom + 0.1),
          ),
          IconButton(
            tooltip: 'Fit width',
            icon: const Icon(Icons.fit_screen, color: Colors.white),
            onPressed: () {
              final old = _zoom;
              setState(() => _userZoom = null);
              _normalizeScroll(old, _zoom);
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (_lastLayoutWidth != constraints.maxWidth) {
            _lastLayoutWidth = constraints.maxWidth;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) setState(() {});
            });
          }
          final zoom = _zoom;
          final zW = _paperW * zoom;
          final zH = _paperH * zoom;
          final fitsH = zW + _shellPad * 2 <= constraints.maxWidth;

          return RawGestureDetector(
            gestures: <Type, GestureRecognizerFactory>{
              ScaleGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                      ScaleGestureRecognizer>(
                () => ScaleGestureRecognizer(),
                (instance) {
                  instance.onStart = (_) => _pinchBaseZoom = zoom;
                  instance.onUpdate = (d) {
                    if (d.pointerCount >= 2) {
                      _setZoom(_pinchBaseZoom * d.scale);
                    }
                  };
                },
              ),
            },
            child: ScrollConfiguration(
              behavior: const _WebDragScrollBehavior(),
              child: SingleChildScrollView(
                controller: _vScrollCtrl,
                child: SingleChildScrollView(
                  controller: _hScrollCtrl,
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                    ),
                    child: Align(
                      alignment: fitsH
                          ? Alignment.topCenter
                          : Alignment.topLeft,
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
                                  child: RepaintBoundary(
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
                              ),
                          ],
                        ),
                      ),
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
    final effectiveScale = nat != null ? scale * widget.zoom : 1.0;
    final measured = nat != null;

    final scaledW = (nat != null) ? nat.width * scale : contentW;
    final extraH = ((contentW - scaledW) / 2).clamp(0.0, double.infinity);

    final effectivePad = EdgeInsets.fromLTRB(
      (pad.left + extraH) * widget.zoom,
      pad.top * widget.zoom,
      (pad.right + extraH) * widget.zoom,
      pad.bottom * widget.zoom,
    );

    return Visibility(
      visible: measured,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Padding(
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
      ),
    );
  }
}

// ── Scroll behaviour — allow mouse drag to scroll on web/desktop ─────────────
class _WebDragScrollBehavior extends ScrollBehavior {
  const _WebDragScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
