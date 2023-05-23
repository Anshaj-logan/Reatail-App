import 'package:flutter/material.dart';
import 'package:test1/user/Retail2.dart';
import 'package:test1/user/offer.dart';

class offerdetails extends StatefulWidget {
  const offerdetails({Key? key}) : super(key: key);

  @override
  State<offerdetails> createState() => _offerdetailsState();
}

class _offerdetailsState extends State<offerdetails> {
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
                    MaterialPageRoute(builder: (context) => const offer())),
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
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quantity',
                    ),
                  ),
                ),

                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => offer())),
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
