import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stisla_app/controllers/login_controller.dart';
import 'package:stisla_app/partials/color_pickers.dart';
import 'package:stisla_app/partials/font_pickers.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  height: 380,
                  width: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  decoration: const BoxDecoration(
                    color: ColorPicker.primary,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))
                  ),
                ),

                Positioned(
                  left: 25,
                  top: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Stisla App', style: TextStyle(
                        fontFamily: FontPicker.bold,
                        fontSize: 20,
                        color: ColorPicker.white
                      ),),
                      Align(
                        child: Text('Developers', style: TextStyle(
                          fontFamily: FontPicker.medium,
                          fontSize: 14,
                          color: ColorPicker.white
                        ),),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: 10,
                  top: -30,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: ColorPicker.primaryShape,
                      borderRadius: BorderRadius.circular(80)
                    ),
                  ),
                ),

                Positioned(
                  right: 25,
                  top: 80,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorPicker.white
                    ),
                    child: TextButton(
                      onPressed: () async {
                        var prefs = await _prefs;
                        print(prefs.getString('token'));
                        loginController.logoutWithEmail();
                      },
                      child: const Text('Logout', style: TextStyle(
                        fontFamily: FontPicker.semibold,
                        color: ColorPicker.primary
                      ),),
                    ),
                  ),
                ),

                Positioned(
                  top: 150,
                  left: 25,
                  right: 25,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorPicker.white,
                      boxShadow: const [
                        BoxShadow(
                          color: ColorPicker.hintText,
                          offset: Offset(0, 1),
                          blurRadius: 9
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Add Categories', style: TextStyle(
                            color: ColorPicker.dark,
                            fontFamily: FontPicker.semibold,
                            fontSize: 16
                          ),)
                        ),

                        const SizedBox(height: 20,),

                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorPicker.white,
                            boxShadow: const [
                              BoxShadow(
                                color: ColorPicker.hintText,
                                blurRadius: 7,
                                offset: Offset(0, 1)
                              )
                            ]
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Category",
                              border: InputBorder.none
                            ),
                          ),
                        ),

                        const SizedBox(height: 20,),

                        Container(
                          padding: const EdgeInsets.all(0),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorPicker.primary,
                            boxShadow: const [
                              BoxShadow(
                                color: ColorPicker.hintText,
                                blurRadius: 7,
                                offset: Offset(0, 1)
                              )
                            ]
                          ),
                          child: const TextButton(
                            onPressed: null,
                            child: Text('Submit', style: TextStyle(
                              color: ColorPicker.white,
                              fontFamily: FontPicker.semibold,
                              fontSize: 16
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("List Categories", style: TextStyle(
                        color: ColorPicker.dark,
                        fontSize: 18,
                        fontFamily: FontPicker.semibold
                      ),)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: 7,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 60,
                        decoration: BoxDecoration(
                          color: ColorPicker.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: ColorPicker.hintText,
                              offset: Offset(0, 1),
                              blurRadius: 7
                            )
                          ]
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Category ${index + 1}", style: const TextStyle(
                            color: ColorPicker.grey,
                            fontFamily: FontPicker.medium
                          ),)
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}