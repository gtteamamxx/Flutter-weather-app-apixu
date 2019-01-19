import 'package:empty_app/redux/app/app_state.dart';
import 'package:empty_app/ui/common/circular_chart.dart';
import 'package:empty_app/viewmodels/dashboard_day_detail_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DashboardDayDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DashboardDayDetailPageViewModel>(
      converter: (store) => DashboardDayDetailPageViewModel.fromStore(store),
      builder: (store, viewModel) => viewModel.dayInfo == null
        ? Container()
        : _buildTitle(child:_buildPage(viewModel)),
    );
  }

  Widget _buildPage(DashboardDayDetailPageViewModel viewModel) {
    return Container(
      child: Column(children: <Widget>[
        _drawLine(),
        _space(),
        _drawState("Wschód słońca", Icons.wb_sunny, viewModel.dayInfo.astro.sunRise24H),
        _space(),
        _drawState("Zachód słońca", Icons.wb_sunny, viewModel.dayInfo.astro.sunSet24H),
        _space(),
        _drawLine(),
        _space(),
        _drawState("Wschód księżyca", Icons.brightness_3, viewModel.dayInfo.astro.moonRise24H),
        _space(),
        _drawState("Zachód księzyca", Icons.brightness_3, viewModel.dayInfo.astro.moonSet24H),
        _space(),
        _drawLine(),
        _space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircularChart(title: "Opady", percentage: viewModel.dayInfo.day.precipMm / 100,),
            CircularChart(title: "Wilgotność", percentage: viewModel.dayInfo.day.humidity,)
          ],
        ),
        _space(),
      
        _space()
      ]),
    );
  }


  Widget _drawState(String header, IconData icon, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: TextStyle(fontSize: 18)),
        _space(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox.fromSize(size: Size(10, 0),),
            Text(value, style: TextStyle(fontSize: 20))
          ]
        )
      ]
    );
  }

  Widget _drawLine() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 0.3,
            color: Color.fromARGB(255, 255, 255, 255),
          )
        )
      ]
    );
  }

  Widget _space([double value = 10]) {
    return SizedBox.fromSize(size: Size(0, value));
  }

  Widget _buildTitle({Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Szczegóły dnia", style: TextStyle(fontSize: 25)),
          _space(),
          child
        ],
      ),
    );
  }
} 