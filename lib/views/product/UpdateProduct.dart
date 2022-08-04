import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mvvmproject/helpers/ApiHandler.dart';
import 'package:mvvmproject/models/Product.dart';
import 'package:mvvmproject/providers/ProductProvider.dart';
import 'package:mvvmproject/resources/UrlResources.dart';
import 'package:mvvmproject/views/product/ViewProduct.dart';
import 'package:provider/provider.dart';

class UpdateProduct extends StatefulWidget {
  var updateid="";
  UpdateProduct({this.updateid});
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {

  TextEditingController _title = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();
  ProductProvider provider;
  getsingledata() async
  {
    Map<String, String> params = {
      "pid": widget.updateid
    };
    await provider.getsinglerecord(context, params);
    setState(() {
      _title.text = provider.singleobj.pname.toString();
      _qty.text = provider.singleobj.qty.toString();
      _price.text = provider.singleobj.price.toString();
    });
  }
      // await ApiHandler.post(UrlResources.GET_SINGLE_PRODUCT,body: params).then((json){
      //   Products obj = Products.fromJson(json["data"]);
      //       setState((){
      //         _title.text = obj.pname.toString();
      //         _qty.text = obj.qty.toString();
      //         _price.text = obj.price.toString();
      //       });
      // });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getsingledata();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Update")),
      ),
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
                    Map<String,String> params = {
                      "pname":title,
                      "qty":qty,
                      "price":price,
                      "pid":widget.updateid,

                    };
                    await provider.saveproduct(context, params);

                    if(provider.issave)
                      {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>ViewProduct())
                        );
                      }
                    else
                      {
                        print("Error");
                      }
                    // await ApiHandler.post(UrlResources.UPDATE_PRODUCT,body: params).then((json){
                    //   if(json["status"]=="true")
                    //   {
                    //     Navigator.of(context).pop();
                    //     Navigator.of(context).pop();
                    //     Navigator.of(context).push(
                    //         MaterialPageRoute(builder: (context)=>ViewProduct())
                    //     );
                    //   }
                    // });
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
