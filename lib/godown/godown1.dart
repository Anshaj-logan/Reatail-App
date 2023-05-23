import 'package:flutter/material.dart';
import 'package:test1/godown/gaccount.dart';
import 'package:test1/godown/gselectuser.dart';
import 'package:test1/login..dart';
class godown1 extends StatefulWidget {
  const godown1({Key? key}) : super(key: key);

  @override
  State<godown1> createState() => _godown1State();
}

class _godown1State extends State<godown1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(backgroundColor: Colors.teal,
              title: const Text('Godown'),
            ),
            body: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                              width: 2,
                            ),
                            image: DecorationImage(fit: BoxFit.cover,
                                image: AssetImage('images/gprofile.png'))),
                        child: TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => gaccount())),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 110),
                            child: const Text(
                              'My Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                              width: 2,
                            ),
                            image: DecorationImage(fit: BoxFit.cover,
                                image: AssetImage('images/selectuser.png'))),
                        child: TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => gselectuser())),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 110),
                            child: const Text(
                              'Select User',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                              width: 2,
                            ),

                            image: DecorationImage(fit: BoxFit.cover,
                                image: AssetImage('images/gout.png'))),
                        child: TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login())),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 110),
                            child: const Text(
                              'Log Out',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
            )

        ),
      ),
    );
  }
}
