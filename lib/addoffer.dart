import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/api.dart';
import 'package:test1/counter/counter2.dart';
import 'package:test1/counter/counter5.dart';
class addoffer extends StatefulWidget {
  String _id;
  addoffer(this._id);
  @override
  State<addoffer> createState() => _addofferState();
}

class _addofferState extends State<addoffer> {
  bool _isloading= false;
  String offerdetails= "";
  late SharedPreferences localStorage;
  late String _id;
  TextEditingController offerdetailsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  initState() {
    // TODO implement initState
    super.initState();
    _viewProduct();
  }
  Future<void> _viewProduct() async{
    _id = widget._id;
    print('Productname id ${_id}');
    var res = await Api().getData('/api/product/view_singleproductdetails/' +_id);
    var body = json.decode(res.body);
    print('body of datas${body}');
    setState(() {
      offerdetails = body['data'][0]['offerdetails'];

      offerdetailsController.text = offerdetails;

    });
  }
  _update() async {
    setState(() {
      var _isLoading = true;
    });
    _id = widget._id;
    print('productname_id ${_id}');

    var data = {
      "offerdetails": offerdetailsController.text,

    };
    print(data);
    var res =
    await Api().authData(data, '/api/product/update_offer_details/' + _id);
    var body = json.decode(res.body);
    print(res);

    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => counter2()));
    }else{
      Fluttertoast.showToast(
          msg: body['message'].toString(),
      backgroundColor: Colors.grey,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.green,
        title: Text('Edit Offer'),
    leading: IconButton(
    onPressed: () => Navigator.pop(context),
    icon: Icon(Icons.arrow_back)),

    ),
    body: SingleChildScrollView(
    child: Container(
    child: Form(
    key: _formKey,
    autovalidateMode: AutovalidateMode.always,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     SizedBox(
    height: 40,
    ),
    buildTextField("offerdetails",offerdetails, offerdetailsController),
    SizedBox(
    height: 10,
    ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.lightBlueAccent),
                height: 50,
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: (){
                    setState(() {
                      _update();
                    });
                  },
                  child:
                  Text('Update', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
    ),
    ),
    ),
    ),
        ),
    );
  }
  Widget buildTextField(
      String labelText, String placeholder, TextEditingController controller){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }

}

