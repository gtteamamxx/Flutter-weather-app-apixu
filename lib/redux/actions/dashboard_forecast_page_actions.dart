import 'package:empty_app/redux/actions/app_actions.dart';

class FetchForecastWeatherAction {
  FetchForecastWeatherAction(this.cityName);
  final String cityName;
}

class ReceivedForecastWeatherAction {
  ReceivedForecastWeatherAction();
}

class ErrorLoadingForecastWeatherAction extends ErrorBaseAction {
  ErrorLoadingForecastWeatherAction() : super("Wystąpił problem podczas wczytywania pogody dla nastepnych dni");
}