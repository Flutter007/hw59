import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/widgets/add_car_form/add_car_controllers.dart';
import 'package:hw59/widgets/custom_text_form_field.dart';
import '../../providers/car_color_provider.dart';
import '../color_circle_container.dart';

class AddAutoForm extends ConsumerStatefulWidget {
  final AddCarControllers controllers;
  final bool isColorError;
  final void Function()? addNewAuto;
  const AddAutoForm({
    super.key,
    required this.controllers,
    required this.addNewAuto,
    required this.isColorError,
  });

  @override
  ConsumerState<AddAutoForm> createState() => _AddAutoFormState();
}

class _AddAutoFormState extends ConsumerState<AddAutoForm> {
  @override
  Widget build(BuildContext context) {
    final autoColors = ref.watch(colorsProvider);
    return Form(
      key: widget.controllers.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            labelText: 'Enter Auto Model',
            helperText: 'Example: Toyota Camry 80',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Auto Model';
              }
              return null;
            },
            controller: widget.controllers.modelController,
          ),
          SizedBox(height: 20),
          DropdownMenu(
            label: Text('Choose Color'),
            width: 200,
            menuHeight: 260,
            onSelected: (value) {
              ref.read(selectedColorProvider.notifier).state = value;
            },
            errorText: widget.isColorError ? 'Please choose color' : null,
            dropdownMenuEntries:
                autoColors
                    .map(
                      (c) => DropdownMenuEntry(
                        value: c.id,
                        label: c.title,
                        trailingIcon: ColorCircleContainer(color: c.color),
                      ),
                    )
                    .toList(),
          ),
          CustomTextFormField(
            labelText: 'Enter State Number',
            helperText: 'Example: 01KG717XXX',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter State Number';
              }
              if (value.length != 10 || !value.contains('KG')) {
                return 'Check State Number';
              }
              return null;
            },
            controller: widget.controllers.stateNumberController,
          ),
          CustomTextFormField(
            labelText: 'Enter Driver Name',
            helperText: 'Example: John Smith',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Driver Name';
              }

              return null;
            },
            controller: widget.controllers.driverNameController,
          ),
          ElevatedButton(onPressed: widget.addNewAuto, child: Text('Add +')),
        ],
      ),
    );
  }
}
