import 'package:flutter/material.dart';
import 'package:test1/login..dart';
import 'dart:async';
class Retail0 extends StatefulWidget {
  const Retail0({Key? key}) : super(key: key);

  @override
  State<Retail0> createState() => _Retail0State();
}

class _Retail0State extends State<Retail0> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("GeeksForGeeks")),
      body: Center(
          child:Text("Home page",textScaleFactor: 2,)
      ),
    );
  }
}

    



