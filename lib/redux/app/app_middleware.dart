import 'package:empty_app/other/service_locator.dart';
import 'package:empty_app/redux/actions/app_actions.dart';
import 'package:empty_app/redux/actions/dashboard_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/resources/user_data_provider.dart';
import 'package:empty_app/ui/dashboard/dashboard_page.dart';
import 'package:empty_app/ui/select_city/select_city_page.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void appMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
  if(action is ErrorBaseAction) {
    _showMessageByAction(action);
  } if(action is ShowDashboardPageAction) {
    _showPage(action.context, DashboardPage());
  } else if(action is ShowSelectCityPageAction) {
    _showPage(action.context, SelectCityPage());
  } else if(action is LoadCityNameFromPrefsAction) {
    await _loadCityNameFromPrefsAction(store, next);
  } else {
    next(action);
  }
}

Future _loadCityNameFromPrefsAction(Store<AppState> store, NextDispatcher next) async {
  try
  {
    String userCity = await UserDataProvider.getCity();
    next(ChangeCityForWeatherAction(userCity));
  } 
  catch (ex)
  {
    store.dispatch(ErrorLoadingCityForWeatherAction());
    next(ChangeCityForWeatherAction(null));
  }
}

void _showPage(BuildContext context, dynamic page) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}


String _lastMessage = "'";
void _showMessageByAction(ErrorBaseAction action) {
  GlobalKey<ScaffoldState> scaffoldState = serviceLocator.get<GlobalKey<ScaffoldState>>();

  if(_lastMessage == action.error) {
    scaffoldState.currentState.removeCurrentSnackBar();
  } else {
    _lastMessage = action.error;
  }

  scaffoldState.currentState.showSnackBar(
    SnackBar(
      content: Text(action.error),
      duration: Duration(seconds: 1),
    )
  );
}