import 'package:empty_app/models/current_weather/current_weather_model.dart';
import 'package:empty_app/models/location/location_model.dart';
import 'package:empty_app/redux/actions/dashboard_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class DashboardViewModel {
  DashboardViewModel({
    @required this.cityName,
    @required this.weatherModel,
    @required this.locationModel,
    @required this.isLoading
  });
  
  final String cityName;
  final CurrentWeatherModel weatherModel;
  final LocationModel locationModel;
  final bool isLoading;

  static DashboardViewModel fromStore(Store<AppState> store) {
    return DashboardViewModel(
      cityName: store.state.cityName,
      isLoading: store.state.dashboardPageState.isLoading,
      locationModel: store.state.dashboardPageState.locationModel,
      weatherModel: store.state.dashboardPageState.weatherModel
    );
  }

  String getLastUpdateDate() {
    DateTime date = DateTime.parse(weatherModel.lastUpdate);
    if(date == null) return '00:00';
    int hours = date.hour;
    int minutes = date.minute;
    return "${hours >= 10 ? hours: '0' + hours.toString()}:${minutes >= 10 ? minutes : '0' + minutes.toString()}";
  }

  String getConditionImageUrl() {
    final String url = weatherModel.condition.iconUrl;
    final String fixedUrl = "http://" + url.substring(2);
    return fixedUrl;
  }
}