import 'package:flutter/material.dart';

class Retail4 extends StatefulWidget {
  const Retail4({Key? key}) : super(key: key);

  @override
  State<Retail4> createState() => _Retail4State();
}

class _Retail4State extends State<Retail4> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
        body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Image.asset('images/payment.png'),
        ),
        ),
      ),
    );
  }
}
