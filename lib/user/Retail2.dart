import 'package:flutter/material.dart';
import 'package:test1/user/Retail1.dart';
import 'package:test1/user/Retail3.dart';
import 'package:test1/user/purchaseddetails.dart';

class Retail2 extends StatefulWidget {
  const Retail2({Key? key}) : super(key: key);

  @override
  State<Retail2> createState() => _Retail2State();
}

class _Retail2State extends State<Retail2> {
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
        home: SafeArea(
            child: Scaffold(
          floatingActionButton: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Retail3())),
              child: const Text('Done',style: TextStyle(color: Colors.white))),
          appBar: AppBar(backgroundColor: Colors.red,
            title: const Text('Total Items'),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(
                    MaterialPageRoute(builder: (context) => const Retail1())),
                icon: Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ListTile(
                        title: Text(titles[index]),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(imagesList[index]),
                        ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => purchaseddetails() ));
                      },
                      iconColor: Colors.redAccent,
                      trailing: Container(
                        width: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: IconButton(
                              onPressed: () {
                                setState(() {
                                  titles.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.delete),
                              tooltip: 'Remove',
                            ))
                          ],
                        ),
                      )
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
