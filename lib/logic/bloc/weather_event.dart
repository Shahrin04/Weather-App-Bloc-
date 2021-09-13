part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {}

class FetchWeather extends WeatherEvent {
  final _city;

  FetchWeather(this._city);

  @override
  List<Object> get props => [_city];
}

class ResetWeather extends WeatherEvent {
  @override
  List<Object> get props => [];
}
