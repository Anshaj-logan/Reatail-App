import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test1/addoffer.dart';
import 'package:test1/api.dart';
import 'package:test1/counter/counter2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/counter/counter4.dart';

class counter5 extends StatefulWidget {
  // String id;
  String productid;
  counter5({required this.productid});

  //const counter5({Key? key}) : super(key: key);
  /*String productid;
counter5({required this.productid});*/
  @override
  State<counter5> createState() => _counter5State();
}

class _counter5State extends State<counter5> {
  late SharedPreferences localStorage;

  String productname = "";
  String description = "";
  String quantity = "";
  //String photo="";
  String price = "";
  String offerdetails = "";
  late String productid;
  late String _id;
  List loadeddata = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    localStorage = await SharedPreferences.getInstance();
    /*productid = (localStorage.getString('productid') ?? '');
    print('Pro id ${productid}');
    var res = await Api().getData(
        '/api/product/view_singleproductdetails/'+ productid.replaceAll('"', ''));
    print(res);*/
    String id = widget.productid;
    var res = await Api().getData(
        '/api/product/view_singleproductdetails/' + id.replaceAll('""', ''));
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
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
            actions: [
              IconButton(
                  onPressed: () async {
                    _id = loadeddata[0]['_id'];
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addoffer(_id)));
                  },
                  icon: Icon(Icons.edit),
                  tooltip: "Edit offer"),
            ],
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
