import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test1/counter/counter1.dart';
import 'package:test1/counter/counterhome.dart';

import '../api.dart';

class delivered extends StatefulWidget {
  const delivered({Key? key}) : super(key: key);

  @override
  State<delivered> createState() => _deliveredState();
}

class _deliveredState extends State<delivered> {
  List titles = ["user 1", "user 2", "user 3", "user 4", "user 5"];

  List loadeddata = [];
  late String productid = '';
  late int qty;
  late String cartid = '';
  // late String id='';

  _fetchData() async {
    //String id=widget.index;
    var res = await Api().getData('/api/cart/delivery_status');

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
                  MaterialPageRoute(builder: (context) => const counterhome())),
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
                      // cartid = loadeddata[index]['_id'];
                      // productid = loadeddata[index]['product_id'];
                      // qty = loadeddata[index]['quantity'];
                      // print('Product Id ${productid}');
                      // print('Cart Id ${cartid}');
                      // print('Quantity ${qty}');
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         ProdctView(productid, qty, cartid)));
                    },
                    title:
                        Text('User :- ${loadeddata[index]['name'].toString()}'),
                    trailing: Column(
                      children: [
                        Text(
                            'deliver date :- ${loadeddata[index]['date'].toString()}'),
                        SizedBox(
                          height: 5,
                        ),
                        Icon(Icons.done_all_sharp)
                        // Row(
                        //   children: [
                        //     Text('delivered'),
                        //     Icon(Icons.done_all_outlined)
                        //   ],
                        // ),
                      ],
                    ),
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
