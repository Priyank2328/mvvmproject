import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mvvmproject/helpers/ApiHandler.dart';
import 'package:mvvmproject/models/Employee.dart';
import 'package:mvvmproject/providers/EmployeeProvider.dart';
import 'package:mvvmproject/resources/UrlResources.dart';
import 'package:provider/provider.dart';

class AddEmployee extends StatefulWidget {
  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  var grpvalue="M";
  var select="e1";
  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();
  EmployeeProvider providers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providers = Provider.of<EmployeeProvider>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 20.0),
              child: Text("Name"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color: Colors.yellow),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 20.0),
              child: Text("Salary"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _salary,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color: Colors.yellow),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text("Gender"),
            ),
            Row(
              children: [

                Container(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text("Male"),
                ),
                Radio(
                  value: "M",
                  groupValue: grpvalue,
                  onChanged: (val)
                  {
                    setState(() {
                      grpvalue=val;
                    });
                  },
                ),
                Text("Female"),
                Radio(
                  value: "F",
                  groupValue: grpvalue,
                  onChanged: (val)
                  {
                    setState(() {
                      grpvalue=val;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: DropdownButton(
                  icon: Icon(Icons.arrow_downward),
                  value: select,
                  onChanged: (val)
                  {
                    setState(() {
                      select = val;
                    });
                  },
                  items:[
                    DropdownMenuItem(
                      child: Text("1"),
                      value: "e1",
                    ),
                    DropdownMenuItem(
                      child: Text("2"),
                      value: "e2",
                    ),
                    DropdownMenuItem(
                      child: Text("3"),
                      value: "e3",
                    ),
                    DropdownMenuItem(
                      child: Text("4"),
                      value: "e4",
                    ),
                    DropdownMenuItem(
                      child: Text("5"),
                      value: "e5",
                    ),
                  ]
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async{
                  var txtname = _name.text.toString();
                  var txtsalary = _salary.text.toString();
                  var txtgender = grpvalue.toString();
                  var txtdepartment = select.toString();
                  Map<String,String> params ={
                    "ename":txtname,
                    "salary":txtsalary,
                    "department":txtdepartment,
                    "gender":txtgender,
                  };
                  await providers.addemployee(context,params);
                  if(providers.isinserted)
                  {
                    print(providers.message);
                      _name.text="";
                      _salary.text="";
                      grpvalue="";
                      select="";
                  }
                  else
                  {
                    print(providers.message);
                  }
                  // await ApiHandler.post(UrlResources.ADD_PRODUCT,body: params).then((json){
                  //   if(json["status"]=="true")
                  //     {
                  //       var msg = json["message"];
                  //       print(msg);
                  //     }
                  //     else
                  //     {
                  //       var msg = json["message"];
                  //       print(msg);
                  //     }
                  //     _name.text="";
                  //     _salary.text="";
                  //     grpvalue="";
                  //     select="";
                  // });
                  // var response = await http.post(url,body: params);
                  // Uri url = Uri.parse(UrlResources.ADD_EMPLOYEE);
                  // if(response.statusCode==200)
                  // {
                  //   var json = jsonDecode(response.body);
                  //   if(json["status"]=="true")
                  //   {
                  //     var msg = json["message"];
                  //     print(msg);
                  //   }
                  //   else
                  //   {
                  //     var msg = json["message"];
                  //     print(msg);
                  //   }
                  //   _name.text="";
                  //   _salary.text="";
                  //   grpvalue="";
                  //   select="";
                  // }
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
