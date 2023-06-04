import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class ProdctView extends StatefulWidget {
  String productid;
  ProdctView(this.productid);

  @override
  State<ProdctView> createState() => _ProdctViewState();
}

class _ProdctViewState extends State<ProdctView> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Details'),
            backgroundColor: Colors.green,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back)),
            // actions: [
            //   IconButton(
            //       onPressed: () async {
            //         // _id = loadeddata[0]['_id'];
            //         // Navigator.push(context,
            //         //     MaterialPageRoute(builder: (context) => addoffer(_id)));
            //       },
            //       icon: Icon(Icons.edit),
            //       tooltip: "Edit offer"),
            // ],
          ),
          body: ListView.builder(
              shrinkWrap: true,
              itemCount: loadeddata.length,
              itemBuilder: (BuildContext context, int position) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            "server/node/public/images/${loadeddata[position]['photo']}"),
                        radius: 100,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        width: 320,
                        height: 500,
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                'Name:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(width: 20),
                              Text(
                                loadeddata[position]["productname"],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Description:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(width: 20),
                              Text(
                                loadeddata[position]["description"].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Quantity:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(width: 20),
                              Text(
                                loadeddata[position]["quantity"].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          /* Row(
                              children: [Text('photo:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                SizedBox(width: 20),
                                Text(loadeddata[position]["photo"].toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),*/
                          Row(
                            children: [
                              Text(
                                'Price:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(width: 20),
                              Text(
                                loadeddata[position]["price"].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'offerdetails:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(width: 20),
                              Text(
                                loadeddata[position]["offerdetails"].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
