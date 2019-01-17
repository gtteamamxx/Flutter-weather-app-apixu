// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AstroModel.serializer)
      ..add(AutoCompleteCityModel.serializer)
      ..add(ConditionModel.serializer)
      ..add(CurrentWeatherBaseModel.serializer)
      ..add(CurrentWeatherModel.serializer)
      ..add(ForecastBaseModel.serializer)
      ..add(ForecastDayBaseModel.serializer)
      ..add(ForecastDayModel.serializer)
      ..add(ForecastRootBaseModel.serializer)
      ..add(LocationModel.serializer)
      ..add(TranslateBaseModel.serializer)
      ..add(TranslateModel.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ForecastDayBaseModel)]),
          () => new ListBuilder<ForecastDayBaseModel>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TranslateModel)]),
          () => new ListBuilder<TranslateModel>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
