import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/screens/car_list_screen.dart';
import 'package:hw59/theme/light_theme.dart';

class Hw59 extends ConsumerWidget {
  const Hw59({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(theme: lightTheme, home: AutoListScreen());
  }
}
