import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddAutoScreen extends ConsumerStatefulWidget {
  const AddAutoScreen({super.key});

  @override
  ConsumerState<AddAutoScreen> createState() => _AddAutoScreenState();
}

class _AddAutoScreenState extends ConsumerState<AddAutoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new Auto !')),
      body: Center(child: Text('Add new Auto !')),
    );
  }
}
