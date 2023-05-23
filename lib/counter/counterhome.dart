import 'package:flutter/material.dart';
import 'package:test1/counter/counter2.dart';
import 'package:test1/counter/delivered.dart';
import 'package:test1/login..dart';
import 'package:test1/counter/profile.dart';

class counterhome extends StatefulWidget {
  const counterhome({Key? key}) : super(key: key);

  @override
  State<counterhome> createState() => _counterhomeState();
}

class _counterhomeState extends State<counterhome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(backgroundColor: Colors.green,
              title: const Text('Counter Home'),
            ),
            body: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(fit: BoxFit.cover,
                                    image: AssetImage('images/caccount.webp'))),
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profile())),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 180),
                                child: const Text(
                                  'My Account',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            width: 150,
                            height: 250,
                          )),
                      SizedBox(width: 35),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('images/cdelivery.png'))),
                          child: TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => delivered())),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 185),
                              child: const Text(
                                'Delivery Status',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          width: 150,
                          height: 250,
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/cmanage.png'))),
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => counter2())),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 185),
                                child: const Text(
                                  'Manage Offers',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            width: 150,
                            height: 250),
                      ),
                      SizedBox(width: 35),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                              image: DecorationImage(fit: BoxFit.cover,
                                  image: AssetImage('images/clogout.jpg'))),
                          child: TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login())),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 185),
                              child: const Text(
                                'Exit',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          width: 150,
                          height: 250,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
