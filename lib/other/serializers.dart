library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:empty_app/models/auto_complete_city/auto_complete_city_model.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:empty_app/models/condition/condition_model.dart';
import 'package:empty_app/models/current_weather/current_weather_model.dart';
import 'package:empty_app/models/current_weather_base/current_weather_base_model.dart';
import 'package:empty_app/models/location/location_model.dart';
import 'package:empty_app/models/translate/translate_model.dart';
import 'package:empty_app/models/translate_base/translate_model_base.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AutoCompleteCityModel,
  LocationModel,
  CurrentWeatherModel,
  CurrentWeatherBaseModel,
  ConditionModel,
  TranslateModel,
  TranslateBaseModel
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
