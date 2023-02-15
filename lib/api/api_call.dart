import 'package:api_calling_using_provider/api/api_const.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<http.Response> getCategoryList() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.get(Uri.parse(ApiConst.getCategoryList), headers: headers);
  }
}
