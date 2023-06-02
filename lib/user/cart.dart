import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/user/placeorder.dart';

import '../api.dart';
import 'Retail3.dart';
import 'emptycart.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Uint8List? imageBytes;
  // ApiService client = ApiService();
  bool _isLoading = false;
  var product;
  late SharedPreferences localstorage;
  late String user_id;
  List cart = [];
  bool isLoading = false;
  late String cart_id;
  late int qty;
  late String Id;
  late int price;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    localstorage = await SharedPreferences.getInstance();
    user_id = (localstorage.getString('user_id') ?? '');
    print('User ID ${user_id}');

    var res = await Api()
        .getData('/api/cart/view_cart/' + user_id.replaceAll('"', ''));
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        cart = items;

        /*  List productsWithCartStatusZero =
            cart.where((item) => item['cart_status'] == 0).toList();
        for (var product in productsWithCartStatusZero) {
          print('Product Name: ${product['p_name']}');
          print('Product ID: ${product['product_id']}');
          print('Image: ${product['image']}');
          print('---');
        }*/
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

  _deleteData(String id) async {
    var res =
        await Api().getData('/api/cart/delete_cart/' + id.replaceAll('"', ''));
    if (res.statusCode == 200) {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cart()));
        Fluttertoast.showToast(
          msg: "Removed from cart",
          backgroundColor: Colors.grey,
        );
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

  _increment(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var res =
        await Api().getData('/api/cart/increment/' + id.replaceAll('"', ''));
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(body);
      setState(() {
        // qty++;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cart()));
      });
      // Fluttertoast.showToast(
      //   msg: body['message'].toString(),
      //   backgroundColor: Colors.grey,
      // );
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  _decrement(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var res =
        await Api().getData('/api/cart/decrement/' + id.replaceAll('"', ''));
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(body);
      setState(() {
        //  qty--;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cart()));
      });
      // Fluttertoast.showToast(
      //   msg: body['message'].toString(),
      //   backgroundColor: Colors.grey,
      // );
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  // Future PlaceOrders() async {
  //   // prefs = await SharedPreferences.getInstance();
  //   // user_id = (prefs.getInt('user_id') ?? 0);
  //   print('login_id_complaint ${user_id}');
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   var data = {
  //     "user": user_id.toString(),
  //   };
  //   print(data);
  //   var res = await Api().authData(data, '/api/order');
  //   var body = json.decode(res.body);
  //   print(body);
  //   if (body['success'] == true) {
  //     cart.clear();
  //
  //     // Navigator.pushReplacement(
  //     //     context, MaterialPageRoute(builder: (context) => Retail3()));
  //     print(body);
  //     Fluttertoast.showToast(
  //       msg: body['message'].toString(),
  //       backgroundColor: Colors.grey,
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: body['message'].toString(),
  //       backgroundColor: Colors.grey,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('My Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: cart.isEmpty
          ? Emptycart() // Show empty cart image
          : ListView.builder(
              shrinkWrap: true,
              itemCount: cart.length,
              itemBuilder: (context, index) {
                product = cart[index];
                // final firstWord = cart[index]['p_name'].split(' ').first;
                // cart_id = cart[index]['_id'];
                //  qty = int.parse(cart[index]['quantity']);
                return Card(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200]),
                        child: Column(
                          children: [
                            Text(
                              cart[index]['productname'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "server/node/public/images/${cart[index]['photo']}"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "₹-${cart[index]['price'].toString()}",
                            ),
                            SizedBox(height: 5),
                            /* Text(
                              "₹" + cart[index]['total_price'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),*/
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                            ),
                            onPressed: () async {
                              Id = cart[index]['_id'];
                              setState(() {
                                _deleteData(Id);
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                child: FloatingActionButton(
                                  onPressed: () async {
                                    Id = cart[index]['_id'];
                                    setState(() {
                                      _decrement(Id);
                                    });
                                  },
                                  backgroundColor: Colors.grey,
                                  child:
                                      Icon(Icons.remove, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                cart[index]['quantity'].toString(),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                child: FloatingActionButton(
                                  onPressed: () async {
                                    Id = cart[index]['_id'];
                                    setState(() {
                                      _increment(Id);
                                    });
                                  },
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.add, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ));
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Colors.yellow,
          child: InkWell(
            onTap: () async {
              price = cart[0]['total_amount'];
              print('Total Price ${price}');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PlaceOrder()));

              // PlaceOrders();
            },
            child: const SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Place Order',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
