import 'package:flutter/material.dart';

class ImageWeatherIcon extends StatelessWidget {
  const ImageWeatherIcon({
    super.key,
    required this.weatherIcon,
  });

  final String weatherIcon;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 180,
        child: Image.network(
          'http://openweathermap.org/img/w/$weatherIcon.png',
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
