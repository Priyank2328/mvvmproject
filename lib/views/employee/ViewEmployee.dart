import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mvvmproject/helpers/ApiHandler.dart';
import 'package:mvvmproject/helpers/error_handler.dart';
import 'package:mvvmproject/models/Employee.dart';
import 'package:mvvmproject/models/Product.dart';
import 'package:mvvmproject/providers/EmployeeProvider.dart';
import 'package:mvvmproject/resources/UrlResources.dart';
import 'package:mvvmproject/views/other/NoIntenetConnection.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
class ViewEmployee extends StatefulWidget {
  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
  EmployeeProvider providers;
  getdata() async
  {
    await providers.viewemployee(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providers = Provider.of<EmployeeProvider>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    providers = Provider.of<EmployeeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
      ),
      body: (providers.alldata!=null)?ListView.builder(
        itemCount: providers.alldata.length,
        itemBuilder: (context,index)
        {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Text(providers.alldata[index].eid.toString()),
                      Text(providers.alldata[index].ename.toString()),
                      Text(providers.alldata[index].salary.toString()),
                      Text(providers.alldata[index].department.toString()),
                      Text(providers.alldata[index].gender.toString()),
                      Text(providers.alldata[index].addedDatetime.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                AlertDialog alert = new AlertDialog(
                                  title: Text("Warning!",style: TextStyle(color: Colors.white),),
                                  backgroundColor: Colors.black,
                                  content: Text("Are you sure you want to delete record?",style: TextStyle(color: Colors.white),),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    }, child: Text("Cancel",style: TextStyle(color: Colors.white),)
                                    ),
                                    TextButton(onPressed: () async{
                                      var id = providers.alldata[index].eid.toString();
                                      Map<String,String> params = {
                                        "eid":id
                                      };
                                      await providers.deleteemployee(context, params);
                                      if(providers.isdeleted)
                                      {
                                        Navigator.of(context).pop();
                                        await providers.viewemployee(context);
                                      }
                                      else
                                      {
                                        print(providers.message);
                                      }
                                    }, child: Text("Delete",style: TextStyle(color: Colors.white),)
                                    ),
                                  ],
                                );
                                showDialog(context: context, builder: (BuildContext context){
                                  return alert;
                                });
                              },
                              child: Text("Delete"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60.0),
                            child: ElevatedButton(
                              onPressed: (){},
                              child: Text("Update"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ):
      Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.red,
          size: 50,
        ),
      ),
    );
  }
}
