import 'package:flutter/material.dart';

class ColorCircleContainer extends StatelessWidget {
  final Color color;
  const ColorCircleContainer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        border: Border.all(width: 2),
      ),
    );
  }
}
