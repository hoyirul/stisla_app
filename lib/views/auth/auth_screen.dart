// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:stisla_app/controllers/login_controller.dart';
import 'package:stisla_app/controllers/registration_controller.dart';
import 'package:stisla_app/partials/color_pickers.dart';
import 'package:stisla_app/partials/font_pickers.dart';
import 'package:stisla_app/views/auth/widgets/input_fields.dart';
import 'package:stisla_app/views/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Center(
            child: Obx(
              () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'Stisla Apps',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: FontPicker.bold,
                                color: ColorPicker.dark,
                              ),
                          ),
                        ),
                        Container(
                          width: 300,
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Stisla App adalah sebuah aplikasi sederhana untuk tugas Mobile', textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: FontPicker.medium,
                                color: ColorPicker.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(0),
                      width: double.infinity,
                      // color: ColorPicker.bg,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: isLogin.value ? Colors.white : ColorPicker.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xffeeeeee),
                                    offset: Offset(0, 4),
                                    blurRadius: 7
                                  )
                                ],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  isLogin.value = false;
                                },
                                child: Center(
                                  child: Text('Register', style: TextStyle(
                                    fontFamily: FontPicker.semibold,
                                    color: !isLogin.value ? Colors.white : ColorPicker.primary,
                                  ),),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: !isLogin.value ? Colors.white : ColorPicker.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xffeeeeee),
                                    offset: Offset(0, 4),
                                    blurRadius: 7
                                  )
                                ],
                              ),
                              child: TextButton(
                                // height: 50,
                                // minWidth: 170,
                                onPressed: () {
                                  isLogin.value = true;
                                },
                                child: Center(
                                  child: Text('Login', style: TextStyle(
                                    color: isLogin.value ? ColorPicker.white : ColorPicker.primary,
                                    fontFamily: FontPicker.semibold
                                  ),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    isLogin.value ? loginWidget() : registerWidget(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(registerationController.nameController, 'Name', false),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.emailController, 'Email', false),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.passwordController, 'Password', true),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => registerationController.registerWithEmail(),
          title: 'Register',
        )
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.emailController, 'Email', false),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.passwordController, 'Password', true),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => loginController.loginWithEmail(),
          title: 'Login',
        )
      ],
    );
  }
}