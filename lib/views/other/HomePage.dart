import 'package:flutter/material.dart';
import 'package:mvvmproject/views/auth/LoginPage.dart';
import 'package:mvvmproject/views/employee/AddEmployee.dart';
import 'package:mvvmproject/views/employee/ViewEmployee.dart';
import 'package:mvvmproject/views/other/SettingPage.dart';
import 'package:mvvmproject/views/product/AddProduct.dart';
import 'package:mvvmproject/views/product/ViewProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {


  var txtname = "";
  var txtemail="";
  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    txtname = prefs.getString("fname");
    txtemail = prefs.getString("femail");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(txtname),
            GestureDetector(
              onTap: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>SettingPage())
                );
              },
                child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 58.0,left: 15.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        child: Text("P"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 58.0,left: 20.0),
                      child: Text(txtemail),
                    ),
                  ],
                ),
                SizedBox(height: 50.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>AddProduct())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("ADD PRODUCT",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewProduct())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("VIEW PRODUCT",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),

                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>AddEmployee())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("ADD EMPLOYEE",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewEmployee())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("VIEW EMPLOYEE",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>LoginPage())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("Logout",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                // SizedBox(height: 20.0,),
                // GestureDetector(
                //   onTap: (){
                //     Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context)=>ViewEmployeeModel())
                //     );
                //   },
                //   child: Container(
                //       width: MediaQuery.of(context).size.width,
                //       padding: EdgeInsets.all(10.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(width: 3,color: Colors.black),
                //       ),
                //       child: Text("EMPLOYEE WITH MODEL",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                //   ),
                // ),
                // SizedBox(height: 20.0,),
                // GestureDetector(
                //   onTap: (){
                //     Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context)=>ReadApiJson())
                //     );
                //   },
                //   child: Container(
                //       width: MediaQuery.of(context).size.width,
                //       padding: EdgeInsets.all(10.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(width: 3,color: Colors.black),
                //       ),
                //       child: Text("VIEW API JSON",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                //   ),
                // ),
                // SizedBox(height: 20.0,),
                // GestureDetector(
                //   onTap: (){
                //     Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context)=>AnimalView())
                //     );
                //   },
                //   child: Container(
                //       width: MediaQuery.of(context).size.width,
                //       padding: EdgeInsets.all(10.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(width: 3,color: Colors.black),
                //       ),
                //       child: Text("VIEW ANIMAL JSON",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                //   ),
                // ),
                // SizedBox(height: 20.0,),
                // GestureDetector(
                //   onTap: (){
                //     Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context)=>ViewAnimalModel())
                //     );
                //   },
                //   child: Container(
                //       width: MediaQuery.of(context).size.width,
                //       padding: EdgeInsets.all(10.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(width: 3,color: Colors.black),
                //       ),
                //       child: Text("ANIMAL JSON WITH MODEL",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
