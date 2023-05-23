import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test1/api.dart';
import 'package:test1/login..dart';

class csignup extends StatefulWidget {
  const csignup({Key? key}) : super(key: key);

  @override
  State<csignup> createState() => _csignupState();
}

class _csignupState extends State<csignup> {
  bool _isloading=false;
  bool passwordVisible = false;
  bool passwordVisible2 = false;
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmController=TextEditingController();
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    passwordVisible2 = true;
  }
  final _formKey=GlobalKey<FormState>();
  void counterRegister()async{
    setState(() {
      _isloading=true;

    });
    var data={
      "name":nameController.text,
      "email":emailController.text,
      "phonenumber":phoneController.text,
      "username":usernameController.text,
      "password":passwordController.text,
      "confirmpassword":confirmController.text,

    };
    // print(data)
    var res=await Api().authData(data,'/api/counter');
    var body=json.decode(res.body);
    print(body);
    if(body["success"]==true){
      Fluttertoast.showToast(msg: body["message"].toString(),
          backgroundColor: Colors.grey
      );
      print('res${res}');

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Login()));

    }
    else{
      Fluttertoast.showToast(msg: body["message"].toString(),
          backgroundColor: Colors.grey
      );
    }
  }


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
                  Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: passwordController,
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: confirmController,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm password',
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

                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      counterRegister();
                    },
                    child: const Text('Sign Up',
                        style: TextStyle(color: Colors.black)),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
