import 'package:dio/dio.dart';
import 'package:pruebawather/model/weather.dart';
import 'package:pruebawather/model/weatherforecast.dart';

class WeatherService {
  final dio = Dio();
    final apiKey = '92c99d97ea3e5a336ec1ddc7838c6300';
    
  Future<WeatherResponse> getWeatherFromCoordinates(double latitude, double longitude) async {
    
    final url = 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
       
       final jsonData = response.data;
       print(jsonData);
        return WeatherResponse.fromJson(jsonData);
      
      } else {
        throw Exception('Failed to retrieve data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Future<WeatherForeCastModel> getWeatherForeCastFromCoordinates(double latitude, double longitude) async {

  //   final url = 'api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey';

  //   try {
  //     final response = await dio.get(url);
  //     if (response.statusCode == 200) {
       
  //      final jsonData = response.data;
  //      print(jsonData);
  //       return WeatherForeCastModel.fromJson(jsonData);
      
  //     } else {
  //       throw Exception('Failed to retrieve data');
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  // }
  Stream<WeatherForeCastModel> getWeatherForeCastFromCoordinates(double latitude, double longitude) async* {
  final url = 'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey';
  try {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final jsonData = response.data;
      yield WeatherForeCastModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to retrieve data');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
}