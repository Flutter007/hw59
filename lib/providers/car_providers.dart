import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/helpers/request.dart';
import 'package:hw59/models/car.dart';

import '../widgets/add_car_form/add_car_controllers.dart';
import 'car_color_provider.dart';

final baseUrl =
    'https://my-db-7777-default-rtdb.europe-west1.firebasedatabase.app';
final carListProvider = FutureProvider<List<Car>>((ref) async {
  final url = '$baseUrl/cars.json';
  final Map<String, dynamic>? response = await request(url);
  if (response == null) {
    return [];
  }
  final List<Car> newCars = [];
  for (var key in response.keys) {
    final car = Car.fromJson({...response[key], 'id': key});
    newCars.add(car);
  }
  return newCars;
});

class CreateCarNotifier extends AsyncNotifier<void> {
  @override
  build() {}
  Future<void> createCar(String? colorId, AddCarControllers controller) async {
    final color = ref.read(colorByIdProvider(colorId!));
    final url = '$baseUrl/cars.json';
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final car = Car(
        model: controller.modelController.text.toUpperCase(),
        color: color.title,
        stateNumber: controller.stateNumberController.text,
        driverName: controller.driverNameController.text,
        status: 'Is Busy',
      );

      await request(url, method: 'POST', body: car.toJson());
    });
  }
}

final createCarProvider = AsyncNotifierProvider<CreateCarNotifier, void>(
  CreateCarNotifier.new,
);
