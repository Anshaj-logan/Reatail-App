import 'package:flutter/material.dart';
import 'package:test1/user/Retail1.dart';
import 'package:test1/user/Retail4.dart';

class Retail3 extends StatefulWidget {
  const Retail3({Key? key}) : super(key: key);

  @override
  State<Retail3> createState() => _Retail3State();
}

class _Retail3State extends State<Retail3> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }
  bool _isVisible= true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.red,
          title: const Text('Payment'),
          leading: IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Retail1())),
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Total Price',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "\$",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Payment Method',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            onPressed: () {
                              _isVisible=true;
                            },
                            child: Text('Credit',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white))

                        ),

                        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Retail4())),
                          child: const Text('Wallet',
                              style: TextStyle(fontSize: 15, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Cardholder Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Card Number',
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
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Expiry',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'CVV',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Retail4())),
                    child: const Text('Proceed to Confirm',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
