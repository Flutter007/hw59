import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/models/car_color.dart';
import '../data/car_colors_data.dart';

final colorsProvider = Provider<List<CarColor>>((ref) {
  return carColors;
});

final selectedColorProvider = StateProvider<String?>((ref) => null);

final colorByIdProvider = Provider.family<CarColor, String>((ref, id) {
  final colors = ref.watch(colorsProvider);
  return colors.firstWhere((element) => element.id == id);
});

final colorByTitleProvider = Provider.family<CarColor, String>((ref, title) {
  final colors = ref.watch(colorsProvider);
  return colors.firstWhere((element) => element.title == title);
});
