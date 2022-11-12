import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stisla_app/controllers/login_controller.dart';
import 'package:stisla_app/views/auth/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              loginController.logoutWithEmail();
            },
            child: const Text(
              'logout',
              style: TextStyle(color: Colors.white),
            ))
      ]),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome home'),
            TextButton(
                onPressed: () async {
                  final SharedPreferences prefs = await _prefs;
                  print(prefs.get('token'));
                },
                child: const Text('print token'))
          ],
        ),
      ),
    );
  }
}