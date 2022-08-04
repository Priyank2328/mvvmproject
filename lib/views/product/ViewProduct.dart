import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mvvmproject/helpers/ApiHandler.dart';
import 'package:mvvmproject/helpers/error_handler.dart';
import 'package:mvvmproject/models/Product.dart';
import 'package:mvvmproject/providers/ProductProvider.dart';
import 'package:mvvmproject/resources/UrlResources.dart';
import 'package:mvvmproject/views/other/NoIntenetConnection.dart';
import 'package:mvvmproject/views/product/UpdateProduct.dart';
import 'package:provider/provider.dart';
class ViewProduct extends StatefulWidget {
  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  ProductProvider providers;
  getdata() async
  {
    await providers.viewproduct(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providers = Provider.of<ProductProvider>(context,listen: false);
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    providers = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Products")),
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
                      Text(providers.alldata[index].pid.toString()),
                      Text(providers.alldata[index].pname.toString()),
                      Text(providers.alldata[index].qty.toString()),
                      Text(providers.alldata[index].price.toString()),
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
                                        var id = providers.alldata[index].pid.toString();
                                        Map<String,String> params = {
                                          "pid":id
                                        };
                                        await providers.deleteproduct(context, params);
                                        if(providers.isdeleted)
                                        {
                                          Navigator.of(context).pop();
                                          await providers.viewproduct(context);
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
                              onPressed: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>UpdateProduct(updateid: providers.alldata[index].pid.toString(),))
                                );
                              },
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
