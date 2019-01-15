import 'package:empty_app/redux/select_city_page/select_city_page_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:empty_app/redux/app/app_middleware.dart';
import 'package:empty_app/redux/select_city_page/select_city_page_middleware.dart';
import 'package:empty_app/redux/app/app_reducer.dart';

class AppState {
  AppState({
    @required this.cityName,
    this.selectCityPageState,
  });

  final String cityName;

  final SelectCityPageState selectCityPageState;

  AppState copyWith({
    String cityName,
    SelectCityPageState selectCityPageState,
    String message
  }) {
    return AppState(
      cityName: cityName ?? this.cityName,
      selectCityPageState: selectCityPageState ?? this.selectCityPageState,
    );
  }

  static AppState intiial() {
    return AppState(
      cityName: null,
      selectCityPageState: SelectCityPageState.initial()
    );
  }
}


Store<AppState> configureStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState.intiial(),
    middleware: [
      appMiddleware,
      selectCityPageMiddleware,
    ]
  );
}