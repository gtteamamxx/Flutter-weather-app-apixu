import 'package:empty_app/models/forecast_root_base/forecast_root_base_model.dart';
import 'package:empty_app/redux/actions/app_actions.dart';

class FetchForecastWeatherAction {
  FetchForecastWeatherAction(this.cityName);
  final String cityName;
}

class RequestForecastWeatherAction { }

class ReceivedForecastWeatherAction {
  ReceivedForecastWeatherAction(this.forecastModel);
  final ForecastRootBaseModel forecastModel;
}

class ErrorLoadingForecastWeatherAction {}

class ShowUnableToloadForecastWeatherAction extends ErrorBaseAction {
  ShowUnableToloadForecastWeatherAction() : super("Wystąpił problem podczas wczytywania pogody dla nastepnych dni", Duration(seconds: 2));
}