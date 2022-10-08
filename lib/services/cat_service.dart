import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/services/api/base_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import '../interfaces/cat_interface.dart';

class CatService with BaseApi implements CatInterface {
  @override
  Future<CatModel?> getRandomCat() async {
    http.Response? response = await executeHttpRequest();
    try {
      List data = json.jsonDecode(response.body);
      return CatModel(url: data[0]['url']);
    } catch (e) {
      return null;
    }
  }
}
