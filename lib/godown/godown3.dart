import 'package:flutter/material.dart';
import 'package:test1/godown/godown2.dart';
import 'package:test1/godown/godown4.dart';

class godown3 extends StatefulWidget {
  const godown3({Key? key}) : super(key: key);

  @override
  State<godown3> createState() => _godown3State();
}

class _godown3State extends State<godown3> {
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
        body: ListView.builder(
            itemCount: imagesList.length,
            itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const godown4()));
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
