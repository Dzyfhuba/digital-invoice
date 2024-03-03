import 'package:flutter/material.dart';

class VerticalGap extends StatelessWidget {
  final double height;

  const VerticalGap({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HorizontalGap extends StatelessWidget {
  final double width;

  const HorizontalGap({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
