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
          child: Container(
            padding: EdgeInsets.all(25),
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
                    Text("obrazek"),
                    Text("-1" + "*"),
                    Column(
                      children: <Widget>[
                        InkWell(child: Text("C")),
                        InkWell(child: Text("F"))
                      ]),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Text("Niewielkie opady śniegu"),
                Text("Zaktualizowano o godzinie 11:34"),
                Row(
                  children: <Widget>[
                    Text("Temperatura odczuwalna -8*"),
                    Text("Wiatr 31 km/h"),
                    Text("Widoczność 6km")
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  children: <Widget>[
                    Text("Barometr 1007,00 mbar"),
                    Text("Wilgotność 92%"),
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
} 