import 'package:geolocator/geolocator.dart';
import 'package:pruebawather/model/weatherforecast.dart';
import 'package:pruebawather/service/api/api.dart';

Stream<WeatherForeCastModel?> fetchWeatherForecast(Position position) async* {
  yield* WeatherService().getWeatherForeCastFromCoordinates(position.latitude, position.longitude);
}
