import 'dart:convert';

import 'package:api_calling_using_provider/api/api_const.dart';
import 'package:http/http.dart' as http;

import '../model/final_model.dart';

class ApiCall {
  Future<http.Response> getCategoryList() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.get(Uri.parse(ApiConst.getCategoryList),
        headers: headers);
  }

  //3- Create a service class for data loading
  Future<Result?> getPostsData() async {
    Result? result;

    try {
      final response = await http.get(Uri.parse(ApiConst.finalUrl),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        result = Result.fromJson(item);
      } else {
        print('error');
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }
}
