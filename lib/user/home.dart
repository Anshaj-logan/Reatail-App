import 'package:flutter/material.dart';
import 'package:test1/user/Retail1.dart';
import 'package:test1/user/account.dart';
import 'package:test1/login..dart';
import 'package:test1/user/offer.dart';
import 'package:test1/user/purchased.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            floatingActionButton: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login())),
                child:
                    const Text('Exit', style:TextStyle(color: Colors.white))),
            appBar: AppBar(backgroundColor: Colors.red,
              title: const Text('Home Page'),
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
                                color: Colors.redAccent,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                              image: DecorationImage(fit:BoxFit.cover ,
                                  image: AssetImage('images/uaccount.webp'))),
                          child: TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => account())),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 185),
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
                        ),
                      ),
                      SizedBox(width: 35),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                              image: DecorationImage(fit:BoxFit.cover ,
                                  image: AssetImage('images/ucart.webp'))),
                          child: TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Retail1())),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 185),
                              child: const Text(
                                'Purchase Now',
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
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(fit:BoxFit.cover,
                                    image: AssetImage('images/upurchase.jpg'))),
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => purchased())),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 185),
                                child: const Text(
                                  'Purchased Items',
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
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(fit:BoxFit.cover,
                                image: AssetImage('images/uoffer.jpg'))),
                        child: TextButton(
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => offer())),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 185),
                            child: const Text(
                              'Special offer',
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
