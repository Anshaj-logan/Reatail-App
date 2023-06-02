import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/user/historydetails.dart';
import 'package:test1/user/home.dart';

import '../api.dart';

class purchased extends StatefulWidget {
  const purchased({Key? key}) : super(key: key);

  @override
  State<purchased> createState() => _purchasedState();
}

class _purchasedState extends State<purchased> {
  late SharedPreferences localstorage;
  late String user_id;
  List cart = [];
  List imagesList = [
    "images/p1.png",
    "images/p2.png",
    "images/p3.png",
    "images/p4.png",
    "images/p5.png"
  ];
  List titles = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // totalId();
    // _fetchOrder();
    _fetchData();
  }

  _fetchData() async {
    localstorage = await SharedPreferences.getInstance();
    user_id = (localstorage.getString('user_id') ?? '');
    print('User ID ${user_id}');

    var res = await Api().getData(
        '/api/cart/view_purchased_products/' + user_id.replaceAll('"', ''));
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        cart = items;
      });
    } else {
      setState(() {
        cart = [];
        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text('Purchased Items'),
            backgroundColor: Colors.red,
            leading: IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const home())),
                icon: Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ListTile(
                    title: Text(cart[index]['productname'].toString()),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          "server/node/public/images/${cart[index]['photo']}"),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => historydetails()));
                    },
                    // ElevatedButton(onPressed: () {},style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent) , child: Text('Remove' ,style: TextStyle(fontSize: 15,color: Colors.black))),
                    // child:Padding(padding: const EdgeInsets.all(20.0)),
                  ),
                );
              },
            ),
          ),
        )));
  }
}
