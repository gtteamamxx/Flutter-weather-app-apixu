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
      builder: (context, viewModel) => _buildTitle(child:_buildPage(viewModel))
    );
  }

  Widget _loadingIndicator() {
    return Center(child: CircularProgressIndicator(),);
  }

  Widget _errorButton(DashboardForecastPageViewModel viewModel) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("Wystapił błąd podczas wczytywania pogody dla kilku dni.", textAlign: TextAlign.center,),
          RaisedButton(
            child: Text("Spróbuj ponownie"),
            onPressed: () => viewModel.onRefresh(),
          )
        ],
      )
    );
  }

  Widget _buildPage(DashboardForecastPageViewModel viewModel) {
    if(viewModel.isLoading) {
      return _loadingIndicator();
    } else if(viewModel.isError) {
      return _errorButton(viewModel);
    }

    return Container();
  }

  Widget _buildTitle({Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Dany dzień", style: TextStyle(fontSize: 25)),
          SizedBox.fromSize(size: Size(0, 10)),
          child
        ],
      ),
    );
  }
}