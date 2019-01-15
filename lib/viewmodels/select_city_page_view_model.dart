import 'package:empty_app/models/auto_complete_city/auto_complete_city_model.dart';
import 'package:empty_app/redux/actions/select_city_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

typedef void OnCityNameChanged(String text);
typedef void OnCitySelected(String text);

class SelectCityPageViewModel {
  SelectCityPageViewModel({
    this.cityName,
    this.cities,
    this.isLoading,
    this.onCityNameChanged,
    this.onCitySelected
  });

  final String cityName;
  final List<AutoCompleteCityModel> cities;
  final bool isLoading;
  final OnCityNameChanged onCityNameChanged;
  final OnCitySelected onCitySelected;

  static SelectCityPageViewModel fromStore(Store<AppState> store) {
    return SelectCityPageViewModel(
      cityName: store.state.cityName,
      cities: store.state.selectCityPageState.cities,
      isLoading: store.state.selectCityPageState.isLoading,
      onCityNameChanged: (String cityName) => _onCityNameChanged(store, cityName),
      onCitySelected: (String cityName) => _onCitySelected(store, cityName)
    );
  }

  static void _onCityNameChanged(Store<AppState> store, String cityName) {
    if(cityName == null || cityName.trim().isEmpty) return;
  
    store.dispatch(FetchAutoCompleteCitiesForSelectCityPageAction(
      city: cityName
    ));
  }

  static void _onCitySelected(Store<AppState> store, String cityName) {
    if(cityName == null || cityName.isEmpty) return;

    store.dispatch(SelectCityNameAction(cityName));
  }
}