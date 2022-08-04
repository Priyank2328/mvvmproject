import 'package:flutter/material.dart';
import 'package:mvvmproject/resources/StyleResources.dart';

class MyPrimaryButton extends StatelessWidget {
  var btntext="";
  GestureTapCallback onclick;
  double width;
  MyPrimaryButton({this.btntext,this.onclick,this.width});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onclick,
        child: Container(
          width: width,
          height: 50.0,
          color: StyleResources.btncolor,
          alignment: Alignment.center,
          child: Text(btntext,style: StyleResources.btntextstyle,),
        ),
      ),
    );
  }
}
