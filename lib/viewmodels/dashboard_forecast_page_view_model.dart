import 'package:empty_app/models/forecast_base/forecast_base_model.dart';
import 'package:empty_app/redux/actions/dashboard_forecast_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class DashboardForecastPageViewModel {
  DashboardForecastPageViewModel({
    this.isLoading,
    this.isError,
    this.forecast,
    this.onRefresh
  });

  final bool isLoading;
  final bool isError;
  final ForecastBaseModel forecast;
  final VoidCallback onRefresh;

  static DashboardForecastPageViewModel fromStore(Store<AppState> store) {
    return DashboardForecastPageViewModel(
      isLoading: store.state.dashboardForecastPageState.isLoading,
      forecast: store.state.dashboardForecastPageState.forecast,
      isError: store.state.dashboardForecastPageState.isError,
      onRefresh: () => _onRefresh(store)
    );
  }

  static void _onRefresh(Store<AppState> store) {
    store.dispatch(FetchForecastWeatherAction(store.state.cityName));
  }
}