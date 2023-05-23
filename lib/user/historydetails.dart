import 'package:flutter/material.dart';
import 'package:test1/user/purchased.dart';

class historydetails extends StatefulWidget {
  const historydetails({Key? key}) : super(key: key);

  @override
  State<historydetails> createState() => _historydetailsState();
}

class _historydetailsState extends State<historydetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Details'),
            backgroundColor: Colors.red,
            leading: IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const purchased())),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
