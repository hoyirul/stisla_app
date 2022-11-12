import 'package:shared_preferences/shared_preferences.dart';
import 'package:stisla_app/partials/color_pickers.dart';
import 'package:stisla_app/views/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stisla_app/views/home/home.dart';
import 'package:stisla_app/views/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: no_leading_underscores_for_local_identifiers
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  // ignore: unnecessary_null_comparison
  if(_prefs.getString('token') == null){
    runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: unnecessary_null_comparison
      home: SplashScreen(),  
    ));
  }else{
    runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: unnecessary_null_comparison
      home: HomeScreen(),  
    ));
  }
}