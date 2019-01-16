import 'package:empty_app/models/current_weather/current_weather_model.dart';
import 'package:empty_app/models/location/location_model.dart';

class DashboardPageState {
  DashboardPageState({
    this.weatherModel,
    this.locationModel,
    this.isLoading
  });

  final CurrentWeatherModel weatherModel;
  final LocationModel locationModel;
  final bool isLoading;

  DashboardPageState copyWith({
    CurrentWeatherModel weatherModel,
    LocationModel locationModel,
    bool isLoading
  }) {
    return DashboardPageState(
      isLoading: isLoading ?? this.isLoading,
      locationModel: locationModel ?? this.locationModel,
      weatherModel: weatherModel ?? this.weatherModel
    );
  }

  static DashboardPageState initial() {
    return DashboardPageState(
      isLoading: false,
      locationModel: null,
      weatherModel: null
    );
  }
}