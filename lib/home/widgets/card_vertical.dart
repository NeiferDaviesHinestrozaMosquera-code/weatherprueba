import 'package:flutter/material.dart';
import 'package:pruebawather/home/widgets/card_details/card_details.dart';
import 'package:pruebawather/home/widgets/card_image/card_image.dart';
import 'package:pruebawather/home/widgets/texts.dart';

class CardVertical extends StatelessWidget {
  const CardVertical({
    super.key,
    this.child,
    required this.title,
    required this.subTitle,
    required this.weatherIcon,
    required this.weatherMax,
    required this.weatherMin,
  });

  final Widget? child;
  final String title;
  final String subTitle;
  final String weatherIcon;
  final String weatherMax;
  final String weatherMin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tocaste la card en clima de home");
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.grey,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.green, Colors.pink])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(text: title),

              /// Thumbnail Container
              ImageWeatherIcon(weatherIcon: weatherIcon),

              CustomText(
                text: subTitle,
                fontSize: 20,
              ),

              /// Details
              DetailsWeather(weatherMin: weatherMin, weatherMax: weatherMax),
            ],
          ),
        ),
      ),
    );
  }
}

