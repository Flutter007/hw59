import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/providers/car_providers.dart';
import 'package:hw59/screens/add_car_screen.dart';
import 'package:hw59/widgets/car_grid.dart';
import 'package:hw59/widgets/event_container.dart';

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
    final carState = ref.watch(carListProvider);
    Widget body = switch (carState) {
      AsyncData(value: final car) =>
        car.isEmpty
            ? EventContainer(txt: 'No Cars yet!', icon: Icons.car_crash)
            : CarGrid(),
      AsyncError() => EventContainer(txt: 'Error', icon: Icons.error),
      _ => Center(child: CircularProgressIndicator()),
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Attractor Taxi'),
        actions: [IconButton(onPressed: goToAddScreen, icon: Icon(Icons.add))],
      ),
      body: body,
    );
  }
}
