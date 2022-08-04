import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoIntenetConnection extends StatefulWidget {
  @override
  State<NoIntenetConnection> createState() => _NoIntenetConnectionState();
}

class _NoIntenetConnectionState extends State<NoIntenetConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0,left: 10.0,right: 10.0),
                child: Image.asset("img/dog.jpg"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 200.0,),
                  Text("OOPS!",style: GoogleFonts.oswald(fontSize: 50.0),),
                  SizedBox(height: 5.0,),
                  Text("NO INTERNET",style: GoogleFonts.oswald(fontSize: 30.0),),
                  SizedBox(height: 5.0,),
                  Text("Please check your network connection",style: GoogleFonts.montserrat(fontSize: 15.0),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
