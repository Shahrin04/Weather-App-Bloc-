part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {}

class WeatherIsNotSearched extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherIsLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherIsNotLoaded extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherIsLoaded extends WeatherState {
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  List<Object> get props => [_weather];
}
