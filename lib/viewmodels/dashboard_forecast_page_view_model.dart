import 'package:empty_app/models/forecast_base/forecast_base_model.dart';
import 'package:empty_app/models/forecast_day_base/forecast_day_base_model.dart';
import 'package:empty_app/redux/actions/dashboard_forecast_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/redux/dashboard/dashboard_page_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

typedef OnSelectDay(ForecastDayBaseModel day);

class DashboardForecastPageViewModel {
  DashboardForecastPageViewModel({
    this.isLoading,
    this.isError,
    this.forecast,
    this.onRefresh,
    this.onSelectDay,
    this.selectedDay,
    this.temperatureType
  });

  final bool isLoading;
  final bool isError;
  final ForecastBaseModel forecast;
  final VoidCallback onRefresh;
  final ForecastDayBaseModel selectedDay;
  final OnSelectDay onSelectDay;
  final TemperatureTypeEnum temperatureType;

  static DashboardForecastPageViewModel fromStore(Store<AppState> store) {
    return DashboardForecastPageViewModel(
      isLoading: store.state.dashboardForecastPageState.isLoading,
      forecast: store.state.dashboardForecastPageState.forecast,
      isError: store.state.dashboardForecastPageState.isError,
      selectedDay: store.state.dashboardForecastPageState.selectedDay,
      temperatureType: store.state.dashboardPageState.temperatureType,
      onSelectDay: (ForecastDayBaseModel day) => _onSelectDay(day, store),
      onRefresh: () => _onRefresh(store)
    );
  }

  bool isSelectedDay(ForecastDayBaseModel day) {
    return selectedDay == day;
  }

  String getDayTileTime(ForecastDayBaseModel dayInfo) {
    DateTime date = DateTime.parse(dayInfo.date);
    String dayOfWeekShortDescription = _getDayOfWeekShortDescription(date.weekday);
    return "$dayOfWeekShortDescription ${date.day}";
  }

  String getDayConditionImageUrl(ForecastDayBaseModel dayInfo) {
    final String url = dayInfo.day.condition.getValidUrl();
    return url;
  }

  double getDayMaxTemperature(ForecastDayBaseModel dayInfo) {
    if(temperatureType == TemperatureTypeEnum.F) {
      return dayInfo.day.maxTempF;
    } else if(temperatureType == TemperatureTypeEnum.C) {
      return dayInfo.day.maxTempC;
    }

    return double.minPositive;
  }

  double getDayMinTemperature(ForecastDayBaseModel dayInfo) {
    if(temperatureType == TemperatureTypeEnum.F) {
      return dayInfo.day.minTempF;
    } else if(temperatureType == TemperatureTypeEnum.C) {
      return dayInfo.day.minTempC;
    }
    
    return double.minPositive;
  }

  String getDayConditionDescription(ForecastDayBaseModel dayInfo) {
    
  }

  static void _onRefresh(Store<AppState> store) {
    store.dispatch(FetchForecastWeatherAction(store.state.cityName));
  }

  static void _onSelectDay(ForecastDayBaseModel day, Store<AppState> store) {
    store.dispatch(ChangeForecastSelectedDayAction(day));
  }

  static String _getDayOfWeekShortDescription(int dayOfWeek) {
    switch(dayOfWeek) {
      case DateTime.monday: return "pon.";
      case DateTime.tuesday: return "wt.";
      case DateTime.wednesday: return "śr.";
      case DateTime.thursday: return "cz.";
      case DateTime.friday: return "pt.";
      case DateTime.saturday: return "sob.";
      case DateTime.sunday: return "niedz.";
      default: return "";
    }
  }
}