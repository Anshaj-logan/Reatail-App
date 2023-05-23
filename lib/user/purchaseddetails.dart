import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test1/api.dart';
import 'package:test1/user/Retail2.dart';

class purchaseddetails extends StatefulWidget {
  const purchaseddetails({Key? key}) : super(key: key);

  @override
  State<purchaseddetails> createState() => _purchaseddetailsState();
}

class _purchaseddetailsState extends State<purchaseddetails> {
  bool _isloading=false;
  TextEditingController quantityController=TextEditingController();
  @override
  final _formKey=GlobalKey<FormState>();
  void quantity()async{
    setState(() {
      _isloading=true;

    });
    var data={
      "name":quantityController.text,
    };
    // print(data)
    var res=await Api().authData(data,'/api/product/');
    var body=json.decode(res.body);
    print(body);
    if(body["success"]==true){
      Fluttertoast.showToast(msg: body["message"].toString(),
          backgroundColor: Colors.grey
      );
      print('res${res}');

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Retail2()));

    }
    else{
      Fluttertoast.showToast(msg: body["message"].toString(),
          backgroundColor: Colors.grey
      );
    }
  }
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Details'),
            backgroundColor: Colors.red,
            leading: IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Retail2())),
                icon: Icon(Icons.arrow_back)),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 75),
                        child: Text(
                          'Item 1',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/p2.png"),
                      backgroundColor: Colors.white,
                      radius: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      'Description',style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: quantityController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Quantity',
                      ),
                    ),
                  ),

                 /* ElevatedButton(
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Retail2())),
                    child:
                    const Text('Done', style: TextStyle(color: Colors.black)),
                  ),*/
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      quantity();
                    },
                    child: const Text('Done',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
