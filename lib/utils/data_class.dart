import 'package:api_calling_using_provider/api/api_call.dart';
import 'package:flutter/cupertino.dart';
import '../model/final_model.dart';

//4- Create a data class using ChangeNotifier
class DataClass extends ChangeNotifier {
  Result? post;
  bool loading = false;

  getpostData() async {
    loading = true;
    post = (await ApiCall().getPostsData())!;
    loading = false;

    notifyListeners();
  }
}
