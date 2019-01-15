import 'package:empty_app/redux/actions/dashboard_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

typedef void OnTap(BuildContext context);

class DashboardViewModel {
  DashboardViewModel({
    @required this.onTap,
    @required this.cityName
  });
  
  final OnTap onTap;
  final String cityName;

  static DashboardViewModel fromStore(Store<AppState> store) {
    return DashboardViewModel(
      onTap: (BuildContext context) => _onTap(store, context),
      cityName: store.state.cityName
    );
  }

  static void _onTap(Store<AppState> store, BuildContext context) {
    store.dispatch(ShowSelectCityPageAction(context));
  }
}