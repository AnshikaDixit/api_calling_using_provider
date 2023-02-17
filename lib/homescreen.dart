import 'dart:convert';

import 'package:api_calling_using_provider/api/api_call.dart';
import 'package:api_calling_using_provider/model/category_list_model.dart';
import 'package:api_calling_using_provider/utils/data_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CategoryListResponse categoryListResponse;
  List<Result>? categoryList = [];

  @override
  void initState() {
    ApiCall().getCategoryList().then((value) {
      setState(() {
        if (value.statusCode == 200) {
          //api calling
          categoryListResponse =
              CategoryListResponse.fromJson(jsonDecode(value.body));

          setState(() {
            //for updating the list
            categoryList = categoryListResponse.result;
          });
        }
      });
    });

    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getpostData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: postModel.loading ? Center(
          child: Container(
            child: SpinKitThreeBounce(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
        ))) : Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  postModel.post?.title ?? "",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Text(postModel.post?.body ?? "")
            ],
          ),),
      ),
    );
  }
}
