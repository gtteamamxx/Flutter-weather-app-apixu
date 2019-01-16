import 'package:empty_app/redux/actions/app_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/redux/dashboard/dashboard_page_reducer.dart';
import 'package:empty_app/redux/select_city_page/select_city_page_reducer.dart';

AppState appReducer(AppState state, action) {
  if(action is ChangeCityForWeatherAction) {
    return state.copyWith(cityName: action.cityName);
  }

  return state.copyWith(
    cityName: state.cityName,
    selectCityPageState: selectCityPageReducer(state.selectCityPageState, action),
    dashboardPageState: dashboardPageReducer(state.dashboardPageState, action)
  );
}

