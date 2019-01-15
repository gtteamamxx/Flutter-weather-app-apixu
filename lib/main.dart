import 'package:empty_app/other/service_locator.dart';
import 'package:empty_app/redux/actions/app_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/ui/dashboard/dashboard_page.dart';
import 'package:empty_app/ui/select_city/select_city_page.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  configureServiceLocator();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  final Store<AppState> store = configureStore();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: "Weather app",
        theme: ThemeData.dark(),
        home: StoreConnector<AppState, dynamic>(
          converter: (store) => Null,
          onInit: (store) => store.dispatch(LoadCityNameFromPrefsAction(context)),
          builder: (context, viewModel) => ScaffoldPage(store)
        )
      ),
    );
  }
}

class ScaffoldPage extends StatelessWidget {
  ScaffoldPage(this.store);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: serviceLocator.get<GlobalKey<ScaffoldState>>(),
      body: SizedBox.expand(child: _buildContent()),
    );
  }

  _buildContent() {
    if (store.state.cityName != null && store.state.cityName.isNotEmpty) {
      return DashboardPage();
    } else {
      return SelectCityPage();
    }
  }
}