import 'package:flutter/material.dart';
import 'package:qr_and_bar_code/views/layoutQrApp.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

main() {
  runApp(Qrbody());
}

class Qrbody extends StatelessWidget {
  const Qrbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: AppLayout(),
    );
  }
}
