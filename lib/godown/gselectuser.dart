import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test1/godown/godown1.dart';
import 'package:test1/godown/guser.dart';
import 'package:test1/godown/productview.dart';

import '../api.dart';

class gselectuser extends StatefulWidget {
  const gselectuser({Key? key}) : super(key: key);

  @override
  State<gselectuser> createState() => _gselectuserState();
}

class _gselectuserState extends State<gselectuser> {
  List titles = ["user 1", "user 2", "user 3", "user 4", "user 5"];

  List loadeddata = [];
  late String productid = '';
  // late String id='';

  _fetchData() async {
    //String id=widget.index;
    var res = await Api().getData('/api/cart/order_status');

    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        loadeddata = items;
        print(loadeddata);
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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Select User"),
          leading: IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const godown1())),
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
                      productid = loadeddata[index]['product_id'];
                      print('Product Id ${productid}');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProdctView(productid)));
                    },
                    title:
                        Text('User :- ${loadeddata[index]['name'].toString()}'),
                    trailing: Text(
                        'order date :- ${loadeddata[index]['date'].toString()}'),
                    subtitle: Text(
                        'contact number :- ${loadeddata[index]['phonenumber'].toString()}'),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
