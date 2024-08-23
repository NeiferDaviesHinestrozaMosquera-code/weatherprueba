import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pruebawather/model/weather.dart';
import 'package:pruebawather/service/api/api.dart';

Future<WeatherResponse?> determinePositionAndFetchWeather(Position position) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  if (placemarks.isNotEmpty) {
    Placemark placemark = placemarks.first;
    WeatherService weatherService = WeatherService();
    WeatherResponse? weather = await weatherService.getWeatherFromCoordinates(position.latitude, position.longitude);
    return weather;
  }
  return null;
}
