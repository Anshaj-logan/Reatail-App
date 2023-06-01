import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:test1/user/Retail2.dart';
import 'package:test1/user/Retail3.dart';
import 'package:test1/user/home.dart';

import 'package:flutter/services.dart';

class Retail1 extends StatelessWidget {
  const Retail1({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const BarcodeScannerDemo(),
    );
  }
}

class BarcodeScannerDemo extends StatefulWidget {
  const BarcodeScannerDemo({Key? key}) : super(key: key);
  @override
  _BarcodeScannerDemoState createState() => _BarcodeScannerDemoState();
}

class _BarcodeScannerDemoState extends State<BarcodeScannerDemo> {
  String? _scanBarcode;
  late String pd;
  late String product_id;
  String productName = "";
  String price = "";
  String id = "";
  var jsonMap;

  Uint8List? imageBytes;

  /// For Continuous scan
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> barcodeScan() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
    String jsonString = _scanBarcode!;
    jsonMap = jsonDecode(jsonString);
    print(jsonMap);
    productName = jsonMap['productname'];
    price = jsonMap['price'];
    String description = jsonMap['description'];
    String quantity = jsonMap['quantity'];
    id = jsonMap['_id'];
    // int version = jsonMap['_v'];
    print('********************');
    ByteData imageData =
        await rootBundle.load('server/node/public/images/${jsonMap['photo']}');
    print(imageData);
    imageBytes = imageData.buffer.asUint8List();

    print(imageBytes);
    print('********************');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Add Items'),
          leading: IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const home())),
              icon: Icon(Icons.arrow_back)),
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Retail2())),
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 6,
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Center(
                        child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Builder(builder: (BuildContext context) {
          return Container(
            alignment: Alignment.center,
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (imageBytes != null) Image.memory(imageBytes!),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Text('Scan result : ',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Product name : ${productName ?? "Unknown"}\n',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Price : ${price ?? "Unknown"}\n',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () => barcodeScan(),
                            child: const Text('Barcode Scan',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () async {
                          pd = productName;
                          product_id = id;
                          print('product id :${product_id}');
                          print('product name :${pd}');
                          // Navigator.push(context,
                          // MaterialPageRoute(builder: (context) => Retail3()));
                        },
                        child: const Text('Add to Cart',
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ]),
          );
        }));
  }
}
