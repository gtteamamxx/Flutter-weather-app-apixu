import 'package:empty_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void dashboardForecastPageMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) {
  next(action);
}