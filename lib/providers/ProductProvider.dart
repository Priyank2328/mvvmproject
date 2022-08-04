import 'package:flutter/material.dart';
import 'package:mvvmproject/helpers/ApiHandler.dart';
import 'package:mvvmproject/helpers/error_handler.dart';
import 'package:mvvmproject/models/Product.dart';
import 'package:mvvmproject/resources/UrlResources.dart';
import 'package:mvvmproject/views/other/NoIntenetConnection.dart';
import 'package:mvvmproject/views/product/ViewProduct.dart';

class ProductProvider with ChangeNotifier {
  List<Products> alldata;
  viewproduct(context) async
  {
    try {
      await ApiHandler.get(UrlResources.VIEW_PRODUCT).then((json) {
        alldata = json["data"]
            .map<Products>((obj) => Products.fromJson(obj))
            .toList();
        notifyListeners();
      });
    }
    on ErrorHandler catch (e) {
      if (e.message == "Internet Connection Failure") {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoIntenetConnection())
        );
      }
    }
  }

  bool isinserted = false;
  var message = "";

  addproduct(context, params) async
  {
    try {
      await ApiHandler.post(UrlResources.ADD_PRODUCT, body: params).then((
          json) {
        if (json["status"] == "true") {
          message = json["message"];
          isinserted = true;
        }
        else {
          message = json["message"];
          isinserted = false;
        }
      });
    }
    on ErrorHandler catch (e) {
      if (e.message == "Internet Connection Failure") {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoIntenetConnection())
        );
      }
    }
  }

  bool isdeleted = false;

  deleteproduct(context, params) async
  {
    try {
      await ApiHandler.post(UrlResources.DELETE_PRODUCT, body: params)
          .then((json) {
        if (json["status"] == "true") {
          isdeleted = true;
          message = json["message"];
        }
        else {
          isdeleted = false;
          message = json["message"];
        }
      });
    }
    on ErrorHandler catch (e) {
      if (e.message == "Internet Connection Failure") {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoIntenetConnection())
        );
      }
    }
  }
  Products singleobj;
  getsinglerecord(context, params) async
  {
    try {
      await ApiHandler.post(UrlResources.GET_SINGLE_PRODUCT,body: params).then((json){
        singleobj = Products.fromJson(json["data"]);
        });
    }
    on ErrorHandler catch (e) {
      if (e.message == "Internet Connection Failure") {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoIntenetConnection())
        );
      }
    }
  }
  bool issave=false;
  saveproduct(context,params) async
  {
    try {
      await ApiHandler.post(UrlResources.UPDATE_PRODUCT,body: params).then((json){
        if(json["status"]=="true")
        {
          issave=true;
        }
        else
          {
            issave=false;
          }
      });
    }
    on ErrorHandler catch (e) {
      if (e.message == "Internet Connection Failure") {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoIntenetConnection())
        );
      }
    }
  }
}