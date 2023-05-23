import 'package:flutter/material.dart';
import 'package:test1/counter/counter4.dart';
import 'package:test1/counter/counterhome.dart';


class counter2 extends StatefulWidget {

  const counter2({Key? key}) : super(key: key);

  @override
  State<counter2> createState() => _counter2State();
}

class _counter2State extends State<counter2> {
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
  String text= '';
  String productid='';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
              floatingActionButton: IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => counter4())),
              icon: Icon(Icons.add),
              ),
              appBar: AppBar(backgroundColor: Colors.green,
                title: const Text('Offered Items'),
                leading: IconButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const counterhome())),
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
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                         /* onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => counter3() ));
                          },*/
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
                      ),
                    );
                  },
                ),
              ),
            ))
    );
  }
}
