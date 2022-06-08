import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class CustomHoverButton extends StatefulWidget {
  const CustomHoverButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<CustomHoverButton> createState() => _CustomHoverButtonState();
}

class _CustomHoverButtonState extends State<CustomHoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -8, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        curve: Sprung.overDamped,
        duration: Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() => this.isHovered = isHovered);
}
