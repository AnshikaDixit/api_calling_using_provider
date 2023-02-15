import 'dart:convert';

import 'package:api_calling_using_provider/api/api_call.dart';
import 'package:api_calling_using_provider/api/api_const.dart';
import 'package:api_calling_using_provider/model/category_list_model.dart';
import 'package:flutter/material.dart';

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
        
        if(value.statusCode == 200 ){
           
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: categoryList!.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 6,
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Image.network(
                          color: Colors.red,
                          ApiConst.imageUrl+categoryList![index].url.toString(),
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                         Text(
                          categoryList![index].categoryName.toString(),
                            style: const TextStyle(color: Colors.black, fontSize: 10))
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
