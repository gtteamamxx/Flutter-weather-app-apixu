library serializers;

import 'package:built_value/serializer.dart';
import 'package:empty_app/models/auto_complete_city/auto_complete_city_model.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AutoCompleteCityModel
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
