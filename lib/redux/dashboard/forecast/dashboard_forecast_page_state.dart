class DashboardForecastPageState {
  DashboardForecastPageState({
    this.isLoading
  });

  final bool isLoading;

  DashboardForecastPageState copyWith(
    bool isLoading
  ) {
    return DashboardForecastPageState(
      isLoading: isLoading ?? this.isLoading
    );
  }

  static DashboardForecastPageState initial() {
    return DashboardForecastPageState(
      isLoading: true
    );
  }
}