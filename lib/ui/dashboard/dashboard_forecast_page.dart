import 'package:empty_app/redux/actions/dashboard_forecast_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/viewmodels/dashboard_forecast_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DashboardForecastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DashboardForecastPageViewModel>(
      converter: (store) => DashboardForecastPageViewModel.fromStore(store),
      onInit: (store) => store.dispatch(FetchForecastWeatherAction(store.state.cityName)),
      builder: (context, viewModel) => 
        viewModel.isLoading ? _loadingIndicator() : _buildPage(viewModel)
    );
  }

  Widget _loadingIndicator() {
    return Center(child: CircularProgressIndicator(),);
  }

  Widget _buildPage(DashboardForecastPageViewModel viewModel) {
    return Container();
  }
}