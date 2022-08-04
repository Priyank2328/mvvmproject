import 'package:flutter/material.dart';
import 'package:mvvmproject/helpers/ApiHandler.dart';
import 'package:mvvmproject/helpers/error_handler.dart';
import 'package:mvvmproject/models/Employee.dart';
import 'package:mvvmproject/resources/UrlResources.dart';
import 'package:mvvmproject/views/other/NoIntenetConnection.dart';

class EmployeeProvider with ChangeNotifier
{
  List<Employee> alldata;
  viewemployee(context) async
   {
    try {
      await ApiHandler.get(UrlResources.VIEW_EMPLOYEE).then((json) {
        alldata = json["data"]
            .map<Employee>((obj) => Employee.fromJson(obj))
            .toList();
      });
    }
    on ErrorHandler catch (e) {
      if (e.message == "Internet Connection Failure");
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoIntenetConnection())
        );
      }
    }
  }
  bool isinserted=false;
  var message="";
  addemployee(context,params) async
  {
    try
    {
      await ApiHandler.post(UrlResources.ADD_EMPLOYEE,body: params).then((json){
        if(json["status"]=="true")
          {
            message = json["message"];
            isinserted=true;

          }
        else
        {
          isinserted=false;
          message = json["message"];
        }
      });
    }
    on ErrorHandler catch(e)
    {
      if(e.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>NoIntenetConnection())
        );
      }
    }

  }
  bool isdeleted=false;
  deleteemployee(context,params) async
  {
    try
    {
      await ApiHandler.post(UrlResources.DELETE_EMPLOYEE,body: params)
          .then((json){
        if(json["status"]=="true")
        {
          isdeleted=true;
          message=json["message"];
        }
        else
        {
          isdeleted=false;
          message=json["message"];
        }
      });
    }
    on ErrorHandler catch(e)
    {
      if(e.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>NoIntenetConnection())
        );
      }
    }
  }
  updateemployee() async
  {


  }


}
