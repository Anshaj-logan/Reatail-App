import 'package:flutter/material.dart';
import 'package:test1/godown/godown1.dart';
import 'package:test1/godown/guser.dart';

class gselectuser extends StatefulWidget {
  const gselectuser({Key? key}) : super(key: key);

  @override
  State<gselectuser> createState() => _gselectuserState();
}

class _gselectuserState extends State<gselectuser> {

  List titles = ["user 1", "user 2", "user 3", "user 4", "user 5"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.teal,
          title: Text("Select User"),
          leading: IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const godown1())),
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
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const guser()));
                    },
                    title: Text(titles[index]),
                  ),
                ),
              );

            }),

      ),
    );
  }
}
