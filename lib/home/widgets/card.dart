// widgets/weather_card.dart

import 'package:flutter/material.dart';
import 'package:pruebawather/model/weather.dart';

class WeatherCard extends StatelessWidget {
    final  WeatherResponse weather;

  WeatherCard(this.weather);

  @override
  Widget build(BuildContext context) {
   
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Título
            Text(
              weather.coord.lat.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              weather.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Icono
            // Image.network(
            //   'http://openweathermap.org/img/w/${weather.weather[0].icon}.png',
            //   width: 50,
            //   height: 50,
            // ),
            // Descripción
            Text(
              weather.weather[0].description,
              style: TextStyle(fontSize: 18),
            ),
            // Temperatura
            // Text(
            //   'Temperatura: ${weather.main!.temp}°C',
            //   style: TextStyle(fontSize: 18),
            // ),
          ],
        ),
      ),
    );
  }
}