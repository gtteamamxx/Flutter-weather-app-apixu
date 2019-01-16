import 'package:empty_app/redux/actions/dashboard_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/viewmodels/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DashboardPage extends StatefulWidget {
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DashboardViewModel>(
      converter: (store) => DashboardViewModel.fromStore(store),
      onInit: (store) => store.dispatch(FetchCurrentWeatherAction(store.state.cityName)),
      builder: (BuildContext context, DashboardViewModel viewModel) {
        return Material(
          child: viewModel.isLoading ? _buildProgressIndicator() : Container(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.red,
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.blue, Colors.cyan],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.repeated,
                stops: [0.2, 0.45, 0.9]
              )
            ),
            child: Column(
              children: <Widget>[
                Text(
                  viewModel.cityName, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0
                  ),  
                ),
                Row(
                  children: <Widget>[
                    Image.network(viewModel.weatherModel.condition.iconUrl),
                    Text(viewModel.weatherModel.feelTempC.toString() + "*"),
                    Column(
                      children: <Widget>[
                        InkWell(child: Text("C")),
                        InkWell(child: Text("F"))
                      ]),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Text(viewModel.weatherModel.condition.description),
                Text('Zaaktualizowano o godzinie ' + viewModel.getLastUpdateDate()),
                Row(
                  children: <Widget>[
                    Text("Temperatura odczuwalna " + viewModel.weatherModel.feelTempC.toString() + "*C"),
                    Text("Wiatr " + viewModel.weatherModel.windKph.toString() + " km/h"),
                    Text("Widoczność " + viewModel.weatherModel.visKm.toStringAsFixed(0))
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  children: <Widget>[
                    Text("Barometr " + viewModel.weatherModel.pressureMb.toStringAsFixed(0) + " mbar"),
                    Text("Wilgotność " + viewModel.weatherModel.humidity.toStringAsFixed(0) + "%"),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            )
          )
        );
      },
    );
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Wczytywanie pogody..."),
          CircularProgressIndicator() 
        ],
      )
    );
  }
} 