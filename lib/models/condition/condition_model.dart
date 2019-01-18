import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:empty_app/other/service_locator.dart';
import 'package:empty_app/resources/translations_helper.dart';
part 'condition_model.g.dart';

abstract class ConditionModel implements Built<ConditionModel, ConditionModelBuilder> {
  static Serializer<ConditionModel> get serializer => _$conditionModelSerializer;

  @BuiltValueField(wireName: "text")
  String get description;
  
  @BuiltValueField(wireName: "icon")
  String get iconUrl;
  
  int get code;

  String getValidUrl() {
    final String url = iconUrl;
    final String fixedUrl = "http://" + url.substring(2);
    return fixedUrl;
  }

  String translateCondition() {
    var translator = serviceLocator.get<TranslationsHelper>();
    String translatedCondition = translator.translateConditionByCode("Polish", code);
    return translatedCondition ?? description;
  }

  ConditionModel._();
  factory ConditionModel([updates(ConditionModelBuilder b)]) => _$ConditionModel();
}