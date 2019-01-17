import 'package:empty_app/models/forecast_base/forecast_base_model.dart';

class DashboardForecastPageState {
  DashboardForecastPageState({
    this.isLoading,
    this.isError,
    this.forecast
  });

  final bool isLoading;
  final bool isError;
  final ForecastBaseModel forecast;

  DashboardForecastPageState copyWith({
    bool isLoading,
    bool isError,
    ForecastBaseModel forecast
  }) {
    return DashboardForecastPageState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      forecast: forecast ?? this.forecast
    );
  }

  static DashboardForecastPageState initial() {
    return DashboardForecastPageState(
      isLoading: true,
      isError: false,
      forecast: null
    );
  }
}