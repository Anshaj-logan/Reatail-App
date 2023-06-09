import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/api.dart';
import 'package:test1/user/edit.dart';
import 'package:test1/user/home.dart';

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  late SharedPreferences localStorage;
  String name = "";
  String phonenumber = "";
  String email = "";
  String username = "";
  late String login_id;
  late String id;
  List _loaduserdata = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    localStorage = await SharedPreferences.getInstance();
    login_id = (localStorage.getString('login_id') ?? '');
    print('Login id ${login_id}');
    var res = await Api()
        .getData('/api/register/view_user/' + login_id.replaceAll('"', ''));
    print(res);
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print('profile data${items}');
      setState(() {
        _loaduserdata = items;
      });
    } else {
      setState(() {
        _loaduserdata = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: const Text('My Account'),
              leading: IconButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const home())),
                  icon: Icon(Icons.arrow_back)),
              actions: [
                IconButton(
                    onPressed: () async {
                      login_id = _loaduserdata[0]['login_id'];
                      id = _loaduserdata[0]['_id'];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => edit(id, login_id)));
                    },
                    icon: Icon(Icons.edit),
                    tooltip: "Edit Profile"),
              ],
            ),
            body: ListView.builder(
                shrinkWrap: true,
                itemCount: _loaduserdata.length,
                itemBuilder: (BuildContext context, int position) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/img1.png"),
                          radius: 60,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          width: 320,
                          height: 500,
                          child: Column(
                            children: [
                              Text(
                                _loaduserdata[position]["name"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _loaduserdata[position]["email"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _loaduserdata[position]["phonenumber"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Text(_loaduserdata[position]["username"],
                              //   style: TextStyle(
                              //     fontSize: 25,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ));
  }
}
