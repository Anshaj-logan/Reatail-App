import 'package:flutter/material.dart';
import 'package:test1/counter/delivered.dart';

class counter1 extends StatefulWidget {
  const counter1({Key? key}) : super(key: key);

  @override
  State<counter1> createState() => _counter1State();
}

class _counter1State extends State<counter1> {
  bool? isChecked = false;
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = false;
  bool? isChecked5 = false;
  bool? isChecked6 = false;
  bool? isChecked7 = false;
  bool? isChecked8 = false;
  bool? isChecked9 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.green,
            title: Text("Update"),
            leading: IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const delivered())),
                icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Update Delivery Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 1",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            isChecked = val;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 2",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked1,
                        onChanged: (val) {
                          setState(() {
                            isChecked1 = val;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 3,",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked2,
                        onChanged: (val) {
                          setState(() {
                            isChecked2 = val;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 4",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked3,
                        onChanged: (val) {
                          setState(() {
                            isChecked3 = val;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 5",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked4,
                        onChanged: (val) {
                          setState(() {
                            isChecked4 = val;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 6",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked5,
                        onChanged: (val) {
                          setState(() {
                            isChecked5 = val;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 7",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked6,
                        onChanged: (val) {
                          setState(() {
                            isChecked6 = val;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 8",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked7,
                        onChanged: (val) {
                          setState(() {
                            isChecked7 = val;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 9",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked8,
                        onChanged: (val) {
                          setState(() {
                            isChecked8 = val;
                          });
                        }),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("user 10",style: TextStyle(fontWeight: FontWeight.w900)),
                        activeColor: Colors.red,
                        value: isChecked9,
                        onChanged: (val) {
                          setState(() {
                            isChecked9 = val;
                          });
                        }),
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: ()  => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => delivered())),
                      child:
                      const Text('Done', style: TextStyle(color: Colors.white)),
                    ),
                   /* ElevatedButton(
                        onPressed: () {},
                        child: Text('',
                            style:
                            TextStyle(fontSize: 15, color: Colors.black))),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
