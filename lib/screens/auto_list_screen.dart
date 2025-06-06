import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/screens/add_auto_screen.dart';
import '../data/auto_colors_data.dart';
import '../widgets/car_number_container.dart';
import '../widgets/color_circle_container.dart';

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
      body: Column(
        children: [
          CarNumberContainer(),
          DropdownMenu(
            label: Text('Choose Color'),
            width: 200,
            menuHeight: 260,
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
        ],
      ),
    );
  }
}
