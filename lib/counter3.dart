import 'package:flutter/material.dart';
import 'package:test1/counter/counter2.dart';

class counter3 extends StatefulWidget {
  const counter3({Key? key}) : super(key: key);

  @override
  State<counter3> createState() => _counter3State();
}

class _counter3State extends State<counter3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Update Offer'),
            backgroundColor: Colors.green,
            leading: IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const counter2())),
                icon: Icon(Icons.arrow_back)),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 75),
                      child: Text(
                        'Item 1',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 150),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/p5.png"),
                    backgroundColor: Colors.white,
                    radius: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Description',style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Update Offer',
                    ),
                  ),
                ),

                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => counter2())),
                  child:
                  const Text('Done', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
