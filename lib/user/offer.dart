import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/user/Retail1.dart';
import 'package:test1/user/Retail2.dart';
import 'package:test1/user/home.dart';
import 'package:test1/user/offerdetails.dart';

import '../api.dart';

class offer extends StatefulWidget {
  const offer({Key? key}) : super(key: key);

  @override
  State<offer> createState() => _offerState();
}

class _offerState extends State<offer> {
  List imagesList = [
    "images/p1.png",
    "images/p2.png",
    "images/p3.png",
    "images/p4.png",
    "images/p5.png"
  ];
  List titles = ["Detol", "Chair", "Bubble Wrap", "Pickles", "Smart Watch"];

  late SharedPreferences localstorage;
  late String user_id;
  bool _isLoading = false;
  String quantity = "";

  String id = "";

  List loadeddata = [];
  late String productid = '';

  _fetchData() async {
    //String id=widget.index;
    var res = await Api().getData('/api/product/offer_product');

    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        loadeddata = items;
        print(loadeddata);
        // quantity = loadeddata['quantity'];
        // id = loadeddata['_id'];
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
      "product_id": id,
      "quantity": quantity,
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Offers'),
          backgroundColor: Colors.red,
          leading: IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const home())),
              icon: Icon(Icons.arrow_back)),
        ),
        body: ListView.builder(
            itemCount: loadeddata.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () async {
                      productid = loadeddata[index]['_id'];
                      print('product id ${productid}');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              offerdetails(productid)));
                      // AddCart();
                    },
                    title: Text(loadeddata[index]['productname'].toString()),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          "server/node/public/images/${loadeddata[index]['photo']}"),
                    ),
                    // trailing: IconButton(
                    //   onPressed: () async {
                    //
                    //   },
                    //   icon: Icon(
                    //     Icons.add_shopping_cart_rounded,
                    //     size: 30,
                    //     color: Colors.lightBlue,
                    //   ),
                    //   tooltip: 'Add cart',
                    // ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
