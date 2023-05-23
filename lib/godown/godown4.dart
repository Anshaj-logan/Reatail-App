import 'package:flutter/material.dart';
import 'package:test1/godown/godown3.dart';

class godown4 extends StatefulWidget {
  const godown4({Key? key}) : super(key: key);

  @override
  State<godown4> createState() => _godown4State();
}

class _godown4State extends State<godown4> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => godown3())),
              child: const Text('Done',style: TextStyle(color: Colors.black))),
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
                    backgroundImage: AssetImage("images/p2.png"),
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
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Quantity',style: TextStyle(fontSize: 20),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
