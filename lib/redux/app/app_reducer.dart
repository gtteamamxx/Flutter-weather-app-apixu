import 'package:empty_app/other/service_locator.dart';
import 'package:empty_app/redux/actions/app_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/redux/select_city_page/select_city_page_reducer.dart';
import 'package:flutter/material.dart';

AppState appReducer(AppState state, action) {
  if(action is ChangeCityForWeatherAction) {
    return state.copyWith(cityName: action.cityName);
  }

  if(action is ShowErrorAction) {
    _showMessageByAction(action);
    return state;
  }

  return state.copyWith(
    cityName: state.cityName,
    selectCityPageState: selectCityPageReducer(state.selectCityPageState, action)
  );
}

String _lastMessage = "'";

void _showMessageByAction(ShowErrorAction action) {
  GlobalKey<ScaffoldState> scaffoldState = serviceLocator.get<GlobalKey<ScaffoldState>>();

  if(_lastMessage == action.message) {
    scaffoldState.currentState.removeCurrentSnackBar();
  } else {
    _lastMessage = action.message;
  }

  scaffoldState.currentState.showSnackBar(
    SnackBar(
      content: Text(action.message),
      duration: Duration(seconds: 1),
    )
  );
}