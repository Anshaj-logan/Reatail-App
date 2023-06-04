import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/user/Retail2.dart';
import 'package:test1/user/offer.dart';

import '../api.dart';

class offerdetails extends StatefulWidget {
  String productid;
  offerdetails(this.productid);

  @override
  State<offerdetails> createState() => _offerdetailsState();
}

class _offerdetailsState extends State<offerdetails> {
  late SharedPreferences localstorage;
  late String user_id;
  bool _isLoading = false;
  late int quantity;

  String Id = '';

  List loadeddata = [];
  late String productid = '';
  var items;

  _fetchData() async {
    localstorage = await SharedPreferences.getInstance();
    /*productid = (localStorage.getString('productid') ?? '');
    print('Pro id ${productid}');
    var res = await Api().getData(
        '/api/product/view_singleproductdetails/'+ productid.replaceAll('"', ''));
    print(res);*/
    String id = widget.productid;
    var res = await Api().getData(
        '/api/product/view_singleproductdetails/' + id.replaceAll('""', ''));
    if (res.statusCode == 200) {
      items = json.decode(res.body)['data'];
      quantity = items[0]['quantity'];
      print('quantity ${quantity}');
      Id = items[0]['_id'];
      print('product id ${Id}');
      print('productdetails${items}');
      setState(() {
        loadeddata = items;
      });
    } else {
      setState(() {
        loadeddata = [];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  Future AddCart() async {
    localstorage = await SharedPreferences.getInstance();
    user_id = (localstorage.getString('user_id') ?? '');
    print('User ID ${user_id}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "user_id": user_id.replaceAll('"', ''),
      "product_id": Id,
      "quantity": quantity.toString(),
    };
    print(data);
    var res = await Api().authData(data, '/api/cart/add');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      //   print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      //   Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>View_Comp()));
    } else {
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
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Details'),
            backgroundColor: Colors.red,
            leading: IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const offer())),
                icon: Icon(Icons.arrow_back)),
          ),
          body: SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: loadeddata.length,
                itemBuilder: (BuildContext context, int position) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 75),
                        child: Text(
                          loadeddata[position]['productname'],
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 150),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              "server/node/public/images/${loadeddata[position]['photo']}"),
                          backgroundColor: Colors.white,
                          radius: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: [
                            Text(
                              "Description :",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              loadeddata[position]['description'],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(15),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(),
                      //       labelText: 'Quantity',
                      //     ),
                      //   ),
                      // ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          AddCart();
                          //         Navigator.push(context,
                          // MaterialPageRoute(builder: (context) => offer()));
                        },
                        child: const Text('Add to cart',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
