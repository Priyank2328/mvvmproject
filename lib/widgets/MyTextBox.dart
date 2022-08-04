import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboard;
  Widget icon;
  var ispassward=false;
  Widget suffix;
  MyTextBox({this.controller,this.keyboard,this.icon,this.ispassward,this.suffix});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        obscureText: ispassward,
        controller: controller,
        cursorColor: Colors.green,
        keyboardType: keyboard,
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefixIcon: icon,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3,color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
