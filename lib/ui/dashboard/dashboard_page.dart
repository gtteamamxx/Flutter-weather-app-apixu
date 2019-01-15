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
      builder: (BuildContext context, DashboardViewModel viewModel) {
        return Material(child: 
          Center(child: 
              InkWell(
                child: Text("Kliknij mnie"),
                onTap: () => viewModel.onTap(context),
              ),
          )
        );
      },
    );
  }
} 