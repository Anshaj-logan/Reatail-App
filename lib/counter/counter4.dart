import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test1/counter/counter5.dart';
import 'package:test1/api.dart';


class counter4 extends StatefulWidget {
  const counter4({Key? key}) : super(key: key);
//String index;
//counter4({required this.index});
  @override
  State<counter4> createState() => _counter4State();
}

class _counter4State extends State<counter4> {


  List imagesList = [
    "images/p1.png",
    "images/p2.png",
    "images/p3.png",
    "images/p4.png",
    "images/p5.png",
  ];
 /* List titles = [
   "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5"
  ];*/
  List loadeddata = [];
 late String productid='';
 // late String id='';

  _fetchData() async {
    //String id=widget.index;
    var res = await Api().getData('/api/product/view-productdetails');

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
          title: const Text('Add Offers'),
          backgroundColor: Colors.green,
          leading: IconButton(
    onPressed: () => Navigator.pop(context),
    icon: Icon(Icons.arrow_back)),

    ),

        body: ListView.builder(
            shrinkWrap: true,
            itemCount: loadeddata.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 2.0, horizontal: 4.0),
                child: Card(
                  child: GestureDetector(
                    onTap: () async{
                      productid=loadeddata[index]['_id'];
                      print(productid);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>counter5(productid: productid)));
                    },
                    child: ListTile(

                        title:Text(loadeddata[index]['productname'].toString()),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(imagesList[index]),
                    ),
                    ),
                  )));
            }),
      ),
    );
  }
}
