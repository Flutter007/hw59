import 'package:flutter/material.dart';
import 'fe_style_text.dart';

class CarNumberContainer extends StatelessWidget {
  const CarNumberContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final number = '01KG777DAG';
    return Container(
      width: 160,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: ListTile(
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FeStyleText(text: number.substring(0, 4)),
            Image.network(
              'https://st2.depositphotos.com/38921706/42791/v/450/depositphotos_427912140-stock-illustration-national-flag-kyrgyzstan-flat-color.jpg',
              width: 40,
              height: 35,
              fit: BoxFit.fill,
            ),
          ],
        ),
        title: FeStyleText(text: number.substring(4, 10)),
      ),
    );
  }
}
