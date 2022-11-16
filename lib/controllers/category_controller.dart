import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:stisla_app/models/category_model.dart';
import 'package:stisla_app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:stisla_app/utils/headers_helper.dart';

class CategoryController extends GetxController{
  
  Future<void> getList() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    try{
      var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getUri('categories')
      );

      http.Response response = await http.get(url, headers: HeadersHelper().getHeaders(token));

      print(response.statusCode);
      print(jsonDecode(response.body));

    }catch(error){
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}

class CategoryStream{
  CategoryStream(){
    outputSink = outputController.sink;
    inputSink = inputController.sink;
    inputController.stream.listen((event) {
      CategoryModel();
      outputSink.add(event);
    });
  }

  late StreamSink outputSink;
  late StreamSink inputSink;

  StreamController inputController = StreamController();
  StreamController outputController = StreamController();
}