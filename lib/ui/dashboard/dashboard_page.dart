import 'package:empty_app/redux/actions/dashboard_page_actions.dart';
import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/redux/dashboard/dashboard_page_state.dart';
import 'package:empty_app/ui/dashboard/dashboard_day_detail_page.dart';
import 'package:empty_app/ui/dashboard/dashboard_forecast_page.dart';
import 'package:empty_app/viewmodels/dashboard_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DashboardPage extends StatefulWidget {
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DashboardPageViewModel>(
      converter: (store) => DashboardPageViewModel.fromStore(store),
      onInit: (store) => store.dispatch(FetchCurrentWeatherAction(store.state.cityName)),
      builder: (BuildContext context, DashboardPageViewModel viewModel) {
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      viewModel.cityName, 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0
                      ),  
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Image.network(viewModel.getConditionImageUrl()),
                      SizedBox.fromSize(size: Size(10.0, 0.0)),
                      Text(
                        viewModel.getTemperature().toStringAsFixed(0) + "°",
                        style: TextStyle(
                          fontSize: 60
                        )),
                      SizedBox.fromSize(size: Size(20.0, 0.0)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _buildTemperatureChangeWidget("C", TemperatureTypeEnum.C, viewModel),
                          _buildTemperatureChangeWidget("F", TemperatureTypeEnum.F, viewModel),
                          SizedBox.fromSize(size: Size(0, 10.0))
                        ]),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Center(
                    child: Text(viewModel.weatherModel.condition.translateCondition(), style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox.fromSize(size: Size(0, 10)),
                  Center(
                    child: Text('Zaaktualizowano o godzinie ' + viewModel.getLastUpdateDate(), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox.fromSize(size: Size(0, 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _smallText("Temperatura odczuwalna " + viewModel.getFeelslikeTemperature().toStringAsFixed(0) + "°"),
                      _smallText("Widoczność " + viewModel.weatherModel.visKm.toStringAsFixed(0) + " km")
                    ],
                  ),
                  SizedBox.fromSize(size: Size(0, 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _smallText("Wiatr " + viewModel.weatherModel.windKph.toStringAsFixed(0) + " km/h"),
                      _smallText("Barometr " + viewModel.weatherModel.pressureMb.toStringAsFixed(0) + " mbar"),
                      _smallText("Wilgotność " + viewModel.weatherModel.humidity.toStringAsFixed(0) + "%"),
                    ],
                  ),

                  SizedBox.fromSize(size: Size(0, 10)),
                  _buildForecastWidget(),
                  SizedBox.fromSize(size: Size(0, 10)),
                  _buildDayWidget()
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              )
            )
          )
        );
      },
    );
  }

  Widget _buildForecastWidget() {
    return DashboardForecastPage();
  }

  Widget _buildDayWidget() {
    return DashboardDayDetailPage();
  }

  Text _smallText(String text) => Text(text, style: TextStyle(fontSize: 11));

  Widget _buildProgressIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Wczytywanie pogody..."),
          SizedBox.fromSize(size: Size(0, 20.0)),
          CircularProgressIndicator() 
        ],
      )
    );
  }

  Widget _buildTemperatureChangeWidget(String char, TemperatureTypeEnum type, DashboardPageViewModel vm) {
    return InkWell(
      child: Text(char, style: TextStyle(fontSize: 20, fontWeight: vm.temperatureType == type ? FontWeight.bold : FontWeight.w300)),
      onTap: () => vm.changeTemperatureFormat(type),
      splashColor: Colors.red,
    );
  }
} 