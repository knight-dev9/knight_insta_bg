library knight_insta_bg;

import 'package:flutter/material.dart';

class KnightInstaBG extends StatefulWidget {
  const KnightInstaBG(
      {Key? key,
      required this.primaryColors,
      required this.secondaryColors,
      this.child,
      this.primaryBegin = Alignment.topRight,
      this.primaryEnd = Alignment.topRight,
      this.secondaryBegin = Alignment.bottomLeft,
      this.secondaryEnd = Alignment.bottomLeft,
      this.duration = const Duration(seconds: 10)})
      : assert(primaryColors.length >= 2),
        assert(primaryColors.length == secondaryColors.length),
        super(key: key);

  /// [duration]: Time to switch between [Gradient].
  /// By default its value is [Duration(seconds:10)]
  final Duration duration;

  /// [primaryColors]: These will be the starting colors of the [Animation].
  final List<Color> primaryColors;

  /// [secondaryColors]: These Colors are those in which the [primaryColors] will transition into.
  final List<Color> secondaryColors;

  /// [primaryBegin]: This is begin [Alignment] for [primaryColors].
  /// By default its value is [Alignment.topRight]
  final Alignment primaryBegin;

  /// [primaryBegin]: This is end [Alignment] for [primaryColors].
  /// By default its value is [Alignment.topRight]
  final Alignment primaryEnd;

  /// [secondaryBegin]: This is begin [Alignment] for [secondaryColors].
  /// By default its value is [Alignment.bottomLeft]
  final Alignment secondaryBegin;

  /// [secondaryEnd]: This is end [Alignment] for [secondaryColors].
  /// By default its value is [Alignment.bottomLeft]
  final Alignment secondaryEnd;

  final Widget? child;

  @override
  State<KnightInstaBG> createState() => _KnightInstaBGState();
}

class _KnightInstaBGState extends State<KnightInstaBG> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  late List<ColorTween> _colorTween;

  late AlignmentTween begin;
  late AlignmentTween end;

  @override
  void initState() {
    _colorTween = _getColorTweens();
    begin = AlignmentTween(begin: widget.primaryBegin, end: widget.primaryEnd);
    end = AlignmentTween(begin: widget.secondaryBegin, end: widget.secondaryEnd);

    _controller = AnimationController(vsync: this, duration: widget.duration)..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: begin.evaluate(_animation),
                      end: end.evaluate(_animation),
                      colors: _evaluateColors(_animation))),
              child: widget.child);
        });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<ColorTween> _getColorTweens() {
    if (widget.primaryColors.length != widget.secondaryColors.length) {
      throw Exception('primaryColors.length != secondaryColors.length');
    }

    final List<ColorTween> colorTweens = [];

    for (int i = 0; i < widget.primaryColors.length; i++) {
      colorTweens.add(ColorTween(begin: widget.primaryColors[i], end: widget.secondaryColors[i]));
    }

    return colorTweens;
  }

  List<Color> _evaluateColors(Animation<double> animation) {
    final List<Color> colors = [];
    for (int i = 0; i < _colorTween.length; i++) {
      colors.add(_colorTween[i].evaluate(animation)!);
    }
    return colors;
  }
}
