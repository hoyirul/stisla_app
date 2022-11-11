// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool _obscureText;
  const InputTextFieldWidget(this.textEditingController, this.hintText, this._obscureText,{super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        controller: textEditingController,
        obscureText: _obscureText,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white54,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(bottom: 15),
            focusColor: Colors.white60),
      ),
    );
  }
}