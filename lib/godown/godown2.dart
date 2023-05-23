import 'package:flutter/material.dart';
import 'package:test1/godown/godown1.dart';

class godown2 extends StatefulWidget {
  const godown2({Key? key}) : super(key: key);

  @override
  State<godown2> createState() => _godown2State();
}

class _godown2State extends State<godown2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
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
                    backgroundImage: AssetImage("images/p4.png"),
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
                ElevatedButton(
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => godown1())),
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
