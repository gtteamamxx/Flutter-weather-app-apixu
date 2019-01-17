import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'astro_model.g.dart';

abstract class AstroModel implements Built<AstroModel, AstroModelBuilder> {
  static Serializer<AstroModel> get serializer => _$astroModelSerializer;
  
  @BuiltValueField(wireName : "sunrise")
  String get sunRise;

  @BuiltValueField(wireName : "sunset")
  String get sunSet;

  @BuiltValueField(wireName : "moonrise")
  String get moonRise;

  @BuiltValueField(wireName : "moonset")
  String get moonSet;

  AstroModel._();
  factory AstroModel([updates(AstroModelBuilder b)]) => _$AstroModel();
} 