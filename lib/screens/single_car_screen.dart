import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/providers/status_provider.dart';
import 'package:hw59/widgets/event_container.dart';
import 'package:hw59/widgets/single_car_info.dart';
import '../providers/car_providers.dart';
import '../widgets/fe_style_text.dart';

class SingleCarScreen extends ConsumerStatefulWidget {
  final String id;
  const SingleCarScreen({super.key, required this.id});

  @override
  ConsumerState<SingleCarScreen> createState() => _SingleCarScreenState();
}

class _SingleCarScreenState extends ConsumerState<SingleCarScreen> {
  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void statusChange() async {
    final carValue = ref.read(singleCar(widget.id)).value;
    if (carValue == null) {
      return;
    }
    final status = carValue.status == 'Free' ? 'Busy' : 'Free';
    await ref
        .read(changeStatusProvider.notifier)
        .changeStatus(widget.id, status);
    ref.invalidate(singleCar(widget.id));
  }

  void checkStatusOfAction() {
    ref.listen(changeStatusProvider, (prev, next) {
      next.whenOrNull(
        data: (d) {
          ScaffoldMessenger.of(context).clearSnackBars();
          _showSnackBar('Successfully changed!');
        },
        error: (e, stack) {
          ScaffoldMessenger.of(context).clearSnackBars();
          _showSnackBar('Something went wrong...');
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final car = ref.watch(singleCar(widget.id));
    checkStatusOfAction();
    Widget body = switch (car) {
      AsyncData(value: final car) =>
        car == null ? Text('Loading...') : SingleCarInfo(car, statusChange),
      AsyncError() => EventContainer(
        txt: 'Something Went wrong!',
        icon: Icons.error,
      ),
      _ => Center(child: CircularProgressIndicator()),
    };
    return Scaffold(
      appBar: AppBar(
        title: FeStyleText(
          text: car.value == null ? 'Loading...' : car.value!.stateNumber,
        ),
      ),
      body: body,
    );
  }
}
