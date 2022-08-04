import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvmproject/views/auth/LoginPage.dart';
import 'package:mvvmproject/widgets/MyPrimaryButton.dart';
import 'package:mvvmproject/widgets/MyTextBox.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _contact = TextEditingController();
  bool _obscureText = true;
  String _pwd;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Row(
          children: [
            Icon(Icons.app_registration,size: 30.0,),
            SizedBox(width: 20.0,),
            Text("Registered",style: GoogleFonts.oswald(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold),),
          ],
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.0,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Name"),
            ),
            MyTextBox(
              controller: _name,
              keyboard: TextInputType.text,
              icon: Icon(Icons.man),
              ispassward: false,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Email"),
            ),
            MyTextBox(
              controller: _email,
              keyboard: TextInputType.emailAddress,
              icon: Icon(Icons.email),
              ispassward: false,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("PassWord"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                validator: (val) => val.length < 6 ? 'Password too short.' : null,
                onSaved: (val) => _pwd = val,
                obscureText: _obscureText,
                controller: _password,
                cursorColor: Colors.green,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: GestureDetector(
                      onTap: _toggle,
                      child: Text(_obscureText ? "Show" : "Hide"),
                    ),
                  ),
                  prefixIcon: Icon(Icons.password),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Contact"),
            ),
            MyTextBox(
              controller: _contact,
              keyboard: TextInputType.number,
              icon: Icon(Icons.contact_phone),
              ispassward: false,
            ),
            MyPrimaryButton(
              btntext: "Save",
              width: 100.0,
              onclick: () async{
                var name = _name.text.toString();
                var email = _email.text.toString();
                var pwd = _password.text.toString();
                var contact = _contact.text.toString();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("firstname", name);
                prefs.setString("firstemail", email);
                prefs.setString("firstpwd", pwd);
                prefs.setString("firstcon", contact);
                _name.text="";
                _email.text="";
                _password.text="";
                _contact.text="";
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>LoginPage())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
