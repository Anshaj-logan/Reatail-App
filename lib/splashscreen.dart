import 'package:flutter/material.dart';
import 'package:test1/counter/counterhome.dart';
import 'package:test1/godown/godown1.dart';
import 'package:test1/user/home.dart';
import 'package:test1/login..dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  String user = "1";
  String counter = "2";
  String godown = "3";
  late SharedPreferences localstorage;
  String role = "";

  checkRole()async{
    localstorage= await SharedPreferences.getInstance();
    role=(localstorage.getString('role')??'');

    if (user == role.replaceAll('"', '')) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => home()));
    }
    else if (counter == role.replaceAll('"', '')){
      Navigator.of(context).push(MaterialPageRoute(builder:  (context)=> counterhome(),));
    }
    else if (godown == role.replaceAll('"', '')){
      Navigator.of(context).push(MaterialPageRoute(builder:  (context)=> godown1(),));
    }
    else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login(),));
    }
    }
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () =>checkRole() );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                       child: Image.asset("images/splash.jpg",
                       height: 500,
                         width: 500,
                         fit: BoxFit.cover,
                       ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
