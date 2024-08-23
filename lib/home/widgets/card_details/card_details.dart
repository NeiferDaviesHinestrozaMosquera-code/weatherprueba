import 'package:flutter/material.dart';
import 'package:pruebawather/home/widgets/widgets.dart';

class DetailsWeather extends StatelessWidget {
  const DetailsWeather({
    super.key,
    required this.weatherMin,
    required this.weatherMax,
  });

  final String weatherMin;
  final String weatherMax;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        CustomText(
          text: weatherMin,
          fontSize: 16,
        ),
        SizedBox(width: 20),
        CustomText(
          text: weatherMax,
          fontSize: 16,
        ),
      ],
    );
  }
}

