import 'package:flutter/material.dart';
import 'package:test1/user/historydetails.dart';
import 'package:test1/user/home.dart';

class purchased extends StatefulWidget {
  const purchased({Key? key}) : super(key: key);

  @override
  State<purchased> createState() => _purchasedState();
}

class _purchasedState extends State<purchased> {
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
              appBar: AppBar(
                title: const Text('Purchased Items'),backgroundColor: Colors.red,
                leading: IconButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const home())),
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => historydetails() ));
                        },
                        // ElevatedButton(onPressed: () {},style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent) , child: Text('Remove' ,style: TextStyle(fontSize: 15,color: Colors.black))),
                        // child:Padding(padding: const EdgeInsets.all(20.0)),
                      ),
                    );
                  },
                ),
              ),
            ))
    );
  }
}
