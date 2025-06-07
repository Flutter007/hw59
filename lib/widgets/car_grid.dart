import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw59/providers/car_color_provider.dart';
import 'package:hw59/providers/car_providers.dart';
import 'package:hw59/widgets/car_number_container.dart';
import '../screens/single_car_screen.dart';
import 'color_circle_container.dart';
import 'custom_text.dart';

class CarGrid extends ConsumerWidget {
  const CarGrid({super.key});
  void onTap(BuildContext context, String id) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => SingleCarScreen(id: id)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cars = ref.watch(carListProvider).value ?? [];
    final theme = Theme.of(context).colorScheme;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        mainAxisExtent: 230,
      ),
      itemCount: cars.length,
      itemBuilder:
          (ctx, i) => Padding(
            padding: EdgeInsets.all(6),
            child: InkWell(
              onTap: () => onTap(context, cars[i].id!),
              child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: theme.inverseSurface, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      CarNumberContainer(number: cars[i].stateNumber),
                      CustomText(txt: cars[i].model),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(txt: cars[i].color),
                          SizedBox(width: 10),
                          ColorCircleContainer(
                            color:
                                ref
                                    .read(colorByTitleProvider(cars[i].color))
                                    .color,
                          ),
                        ],
                      ),
                      CustomText(txt: cars[i].driverName),
                      CustomText(txt: cars[i].status),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
