import 'package:empty_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class DashboardForecastPageViewModel {
  DashboardForecastPageViewModel({
    this.isLoading
  });

  final bool isLoading;


  static DashboardForecastPageViewModel fromStore(Store<AppState> store) {
    return DashboardForecastPageViewModel(
      isLoading: store.state.dashboardForecastPageState.isLoading
    );
  }
}