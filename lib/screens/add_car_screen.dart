import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/providers/car_providers.dart';
import 'package:hw59/widgets/add_car_form/add_car_controllers.dart';
import 'package:hw59/widgets/add_car_form/add_car_form.dart';
import '../providers/car_color_provider.dart';

class AddAutoScreen extends ConsumerStatefulWidget {
  const AddAutoScreen({super.key});

  @override
  ConsumerState<AddAutoScreen> createState() => _AddAutoScreenState();
}

class _AddAutoScreenState extends ConsumerState<AddAutoScreen> {
  final controllers = AddCarControllers();
  bool isColorSelected = false;

  void addAuto() {
    bool isColorSelected = checkColorState();
    if (controllers.formKey.currentState!.validate() && isColorSelected) {
      final colorId = ref.read(selectedColorProvider);
      ref.read(createCarProvider.notifier).createCar(colorId, controllers);
      ref.invalidate(carListProvider);
    }
  }

  void checkStatusOfAction() {
    ref.listen(createCarProvider, (prev, next) {
      next.whenOrNull(
        data: (d) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Car created succesfully')));
        },
        error: (e, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Something went wrong')));
        },
      );
    });
  }

  bool checkColorState() {
    final selectedColor = ref.read(selectedColorProvider);
    setState(() {
      isColorSelected = selectedColor == null;
    });
    return selectedColor != null;
  }

  @override
  void dispose() {
    super.dispose();
    controllers.dispose();
    ref.read(selectedColorProvider.notifier).state = null;
  }

  @override
  Widget build(BuildContext context) {
    final carState = ref.watch(createCarProvider);
    checkStatusOfAction();
    return Scaffold(
      appBar: AppBar(title: Text('Add new Auto !')),
      body: Column(
        children: [
          AddAutoForm(
            controllers: controllers,
            addNewAuto: carState.isLoading ? null : addAuto,
            isColorError: isColorSelected,
          ),
        ],
      ),
    );
  }
}
