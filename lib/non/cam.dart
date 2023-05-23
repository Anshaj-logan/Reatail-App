import 'package:flutter/material.dart';
import 'package:test1/user/Retail2.dart';

class cam extends StatelessWidget {
  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Retail2()));
  }

  const cam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
