import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvvmproject/providers/EmployeeProvider.dart';
import 'package:mvvmproject/providers/ProductProvider.dart';
import 'package:mvvmproject/views/auth/LoginPage.dart';
import 'package:mvvmproject/views/auth/RegisterScreen.dart';
import 'package:mvvmproject/views/employee/AddEmployee.dart';
import 'package:mvvmproject/views/other/HomePage.dart';
import 'package:mvvmproject/views/other/NoIntenetConnection.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}