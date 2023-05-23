import 'package:flutter/material.dart';
import 'package:test1/godown/gselectuser.dart';

class guser extends StatefulWidget {
  const guser({Key? key}) : super(key: key);

  @override
  State<guser> createState() => _guserState();
}

class _guserState extends State<guser> {
  bool? isChecked = false;
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.teal,
          title: const Text('User 1'),
          leading: IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const gselectuser())),
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
                      'Select User',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      onPressed: () {
                      },
                      child: Text('Selected',
                          style: TextStyle(
                              fontSize: 15, color: Colors.white))

                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Orders',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Item 1",style: TextStyle(fontWeight: FontWeight.w900)),
                            activeColor: Colors.red,
                            value: isChecked,
                            onChanged: (val) {
                              setState(() {
                                isChecked = val;
                              });
                            }),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Item 2",style: TextStyle(fontWeight: FontWeight.w900)),
                            activeColor: Colors.red,
                            value: isChecked1,
                            onChanged: (val) {
                              setState(() {
                                isChecked1 = val;
                              });
                            }),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Item 3,",style: TextStyle(fontWeight: FontWeight.w900)),
                            activeColor: Colors.red,
                            value: isChecked2,
                            onChanged: (val) {
                              setState(() {
                                isChecked2 = val;
                              });
                            }),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Item 4",style: TextStyle(fontWeight: FontWeight.w900)),
                            activeColor: Colors.red,
                            value: isChecked3,
                            onChanged: (val) {
                              setState(() {
                                isChecked3 = val;
                              });
                            }),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Item 5",style: TextStyle(fontWeight: FontWeight.w900)),
                            activeColor: Colors.red,
                            value: isChecked4,
                            onChanged: (val) {
                              setState(() {
                                isChecked4 = val;
                              });
                            }),

                        /* ElevatedButton(
                        onPressed: () {},
                        child: Text('',
                            style:
                            TextStyle(fontSize: 15, color: Colors.black))),*/
                      ],
                    ),
                  ),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      onPressed: () {},
                      child: Text('Done',
                          style: TextStyle(
                              fontSize: 15, color: Colors.white))
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
