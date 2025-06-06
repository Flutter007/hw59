import 'package:flutter/material.dart';

class FeStyleText extends StatelessWidget {
  final String text;
  const FeStyleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'FESchrift',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
