import 'dart:ui';

import 'package:flutter/material.dart';
import 'drop_shadow.dart';


class GlowingWidget extends StatefulWidget {
  final Widget child;
  final Offset size;

  final void Function()? onTap;

  final Color shadowColor;
  final Duration shadowDuration;

  const GlowingWidget({
    super.key,
    required this.child,
    this.onTap,
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

    return SizedBox(
      width: widget.size.dx,
      height: widget.size.dy,
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
                child: DropShadow(
                  blurRadius: 10,
                  blurRadius2: value * 10,
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