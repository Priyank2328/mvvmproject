import 'package:flutter/material.dart';
import 'package:mvvmproject/views/auth/LoginPage.dart';
import 'package:mvvmproject/views/auth/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.0,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>RegisterScreen())
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Icon(Icons.drive_file_rename_outline,size: 30.0,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: Text("Change Name"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.0,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>RegisterScreen())
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Icon(Icons.contact_phone,size: 30.0,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: Text("Change Number"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.0,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>RegisterScreen())
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Icon(Icons.email,size: 30.0,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: Text("Chnge Id"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.0,),
            GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>LoginPage())
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Icon(Icons.logout,size: 30.0,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: Text("Logout"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.0,),
          ],
        ),
      ),
    );
  }
}
