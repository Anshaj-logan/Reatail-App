import 'package:flutter/material.dart';
import 'package:test1/counter/csignup.dart';
import 'package:test1/godown/gaccount.dart';
import 'package:test1/godown/gedit.dart';
import 'package:test1/godown/gselectuser.dart';
import 'package:test1/godown/gsignup.dart';
import 'package:test1/godown/guser.dart';
import 'package:test1/login..dart';
import 'package:test1/register.dart';
import 'package:test1/user/Retail4.dart';
import 'package:test1/counter/counter1.dart';
import 'package:test1/counter/counter2.dart';
import 'package:test1/counter3.dart';
import 'package:test1/counter/counter4.dart';
import 'package:test1/counter/counter5.dart';
import 'package:test1/counter/counterhome.dart';
import 'package:test1/counter/delivered.dart';
import 'package:test1/counter/delivereddetails.dart';
import 'package:test1/godown/godown2.dart';
import 'package:test1/godown/godown3.dart';
import 'package:test1/godown/godownhome.dart';
import 'package:test1/godown/godown1.dart';
import 'package:test1/user/historydetails.dart';
import 'package:test1/user/Retail1.dart';
import 'package:test1/user/Retail2.dart';
import 'package:test1/user/Retail3.dart';
import 'package:test1/user/offer.dart';
import 'package:test1/user/offerdetails.dart';
import 'package:test1/counter/profile.dart';
import 'package:test1/counter/profile1.dart';
import 'package:test1/user/purchased.dart';
import 'package:test1/user/purchaseddetails.dart';
import 'package:test1/splashscreen.dart';
import 'package:test1/user/account.dart';
import 'package:test1/user/edit.dart';
import 'package:test1/user/home.dart';
import 'package:test1/user/signup.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build( BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}


