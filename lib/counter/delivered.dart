import 'package:flutter/material.dart';
import 'package:test1/counter/counter1.dart';
import 'package:test1/counter/counterhome.dart';

class delivered extends StatefulWidget {
  const delivered({Key? key}) : super(key: key);

  @override
  State<delivered> createState() => _deliveredState();
}

class _deliveredState extends State<delivered> {
  List titles = ["user 1", "user 2", "user 3", "user 4", "user 5"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton:ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const counter1())),
            child: Text('UPDATE',
                style: TextStyle(
                    fontSize: 15, color: Colors.white))
        ),
        appBar: AppBar(backgroundColor: Colors.green,
          title: Text("Delivered"),
          leading: IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const counterhome())),
              icon: Icon(Icons.arrow_back)),
        ),
        body: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index)

            {
              return Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    title: Text(titles[index]),
                  ),
                ),
              );

            }),

      ),
    );
  }
}
