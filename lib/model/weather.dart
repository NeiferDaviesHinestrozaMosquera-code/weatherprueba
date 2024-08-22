class WeatherResponse {
  final Coord coord;
  final List<Weather> weather;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherResponse({
    required this.coord,
    required this.weather,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    var weatherList = json['weather'] as List;
    List<Weather> weatherItems = weatherList.map((i) => Weather.fromJson(i)).toList();

    return WeatherResponse(
      coord: Coord.fromJson(json['coord']),
      weather: weatherItems,
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'].toDouble(),
      lat: json['lat'].toDouble(),
    );
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({required this.id, required this.main, required this.description, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
