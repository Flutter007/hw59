import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String txt;
  const CustomText({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    final titleMedium = Theme.of(context).textTheme.titleMedium;
    return Text(txt, style: titleMedium);
  }
}
