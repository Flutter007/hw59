import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/widgets/add_auto_form/add_auto_controllers.dart';
import 'package:hw59/widgets/add_auto_form/add_auto_form.dart';

class AddAutoScreen extends ConsumerStatefulWidget {
  const AddAutoScreen({super.key});

  @override
  ConsumerState<AddAutoScreen> createState() => _AddAutoScreenState();
}

class _AddAutoScreenState extends ConsumerState<AddAutoScreen> {
  final controllers = AddAutoControllers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new Auto !')),
      body: Column(children: [AddAutoForm(controllers: controllers)]),
    );
  }
}
