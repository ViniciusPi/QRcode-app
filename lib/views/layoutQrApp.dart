import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  late String _counter, _value = "O código aparecerá aqui";
  bool isFlashOn = true;
  Future _readQrCode() async {
    _counter = await FlutterBarcodeScanner.scanBarcode(
        "#004297", "cancel", isFlashOn, ScanMode.QR);
    setState(() {
      _value = _counter;
      if (_value == "-1") {
        _value = "Tente novamente";
      }
    });
  }

  Future _readBarCode() async {
    _counter = await FlutterBarcodeScanner.scanBarcode(
        "#004297", "cancel", isFlashOn, ScanMode.BARCODE);
    setState(() {
      _value = _counter;
      if (_value == "-1") {
        _value = "Tente novamente";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bar code Scan",
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff212121),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 70, right: 25),
              child: Text(
                _value,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // QR CODE READER
                IconButton(
                  tooltip: "QR code",
                  onPressed: () {
                    _readQrCode();
                  },
                  icon: Icon(
                    Icons.qr_code_2_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 50,
                ),
                SizedBox(
                  width: 60,
                ),
                // BAR CODE READER
                IconButton(
                  tooltip: "Bar code",
                  onPressed: () {
                    _readBarCode();
                  },
                  icon: Transform.rotate(
                    angle: 90 * pi / 180,
                    child: Icon(
                      Icons.document_scanner_outlined,
                      color: Colors.white,
                    ),
                  ),
                  iconSize: 50,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay_outlined),
        onPressed: () {
          setState(() {
            _value = "Código resetado";
          });
        },
      ),
    );
  }
}
