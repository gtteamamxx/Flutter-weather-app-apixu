import 'package:empty_app/redux/actions/dashboard_forecast_page_actions.dart';
import 'package:empty_app/redux/dashboard/forecast/dashboard_forecast_page_state.dart';

DashboardForecastPageState dashboardForecastPageReducer(DashboardForecastPageState state, dynamic action) {
  if(action is RequestForecastWeatherAction) {
    return state.copyWith(
      isLoading: true
    );
  }

  if (action is ReceivedForecastWeatherAction) {
    return state.copyWith(
      isLoading: false,
      isError: false
    );
  }

  if(action is ErrorLoadingForecastWeatherAction) {
    return state.copyWith(
      isLoading: false,
      isError: true
    );
  }

  return state;
}