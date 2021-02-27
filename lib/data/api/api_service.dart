import 'package:restoe/data/api/api_url.dart';
import 'package:restoe/data/models/resto_detail_result.dart';
import 'package:restoe/data/models/resto_result.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<RestoResult> listRestaurants() async {
    final response = await http.get(baseUrl + "list");

    if (response.statusCode == 200) {
      return restoResultFromJson(response.body);
    } else {
      throw Exception('Failed to load list restaurants');
    }
  }

  Future<RestoDetailResult> detailRestaurant({String id}) async {
    final response = await http.get(baseUrl + "detail/$id");

    if (response.statusCode == 200) {
      return restoDetailResultFromJson(response.body);
    } else {
      throw Exception('Failed to load detail restaurant');
    }
  }
}
