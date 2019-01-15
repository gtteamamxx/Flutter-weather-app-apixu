import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:empty_app/models/auto_complete_city/auto_complete_city_model.dart';
import 'package:empty_app/other/serializers.dart';

class WeatherApi {
  static const String key = "3d8595c5487d4d61b8080815191001";
  
  WeatherApi(this.client);
  final Dio client;

  Future<List<AutoCompleteCityModel>> fetchAutoCompleteCitiesByCityName(String cityName) async {
    assert(cityName != null);
    assert(cityName.isNotEmpty);

    final String url = "http://api.apixu.com/v1/search.json?key=$key&q=$cityName";
    Response response = await client.get(url);  

    return _resultListFromResponse(response, AutoCompleteCityModel.serializer);
  }

  List<T> _resultListFromResponse<T>(Response response, Serializer<T> serializer) {
    if(response.statusCode != 200) return [] as List<T>;

    List<T> result = _getListFromResponse(response, serializer);
    return result;
  }

  T _resultFromResponse<T>(Response response, Serializer<T> serializer) {
    return serializers.deserializeWith<T>(serializer, response.data);
  }

  List<T> _getListFromResponse<T>(Response response, Serializer<T> serializer) {
    return List<T>.from(
      response.data.map((x) => serializers.deserializeWith(serializer, x))
    );
  }
}