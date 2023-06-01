import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/counter/counterhome.dart';
import 'package:test1/godown/godown1.dart';
import 'package:test1/register.dart';
import 'package:test1/user/home.dart';

import 'api.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String user = "1";
  String counter = "2";
  String godown = "3";
  String storedValue = "1";
  late SharedPreferences localstorage;
  String Login_id = "";
  String role = "";
  String status = "";
  bool _isloading = false;
  bool _obscureText = true;
  bool passwordVisible = false;

  final us = TextEditingController();
  final pwd = TextEditingController();

  _pressloginButton() async {
    setState(() {
      _isloading = true;
    });
    var data = {
      "username": us.text.trim(),
      "password": pwd.text.trim(),
    };
    print(data);
    var res = await Api().authData(data, '/api/login/');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);
      role = json.encode(body['role']);
      status = json.encode(body['status']);
      print('user ${user}');
      print('role ${role}');
      print('status ${status}');
      if (user == role.replaceAll('"', '') &&
          storedValue == status.replaceAll('"', '')) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      } else if (counter == role.replaceAll('"', '') &&
          storedValue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => counterhome(),
        ));
      } else if (godown == role.replaceAll('"', '') &&
          storedValue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => godown1(),
        ));
      } else {
        Fluttertoast.showToast(
          msg: body['message'].toString(),
          backgroundColor: Colors.grey,
        );
      }
      localstorage = await SharedPreferences.getInstance();
      localstorage.setString('role', role.toString());
      localstorage.setString(
          'login_id', json.encode(body['login_id']).toString());
      localstorage.setString(
          'counter_id', json.encode(body['counter_id']).toString());
      localstorage.setString(
          'godown_id', json.encode(body['godown_id']).toString());
      localstorage.setString(
          'user_id', json.encode(body['user_id']).toString());
      String login_id = (localstorage.getString('login_id') ?? '');
      String counter_id = (localstorage.getString('counter_id') ?? '');
      String user_id = (localstorage.getString('user_id') ?? '');
      String godown_id = (localstorage.getString('godown_id') ?? '');
      print('login_id${login_id}');
      print('User_id${user_id}');
      print('counter_id${counter_id}');
      print('godown_id${godown_id}');
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
    String _password = "";
    @override
    void dispose() {
      us.dispose();
      pwd.dispose();
      super.dispose();
    }

    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    void initState() {
      super.initState();
      passwordVisible = true;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Text(
                      'LOGIN',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/account.png"),
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: us,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: pwd,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'password',
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        alignLabelWithHint: false,
                        filled: true,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pressloginButton();
                    },
                    child: const Text('Login',
                        style: TextStyle(color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => register()));
                    },
                    child: const Text('Sign Up'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
