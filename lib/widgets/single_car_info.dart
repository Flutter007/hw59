import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/car.dart';
import 'fe_style_text.dart';

class SingleCarInfo extends ConsumerWidget {
  final Car car;
  final void Function()? changeStatus;
  const SingleCarInfo(this.car, this.changeStatus, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Car model:'),
            subtitle: FeStyleText(text: car.model),
          ),
          ListTile(
            title: Text('Car color:'),
            subtitle: FeStyleText(text: car.color),
          ),
          ListTile(
            title: Text('Car number:'),
            subtitle: FeStyleText(text: car.stateNumber),
          ),
          ListTile(
            title: Text('Car driver:'),
            subtitle: FeStyleText(text: car.driverName),
          ),
          ListTile(
            title: Text('Car status:'),
            subtitle: FeStyleText(text: car.status),
            trailing: IconButton(
              onPressed: changeStatus,
              icon: Icon(Icons.refresh),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(
                  car.status == 'Free'
                      ? 'https://www.workbc.ca/sites/default/files/styles/hero_image/public/NTI5NzE_ob27OfSaD4jQkv6N-7513-NOC.jpg?itok=POFQWZhO'
                      : 'https://c8.alamy.com/comp/RFEHHT/sgp-singapore-busy-taxi-cap-RFEHHT.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
