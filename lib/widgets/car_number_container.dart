import 'package:flutter/material.dart';
import 'fe_style_text.dart';

class CarNumberContainer extends StatelessWidget {
  final String number;
  const CarNumberContainer({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Container(
        width: 130,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 2),
          color: theme.surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                FeStyleText(text: number.substring(0, 4)),
                SizedBox(height: 5),
                Image.network(
                  'https://media.istockphoto.com/id/490586402/ru/%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F/%D1%84%D0%BB%D0%B0%D0%B3-%D0%BA%D1%8B%D1%80%D0%B3%D1%8B%D0%B7%D1%81%D1%82%D0%B0%D0%BD.jpg?s=612x612&w=0&k=20&c=PtaruaUGOBUzrhLwj-GfEObtHwVDATUdmSQkXzyJuJs=',
                  width: 40,
                  height: 25,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(width: 10),
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: FeStyleText(text: number.substring(4, 10)),
            ),
          ],
        ),
      ),
    );
  }
}
