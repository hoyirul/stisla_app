import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stisla_app/controllers/category_controller.dart';
import 'package:stisla_app/controllers/login_controller.dart';
import 'package:stisla_app/controllers/user_controller.dart';
import 'package:stisla_app/partials/color_pickers.dart';
import 'package:stisla_app/partials/font_pickers.dart';
import 'package:stisla_app/views/home/home.dart';

class EditCategoryScreen extends StatefulWidget {
  final int id;
  const EditCategoryScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  LoginController loginController = Get.put(LoginController());
  UserController userController = Get.put(UserController());
  CategoryController categoryController = Get.put(CategoryController());

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
                    children: [
                      FutureBuilder(
                        future: userController.getName(),
                        builder: (context, snapshot) => Text('Hai, ${snapshot.data}', style: const TextStyle(
                          fontFamily: FontPicker.bold,
                          fontSize: 20,
                          color: ColorPicker.white
                        ),),
                      ),
                      const Align(
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
                      onPressed: () {
                        categoryController.nameController.clear();
                        Get.off(const HomeScreen());
                      },
                      child: const Text('Back', style: TextStyle(
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
                          child: Text('Edit Categories', style: TextStyle(
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
                            controller: categoryController.nameController,
                            decoration: const InputDecoration(
                              hintText: "Category",
                              border: InputBorder.none,
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
                          child: TextButton(
                            onPressed: () {
                              categoryController.updateData(widget.id);
                              print(categoryController.categoryList.length);
                            },
                            child: const Text('Update', style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}