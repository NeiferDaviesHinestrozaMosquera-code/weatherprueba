import 'package:flutter/material.dart';
import 'package:pruebawather/home/widgets/texts.dart';
import 'package:pruebawather/model/weather.dart';

class weatherTodayWidget extends StatelessWidget {
  const weatherTodayWidget({
    super.key,
    required this.weather,
    required String country,
    required String city,
  }) : _country = country, _city = city;

  final WeatherResponse? weather;
  final String _country;
  final String _city;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 250,
    child: Card(
      color: Colors.blueAccent,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Image.network(
                'http://openweathermap.org/img/w/${weather!.weather[0].icon}.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Country: $_country"),
                CustomText(text: "City: $_city"),
                CustomText(text: 'Latitud: ${weather!.coord.lat}'),
                CustomText(text: 'Longitud: ${weather!.coord.lon}'),
                CustomText(text: "Weather forecast: ${weather!.weather[0].description}"),
     
              ],
            ),
            
          ),
          
        ],
      ),
    ),
    
   );
  }
}