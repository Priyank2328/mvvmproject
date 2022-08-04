import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mvvmproject/helpers/ApiHandler.dart';
import 'package:mvvmproject/providers/ProductProvider.dart';
import 'package:mvvmproject/resources/UrlResources.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController _title = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();
  ProductProvider providers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providers = Provider.of<ProductProvider>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      //  title qty price button
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Title"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _title,
                cursorColor: Colors.green,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
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
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _qty,
                cursorColor: Colors.green,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
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
              child: Text("Price"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _price,
                cursorColor: Colors.green,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
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
            SizedBox(height: 50.0,),
            Center(
              child: Container(
                child: GestureDetector(
                  onTap: () async{
                    var title = _title.text.toString();
                    var qty = _qty.text.toString();
                    var price = _price.text.toString();
                    Map<String,String> params ={
                      "pname":title,
                      "qty":qty,
                      "price":price
                    };
                    await providers.addproduct(context,params);
                    if(providers.isinserted)
                    {
                      print(providers.message);
                      _title.text="";
                      _qty.text="";
                      _price.text="";
                    }
                    else
                    {
                      print(providers.message);
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("Submit",style: TextStyle(fontSize: 20.0,color: Colors.black),)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
