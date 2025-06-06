import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/models/auto_color.dart';

import '../data/auto_colors_data.dart';

final colorsProvider = Provider<List<AutoColor>>((ref) {
  return autoColors;
});

final selectedColorProvider = StateProvider<String?>((ref) {
  return null;
});

final colorByIdProvider = Provider.family<AutoColor, String>((ref, id) {
  final colors = ref.watch(colorsProvider);
  return colors.firstWhere((element) => element.id == id);
});
