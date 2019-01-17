import 'package:empty_app/models/current_weather/current_weather_model.dart';
import 'package:empty_app/models/location/location_model.dart';
import 'package:empty_app/other/service_locator.dart';
import 'package:empty_app/redux/actions/dashboard_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/redux/dashboard/dashboard_page_state.dart';
import 'package:empty_app/resources/translations_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

typedef void ChangeTemperature(TemperatureTypeEnum temperatureTypeEnum);

class DashboardPageViewModel {
  DashboardPageViewModel({
    @required this.cityName,
    @required this.weatherModel,
    @required this.locationModel,
    @required this.isLoading,
    @required this.temperatureType,
    @required this.changeTemperatureFormat
  });
  
  final String cityName;
  final CurrentWeatherModel weatherModel;
  final LocationModel locationModel;
  final bool isLoading;
  final TemperatureTypeEnum temperatureType;
  final ChangeTemperature changeTemperatureFormat;

  static DashboardPageViewModel fromStore(Store<AppState> store) {
    return DashboardPageViewModel(
      cityName: store.state.cityName,
      isLoading: store.state.dashboardPageState.isLoading,
      locationModel: store.state.dashboardPageState.locationModel,
      weatherModel: store.state.dashboardPageState.weatherModel,
      temperatureType: store.state.dashboardPageState.temperatureType,
      changeTemperatureFormat: (format) => _changeTemperatureFormat(store, format)
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

  String getCondition() {
    int conditionCode = weatherModel.condition.code;
    var translator = serviceLocator.get<TranslationsHelper>();
    String translatedCondition = translator.translateConditionByCode("Polish", conditionCode);
    return translatedCondition ?? weatherModel.condition.description;
  }

  static void _changeTemperatureFormat(Store<AppState> store, TemperatureTypeEnum temperatureTypeEnum) {
    store.dispatch(ChangeTemperatureFormatAction(temperatureTypeEnum));
  }

  double getTemperature() {
    return temperatureType == TemperatureTypeEnum.F
      ? weatherModel.tempF
      : weatherModel.tempC;
  }

  double getFeelslikeTemperature() {
    return temperatureType == TemperatureTypeEnum.F
    ? weatherModel.feelTempF
    : weatherModel.feelTempC;
  }
}