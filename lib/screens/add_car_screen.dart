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

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void addAuto() async {
    bool isColorSelected = checkColorState();
    if (controllers.formKey.currentState!.validate() && isColorSelected) {
      final colorId = ref.read(selectedColorProvider);
      await ref
          .read(createCarProvider.notifier)
          .createCar(colorId, controllers);
      if (mounted) {
        ref.invalidate(carListProvider);
        clearForm();
      }
    }
  }

  void clearForm() {
    controllers.driverNameController.clear();
    controllers.modelController.clear();
    controllers.stateNumberController.clear();
    ref.read(selectedColorProvider.notifier).state = null;
  }

  void checkStatusOfAction() {
    ref.listen(createCarProvider, (prev, next) {
      next.whenOrNull(
        data: (d) {
          _showSnackBar('Successfully added');
        },
        error: (e, stack) {
          _showSnackBar('Something went wrong');
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
