import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvvmproject/resources/StringResources.dart';
import 'package:mvvmproject/resources/StyleResources.dart';
import 'package:mvvmproject/views/auth/RegisterScreen.dart';
import 'package:mvvmproject/views/other/HomePage.dart';
import 'package:mvvmproject/widgets/MyPrimaryButton.dart';
import 'package:mvvmproject/widgets/MyTextBox.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  String _pwd;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("firstemail"))
    {
      setState(() {
        _email.text = prefs.getString("firstemail");
        _password.text = prefs.getString("firstpwd");
      });
    }
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
        title: Center(child: Text("Login")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.0),
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
              padding: const EdgeInsets.only(left: 20.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterScreen())
                  );
                },
                child: Text("Reset Password",style: GoogleFonts.alegreyaSans(fontWeight: FontWeight.bold,fontSize: 20.0),),
              ),
            ),
            SizedBox(height: 30.0,),
            MyPrimaryButton(
              btntext: "Register",
              onclick: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterScreen())
                );
              },
              width: 200.0,
            ),
            SizedBox(height: 10.0,),
            MyPrimaryButton(
              btntext: "Login",
              onclick: () async {
                var txtemail = _email.text.toString();
                var txtpwd = _password.text.toString();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                if(txtemail=="")
                {
                  Fluttertoast.showToast(
                      msg: "Please Enter Email",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
                else if(txtpwd==prefs.getString("firstpwd") && txtemail==prefs.getString("firstemail"))
                {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>HomePage())
                  );
                }
                else
                {
                  Fluttertoast.showToast(
                      msg: "Pin not match",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              },
              width: 200.0,
            ),
            Center(
                child: Text("OR"),
            ),
            MyPrimaryButton(
              btntext: "Login With Google",
              onclick: () async {
                final GoogleSignIn googleSignIn = GoogleSignIn();
                final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
                if (googleSignInAccount != null) {
                  final GoogleSignInAuthentication googleSignInAuthentication =
                  await googleSignInAccount.authentication;
                  final AuthCredential authCredential = GoogleAuthProvider.credential(
                      idToken: googleSignInAuthentication.idToken,
                      accessToken: googleSignInAuthentication.accessToken);
                  UserCredential result = await auth.signInWithCredential(authCredential);
                  User user = result.user;
                  var name = user.displayName.toString();
                  var email = user.email.toString();
                  var photo = user.photoURL.toString();
                  var googleid = user.uid.toString();
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.setString("fname", name);
                  pref.setString("femail", email);
                  pref.setString("picture", photo);
                  pref.setString("fgoogle", googleid);
                  pref.setString("islogin", "yes");
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>HomePage())
                  );
                }
              },
              width: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
