import 'package:meta/meta.dart';
import 'dart:convert';

class WeatherForeCastModel {
    final String cod;
    final int message;
    final int cnt;
    final List<ListElement> list;
    final City city;

    WeatherForeCastModel({
        required this.cod,
        required this.message,
        required this.cnt,
        required this.list,
        required this.city,
    });

    factory WeatherForeCastModel.fromRawJson(String str) => WeatherForeCastModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeatherForeCastModel.fromJson(Map<String, dynamic> json) => WeatherForeCastModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
    );

    Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "city": city.toJson(),
    };
}

class City {
    final int id;
    final String name;
    final Coord coord;
    final String country;
    final int population;
    final int timezone;
    final int sunrise;
    final int sunset;

    City({
        required this.id,
        required this.name,
        required this.coord,
        required this.country,
        required this.population,
        required this.timezone,
        required this.sunrise,
        required this.sunset,
    });

    factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Coord {
    final double lat;
    final double lon;

    Coord({
        required this.lat,
        required this.lon,
    });

    factory Coord.fromRawJson(String str) => Coord.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
    };
}

class ListElement {
    final int dt;
    final MainClass main;
    final List<Weather> weather;
    final Clouds clouds;
    final Wind wind;
    final int visibility;
    final int pop;
    final Sys sys;
    final DateTime dtTxt;

    ListElement({
        required this.dt,
        required this.main,
        required this.weather,
        required this.clouds,
        required this.wind,
        required this.visibility,
        required this.pop,
        required this.sys,
        required this.dtTxt,
    });

    factory ListElement.fromRawJson(String str) => ListElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"],
        sys: Sys.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds.toJson(),
        "wind": wind.toJson(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys.toJson(),
        "dt_txt": dtTxt.toIso8601String(),
    };
}

class Clouds {
    final int all;

    Clouds({
        required this.all,
    });

    factory Clouds.fromRawJson(String str) => Clouds.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class MainClass {
    final double temp;
    final double feelsLike;
    final double tempMin;
    final double tempMax;
    final int pressure;
    final int seaLevel;
    final int grndLevel;
    final int humidity;
    final double tempKf;

    MainClass({
        required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.seaLevel,
        required this.grndLevel,
        required this.humidity,
        required this.tempKf,
    });

    factory MainClass.fromRawJson(String str) => MainClass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
    };
}

class Sys {
    final Pod pod;

    Sys({
        required this.pod,
    });

    factory Sys.fromRawJson(String str) => Sys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]]!,
    );

    Map<String, dynamic> toJson() => {
        "pod": podValues.reverse[pod],
    };
}

enum Pod {
    D,
    N
}

final podValues = EnumValues({
    "d": Pod.D,
    "n": Pod.N
});

class Weather {
    final int id;
    final MainEnum main;
    final Description description;
    final String icon;

    Weather({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainEnumValues.map[json["main"]]!,
        description: descriptionValues.map[json["description"]]!,
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": icon,
    };
}

enum Description {
    BROKEN_CLOUDS,
    CLEAR_SKY,
    FEW_CLOUDS,
    OVERCAST_CLOUDS,
    SCATTERED_CLOUDS
}

final descriptionValues = EnumValues({
    "broken clouds": Description.BROKEN_CLOUDS,
    "clear sky": Description.CLEAR_SKY,
    "few clouds": Description.FEW_CLOUDS,
    "overcast clouds": Description.OVERCAST_CLOUDS,
    "scattered clouds": Description.SCATTERED_CLOUDS
});

enum MainEnum {
    CLEAR,
    CLOUDS
}

final mainEnumValues = EnumValues({
    "Clear": MainEnum.CLEAR,
    "Clouds": MainEnum.CLOUDS
});

class Wind {
    final double speed;
    final int deg;
    final double gust;

    Wind({
        required this.speed,
        required this.deg,
        required this.gust,
    });

    factory Wind.fromRawJson(String str) => Wind.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
