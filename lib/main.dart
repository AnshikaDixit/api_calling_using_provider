import 'package:api_calling_using_provider/homescreen.dart';
import 'package:api_calling_using_provider/utils/data_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: ((context) => DataClass()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

//import http package
//create apicall class 
//create model class from the response achieved
//call in initclass

//Six steps
// 1- Undersatnd the data
// 2- create data model
// 3- create service class
// 4- create data class with changenotifier
// 5- create provider with changenotifierprovider
// 6- load and show data