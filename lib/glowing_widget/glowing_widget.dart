import 'dart:ui';

import 'package:flutter/material.dart';
import 'drop_shadow.dart';


class GlowingWidget extends StatefulWidget {
  final Widget child;
  final Offset size;
  final double blurRadius;

  final void Function()? onTap;

  final Color shadowColor;
  final Duration shadowDuration;

  const GlowingWidget({
    super.key,
    required this.child,
    this.onTap,
    this.blurRadius = 20,
    this.size = const Offset(500, 230),
    this.shadowColor = const Color(0xFFCD3246),
    this.shadowDuration = const Duration(milliseconds: 600)
  });

  @override
  State<GlowingWidget> createState() => _GlowingWidgetState();
}

class _GlowingWidgetState extends State<GlowingWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    return SizedBox.fromSize(
      size: Size(widget.size.dx, widget.size.dy),
      child: MouseRegion(
        opaque: true,
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: .0, end: isHovered ? 1 : .0),
          duration: widget.shadowDuration,
          builder: (_, double value, Widget? child) {
            return InkWell(
                onTap: () => widget.onTap != null ? widget.onTap!() : null,
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                child: DropShadow(
                  blurRadius: widget.blurRadius,
                  blurRadius2: value * widget.blurRadius,
                  opacity: value,
                  color: widget.shadowColor,
                  offset: const Offset(0, 0),
                  child: widget.child,
                ));
          },
        ),
      ),
    );
  }
}