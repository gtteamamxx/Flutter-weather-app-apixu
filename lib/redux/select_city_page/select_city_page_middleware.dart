import 'package:empty_app/models/auto_complete_city/auto_complete_city_model.dart';
import 'package:empty_app/other/service_locator.dart';
import 'package:empty_app/redux/actions/app_actions.dart';
import 'package:empty_app/redux/actions/select_city_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/resources/weather_api.dart';
import 'package:redux/redux.dart';

void selectCityPageMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
  if(action is FetchAutoCompleteCitiesForSelectCityPageAction) {
    await _fetchAutoCompleteCitiesForSelectCityPage(store, action, next);
  } else if(action is SelectCityNameAction) {
    store.dispatch(ChangeCityForWeatherAction(action.cityName));
    store.dispatch(SaveCityNameToPrefsAction(action.cityName));
    store.dispatch(ShowDashboardPageAction(action.context));
  } else {
    next(action);
  }

}

_fetchAutoCompleteCitiesForSelectCityPage(Store<AppState> store, FetchAutoCompleteCitiesForSelectCityPageAction action, NextDispatcher next) async {
  next(RequestAutoCompleteCitiesForSelectCityPageAction());

  try {
    List<AutoCompleteCityModel> cities = await serviceLocator.get<WeatherApi>().fetchAutoCompleteCitiesByCityName(action.city);
    next(ReceivedAutoCompleteCitiesForSelectCityPageAction(cities));
  } 
  catch (ex) {
    print(ex);
    next(ErrorLoadingAutoCompleteCitiesAction);
    store.dispatch(ShowUnableToloadAutoCompleteCitiesAction());
  }
}