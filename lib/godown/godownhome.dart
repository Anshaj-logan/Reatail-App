/*
import 'package:flutter/material.dart';
import 'package:test1/godown/gaccount.dart';
import 'package:test1/godown/godown1.dart';
import 'package:test1/godown/godown3.dart';
import 'package:test1/login..dart';

class godownhome extends StatefulWidget {
  const godownhome({Key? key}) : super(key: key);

  @override
  State<godownhome> createState() => _godownhomeState();
}

class _godownhomeState extends State<godownhome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home:
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Godown'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contacts), text: "Products"),
                Tab(icon: Icon(Icons.camera_alt), text: "Orders")
              ],
            ),
          ),
          body://Center(child: Text('godown')),
          TabBarView(
            children: [
              godown1(),
              godown3(),
            ],
          ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(decoration: BoxDecoration(color: Colors.lightBlue),
                  child: Text('Retail'),
        ),
              ListTile(
                title: Text('My Account'),
                onTap:() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => gaccount())),
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login())),

              ),
            ],
          ),
        ),

        */
/*  *//*

        ),
      ),
    );
  }
}
*/
