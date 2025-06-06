import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/screens/add_auto_screen.dart';

import '../widgets/car_number_container.dart';

class AutoListScreen extends ConsumerStatefulWidget {
  const AutoListScreen({super.key});

  @override
  ConsumerState<AutoListScreen> createState() => _AutoListScreenState();
}

class _AutoListScreenState extends ConsumerState<AutoListScreen> {
  void goToAddScreen() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => AddAutoScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attractor Taxi'),
        actions: [IconButton(onPressed: goToAddScreen, icon: Icon(Icons.add))],
      ),
      body: Column(children: [CarNumberContainer()]),
    );
  }
}
