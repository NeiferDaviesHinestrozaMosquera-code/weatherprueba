import 'package:flutter/material.dart';
import 'package:pruebawather/home/widgets/card_vertical.dart';
import 'package:pruebawather/model/weatherforecast.dart';
import 'package:pruebawather/utils/card.dart';

class weatherWeekWidget extends StatelessWidget {
  const weatherWeekWidget({
    super.key,
    required this.forecast,
  });

  final WeatherForeCastModel? forecast;

  @override
  Widget build(BuildContext context) {

     if (forecast == null) {
      return const Center(
        child: Text('Error fetching forecast data'),
      );
    }
    
    return SizedBox(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: forecast!.list.length , 
        itemBuilder: (context, index) {
          ListElement currentDay = forecast!.list[index];
          return CardContainer(
            child: CardVertical(
              title: " ${currentDay.weather[0].description}",
              subTitle: "Day ${index + 1}",
              weatherIcon:'${currentDay.weather[0].icon}',
              weatherMax: "Max:${currentDay.main.tempMax}°C",
              weatherMin: "Min:${currentDay.main.tempMin}°C",
              
            ),
          );
        },
      ),
    );
  }
}

