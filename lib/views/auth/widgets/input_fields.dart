// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stisla_app/partials/color_pickers.dart';
import 'package:stisla_app/partials/font_pickers.dart';

class InputTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool _obscureText;
  const InputTextFieldWidget(this.textEditingController, this.hintText, this._obscureText,{super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('$hintText : ', style: TextStyle(
              color: ColorPicker.grey,
              fontFamily: FontPicker.medium,
              fontSize: 15
            ),)
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffeeeeee),
                  offset: Offset(0, 4),
                  blurRadius: 7
                )
              ],
              color: Colors.white
            ),
            child: TextField(
              controller: textEditingController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                  fillColor: Colors.white54,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.only(bottom: 15),
                  focusColor: Colors.white60),
            ),
          ),
        ],
      ),
    );
  }
}