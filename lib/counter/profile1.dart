import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/api.dart';
import 'package:test1/counter/profile.dart';

class profile1 extends StatefulWidget {
  String id;
  String login_id;
  profile1(this.id, this.login_id);

  @override
  State<profile1> createState() => _profile1State();
}

class _profile1State extends State<profile1> {
  bool _isLoading = false;
  String name = "";
  String email = "";
  String phonenumber = "";
  String username = "";
  bool passwordVisible = false;
  late SharedPreferences localStorage;
  late String _id;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  initState() {
    // TODO implement initState
    super.initState();
    passwordVisible = true;
    _viewCounter();
  }

  Future<void> _viewCounter() async {
    _id = widget.login_id;
    print('Log id ${_id}');
    var res = await Api().getData('/api/counter/view_counter/' + _id);
    var body = json.decode(res.body);
    print('body of datas${body}');
    setState(() {
      name = body['data'][0]['name'];
      email = body['data'][0]['email'];
      phonenumber = body['data'][0]['phonenumber'];
      username = body['data'][0]['username'];

      nameController.text = name;
      emailController.text = email;
      phonenumberController.text = phonenumber;
      usernameController.text = username;
    });
  }

  _update() async {
    setState(() {
      var _isLoading = true;
    });
    _id = widget.id;
    print('user id ${_id}');

    var data = {
      "name": nameController.text,
      "email": emailController.text,
      "phonenumber": phonenumberController.text,
      "username": usernameController.text,
    };
    print(data);
    var res = await Api()
        .authData(data, '/api/counter/update_counter_profile/' + _id);
    var body = json.decode(res.body);
    print(res);

    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => profile()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Edit Profile'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const profile(),
                ));
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  buildTextField("name", name, nameController),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("email", email, emailController),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField(
                      "phonenumber", phonenumber, phonenumberController),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // buildTextField("username", username, usernameController),
                  SizedBox(
                    height: 30,
                  ),

                  // ElevatedButton(onPressed: () {}, child: Text('Save' ,style: TextStyle(fontSize: 15,color: Colors.black),))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.lightBlueAccent),
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              onPressed: () {
                                setState(() {
                                  _update();
                                });
                              },
                              child: Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
