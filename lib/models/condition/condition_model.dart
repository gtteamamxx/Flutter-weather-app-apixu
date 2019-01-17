import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'condition_model.g.dart';

abstract class ConditionModel implements Built<ConditionModel, ConditionModelBuilder> {
  static Serializer<ConditionModel> get serializer => _$conditionModelSerializer;

  @BuiltValueField(wireName: "text")
  String get description;
  
  @BuiltValueField(wireName: "icon")
  String get iconUrl;
  
  int get code;

  ConditionModel._();
  factory ConditionModel([updates(ConditionModelBuilder b)]) => _$ConditionModel();
}