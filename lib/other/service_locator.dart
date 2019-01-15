import 'package:dio/dio.dart';
import 'package:empty_app/resources/weather_api.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt();

void configureServiceLocator() {
  serviceLocator.registerSingleton<Dio>(Dio());

  serviceLocator.registerSingleton<WeatherApi>(WeatherApi(serviceLocator.get<Dio>()));

  serviceLocator.registerSingleton<GlobalKey<ScaffoldState>>(GlobalKey<ScaffoldState>());

}