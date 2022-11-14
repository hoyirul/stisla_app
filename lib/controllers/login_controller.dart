import 'dart:convert';
import 'package:stisla_app/views/auth/auth_screen.dart';
import 'package:stisla_app/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stisla_app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['token'];
          var name = json['data']['name'];

          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token);
          await prefs.setString('name', name);

          emailController.clear();
          passwordController.clear();
          Get.off(const HomeScreen());
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
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

  Future<void> logoutWithEmail() async {
    // ignore: no_leading_underscores_for_local_identifiers
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
              
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.logoutEmail);
      http.Response response =
          await http.post(url, headers: headers);
      // ignore: avoid_print
      print(response.statusCode);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        _prefs.clear();
        Get.off(const AuthScreen());
        print(json);
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
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