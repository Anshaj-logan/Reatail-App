import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import 'home.dart';

class PaymentScreen extends StatefulWidget {
  // final String price;
  // PaymentScreen(this.price);
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

enum Gender { credit_card, debit_card, net_banking, cashon_delivery }

Gender? _payment = Gender.credit_card;
String? payment;

// String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime? _selectDate;
    late SharedPreferences prefs;
    bool isLoading = false;
    late int user_id, order_id;
    late String amount;
    Future<void> _showDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // title: const Text("payment successfull"),
              content: Image.asset("images/paymentsuc.png"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => home()));
                    },
                    child: Text("OK"))
              ],
            );
          });
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      // amount = widget.price;
      // print(amount);
    }

    Future PlaceOrders() async {
      // amount = widget.price;

      // print(amount);
      prefs = await SharedPreferences.getInstance();
      user_id = (prefs.getInt('user_id') ?? 0);
      print('login_id_complaint ${user_id}');
      setState(() {
        isLoading = true;
      });

      var data = {
        "user": user_id.toString(),
        // "amount": amount,
        // "date": formattedDate
      };
      print(data);
      var res = await Api().authData(data, '/api/payment');
      var body = json.decode(res.body);
      print(body);
      if (body['success'] == true) {
        _showDialog(context);

        print(body);
        Fluttertoast.showToast(
          msg: body['message'].toString(),
          backgroundColor: Colors.grey,
        );
      } else {
        Fluttertoast.showToast(
          msg: body['message'].toString(),
          backgroundColor: Colors.grey,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Payments"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => home()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Payment",
              //   style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.green,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Suggested for you")),
              ),
              ListTile(
                title: const Text('Credit_card'),
                leading: Radio<Gender>(
                  value: Gender.credit_card,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Debit_card'),
                leading: Radio<Gender>(
                  value: Gender.debit_card,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Net banking'),
                leading: Radio<Gender>(
                  value: Gender.net_banking,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Cash on delivery'),
                leading: Radio<Gender>(
                  value: Gender.cashon_delivery,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  // labelText: amount,
                  // hintText: amount,
                  hintStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),

              SizedBox(height: 30),
              SizedBox(
                height: 30,
                width: 110,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // padding: EdgeInsets.all(20)
                    ),
                    onPressed: () {
                      _showDialog(context);

                      // PlaceOrders();
                    },
                    child: Text("CONTINUE")),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
