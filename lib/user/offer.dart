import 'package:flutter/material.dart';
import 'package:test1/user/Retail1.dart';
import 'package:test1/user/Retail2.dart';
import 'package:test1/user/home.dart';
import 'package:test1/user/offerdetails.dart';

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
  List titles = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar: AppBar(
        title: const Text('Offers'),
    backgroundColor: Colors.red,
    leading: IconButton(
    onPressed: () => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const home())),
    icon: Icon(Icons.arrow_back)),
    ),
    body: ListView.builder(
    itemCount: imagesList.length,
    itemBuilder: (context,index) {
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
    child: Card(
    child: ListTile(
    onTap: () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const offerdetails()));
    },
    title: Text(titles[index]),
    leading: CircleAvatar(
    backgroundImage: AssetImage(imagesList[index]),
    ),

    ),
    ),
    );
    }
    ),
        ),
    );
  }
}
