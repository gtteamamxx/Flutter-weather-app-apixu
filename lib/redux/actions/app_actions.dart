import 'package:flutter/material.dart';

class LoadCityNameFromPrefsAction { 
  final BuildContext context;

  LoadCityNameFromPrefsAction(this.context);
}

class SaveCityNameToPrefsAction {
  SaveCityNameToPrefsAction(this.cityName);
  final String cityName;
}

class ChangeCityForWeatherAction {
  final String cityName;

  ChangeCityForWeatherAction(this.cityName);
}

class ShowDashboardPageAction { 
  final BuildContext context;

  ShowDashboardPageAction(this.context);
}

abstract class ErrorBaseAction {
  ErrorBaseAction(this.error);
  final String error;
}

class ShowErrorAction {
  ShowErrorAction(this.message);
  final String message;
}

class ErrorLoadingCityForWeatherAction extends ErrorBaseAction {
  ErrorLoadingCityForWeatherAction() : super("Wystąpił błąd podczas wczytywania ostatniej lokalizacji.");
}

class ErrorSavingCityToPrefsAction extends ErrorBaseAction {
  ErrorSavingCityToPrefsAction() : super("Wystąpił problem pdoczas zapisywania lokalizacji.");
}