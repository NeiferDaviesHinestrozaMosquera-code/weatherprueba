import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pruebawather/home/widgets/card_vertical.dart';
import 'package:pruebawather/home/widgets/weather/weather_today.dart';
import 'package:pruebawather/home/widgets/widgets.dart';
import 'package:pruebawather/model/weather.dart';
import 'package:pruebawather/model/weatherforecast.dart';
import 'package:pruebawather/service/api/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late  Future<WeatherResponse?> _futureWeather;
  late Stream<WeatherForeCastModel?> _weatherForecastStream;
  String _country = '';
  String _city = '';
  final WeatherService _weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    _futureWeather = determinePositionAndFetchWeather();
    _weatherForecastStream = fetchWeatherForecast();
    _refreshWeather();
  }

  Future<WeatherResponse?> determinePositionAndFetchWeather() async {

    Position position = await _getCurrentPosition();


    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      setState(() {
        _country = placemark.country ?? '';
        _city = placemark.locality ?? '';
      });
    }

    WeatherResponse? weather = await _weatherService.getWeatherFromCoordinates(position.latitude, position.longitude);
    return weather;
  }

  Stream<WeatherForeCastModel?> fetchWeatherForecast() async* {
    Position position = await _getCurrentPosition();
    yield* _weatherService.getWeatherForeCastFromCoordinates(position.latitude, position.longitude);
  }

  Future<Position> _getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _refreshWeather() async {
    setState(() {
      _futureWeather = determinePositionAndFetchWeather();
      _weatherForecastStream = fetchWeatherForecast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getOtherScreenAppBar("Weather", _refreshWeather, context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<WeatherResponse?>(
              future: _futureWeather,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return getAnimatedSnackbarError('Error: ${snapshot.error}', context);
                } else {
                  WeatherResponse? weather = snapshot.data;
                  if (weather == null) {
                    return const Center(child: Text('Error fetching weather data'));
                  }
                  getAnimatedSnackbarSuccess("Good Day, Good Luck", context);
                  return Column(
                    children: [
                      weatherTodayWidget(weather: weather, country: _country, city: _city),
                    ],
                  );
                }
              },
            ),

            const SizedBox(height: 10),
            CustomText(text: "Forecast of the week", fontSize: 30, color: Colors.black),
            const SizedBox(height: 5),
           StreamBuilder<WeatherForeCastModel?>(
              stream: _weatherForecastStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(),);
                } else if (snapshot.hasError) {

                  return Center(child: Text('${snapshot.error}'));
                } else {
                  WeatherForeCastModel? forecast = snapshot.data!;
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
                           weatherMax: ' ${currentDay.main.tempMax}°C', 
                           weatherMin: ' ${currentDay.main.tempMin}°C',
                        );
                      },
                    ),
                  );
                
                }
              },
            ),
          
            CustomText(text: "Nirobi.dev", color: Colors.black.withOpacity(0.2)),
          ],
        ),
      ),
    );
  }
}