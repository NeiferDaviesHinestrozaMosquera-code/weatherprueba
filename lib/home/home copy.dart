import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pruebawather/home/widgets/app.dart';
import 'package:pruebawather/home/widgets/card.dart'; // Asegúrate de que este widget esté definido correctamente
import 'package:pruebawather/home/widgets/card_vertical.dart';
import 'package:pruebawather/home/widgets/common.dart';
import 'package:pruebawather/home/widgets/texts.dart';
import 'package:pruebawather/model/weather.dart';
import 'package:pruebawather/model/weatherforecast.dart';
import 'package:pruebawather/service/api/api.dart';

class HomeScreenOto extends StatefulWidget {
  const HomeScreenOto({super.key});

  @override
  State<HomeScreenOto> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenOto> {
  late final Future<WeatherResponse?> _futureWeather;
  late  final Stream<WeatherForeCastModel?> _weatherForecastStream = fetchWeatherForecast();
  String _country = '';
  String _city = '';
  final WeatherService _weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
  }

 Future<WeatherResponse?> determinePositionAndFetchWeather() async {
    // Lógica para obtener el clima actual
    Position position = await Geolocator.getCurrentPosition();
    // Realizar geocodificación inversa para obtener el nombre del país y la ciudad
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      setState(() {
        _country = placemark.country ?? '';
        _city = placemark.locality ?? '';
      });
    }
    WeatherService weatherService = WeatherService();
    WeatherResponse? weather = await weatherService.getWeatherFromCoordinates(position.latitude, position.longitude);
    return weather;
  }

 Stream<WeatherForeCastModel?> fetchWeatherForecast() async* {
  // Get current position (assuming you have this logic)
  Position position = await Geolocator.getCurrentPosition();

  // Pass position coordinates to the method
  yield* _weatherService.getWeatherForeCastFromCoordinates(
      position.latitude, position.longitude);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.red,
        title: Text("Clima"),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // StreamBuilder for current weather
            FutureBuilder<WeatherResponse?>(
              future:_futureWeather ,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return showDownloading();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  WeatherResponse? weather = snapshot.data;
                  if (weather == null) {
                    return Center(child: Text('Error fetching weather data'));
                  }
                  return Column(
                    children: [
                      Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Card(
                      color: Colors.blueAccent,
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Image.network(
                                'http://openweathermap.org/img/w/${weather.weather[0].icon}.png',
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
                                CustomText(text: "Clima 3C"),
                                CustomText(text: 'Latitud: ${weather.coord.lat}'),
                                CustomText(text: 'Longitud: ${weather.coord.lon}'),
                                CustomText(text: "Weather forecast: ${weather.weather[0].description}"),
 
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                    ],
                  );
                }
              },
            ),
            Divider(color: Colors.transparent,),
            SizedBox(height: 10),
            CustomText(text: "Forecast of the week" , fontSize: 30,color: Colors.black,),
            SizedBox(height: 10),
            // StreamBuilder for forecast data
            StreamBuilder<WeatherForeCastModel?>(
              stream: _weatherForecastStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return showDownloading();
                } else if (snapshot.hasError) {
                  
                  
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  WeatherForeCastModel? forecast = snapshot.data;
                  if (forecast == null) {
                    return Center(child: Text('Error fetching forecast data'));
                  }

                  return Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: forecast.list.length , 
                      itemBuilder: (context, index) {
                        ListElement currentDay = forecast.list[index];
                        return CardVertical(
                          title: " ${currentDay.weather[0].description}",
                          subTitle: "Día ${index + 1}",
                          weatherIcon:
                              '${currentDay.weather[0].icon}',
                          weatherDescription: "Temperatura: ${currentDay.main.temp}°C",
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}