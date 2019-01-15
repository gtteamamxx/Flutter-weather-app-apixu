import 'package:empty_app/models/auto_complete_city/auto_complete_city_model.dart';
import 'package:empty_app/redux/actions/select_city_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/viewmodels/select_city_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SelectCityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SelectCityPageViewModel>(
      converter: (store) => SelectCityPageViewModel.fromStore(store),
      onInit: (store) {
        String cityName = store.state.cityName;
        if (cityName == null || cityName.isEmpty) return;

        store.dispatch(FetchAutoCompleteCitiesForSelectCityPageAction(
          city: cityName
        ));
      },
      builder: (BuildContext context, SelectCityPageViewModel viewModel) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              color: Colors.black,
              child: TextField(
                decoration: InputDecoration(
                  hintText: viewModel.cityName ?? "Wpisz nazwę miasta",
                ),
                onChanged: (String text) => viewModel.onCityNameChanged(text),
              ),
            ),
            Expanded(
                child: viewModel.isLoading 
                ? _loadingScreen() 
                : ListView.builder(
                    itemCount: viewModel.cities.length,
                    itemBuilder: (BuildContext context, int index) {
                      AutoCompleteCityModel city = viewModel.cities.elementAt(index);
                      return _buildAutoCompleteCityModelByCity(city, viewModel);
                    },
                  )
            ),
          ]
        );
      }
    );
  }

  Widget _loadingScreen() {
    return Center(
      child: CircularProgressIndicator()
    );
  }

  Widget _buildAutoCompleteCityModelByCity(AutoCompleteCityModel city, SelectCityPageViewModel viewModel) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(city.name),
      )
    );
  }
}