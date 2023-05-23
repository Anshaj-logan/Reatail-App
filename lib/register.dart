import 'package:flutter/material.dart';
import 'package:test1/counter/csignup.dart';
import 'package:test1/godown/gsignup.dart';
import 'package:test1/login..dart';
import 'package:test1/user/signup.dart';


class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Register Page'),
              leading: IconButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login())),
                  icon: Icon(Icons.arrow_back)),
            ),
            body: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              image: DecorationImage(fit:BoxFit.cover ,
                                  image: AssetImage('images/user.jpg'))),
                          child: TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup())),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 110),
                              child: const Text(
                                'User',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          width: 200,
                          height: 200,
                        ),
                      ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                          image: DecorationImage(fit:BoxFit.cover,
                              image: AssetImage('images/cash.jpg'))),
                      child: TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => csignup())),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 110),
                          child: const Text(
                            'Counter',
                            style: TextStyle(
                                color: Colors.blue,
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
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),

                          image: DecorationImage(fit:BoxFit.cover ,
                              image: AssetImage('images/godown.jpg'))),
                      child: TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => gsignup())),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 110),
                          child: const Text(
                            'Godown',
                            style: TextStyle(
                                color: Colors.blue,
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
            )

            ),
          ),
        );
  }
}
