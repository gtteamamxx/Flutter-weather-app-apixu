import 'package:empty_app/models/translate_base/translate_model_base.dart';
import 'package:empty_app/resources/weather_api.dart';

class TranslationsHelper {
  TranslationsHelper(this.weatherApi);
  final WeatherApi weatherApi;
  
  List<TranslateBaseModel> _translations;

  Future<bool> initialize() async {
    try {
      _translations = await weatherApi.fetchTranslations();
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}