import 'package:flutter/material.dart';

class AddCarControllers {
  final formKey = GlobalKey<FormState>();
  final modelController = TextEditingController();
  final stateNumberController = TextEditingController();
  final driverNameController = TextEditingController();

  void dispose() {
    modelController.dispose();
    stateNumberController.dispose();
    driverNameController.dispose();
  }
}
