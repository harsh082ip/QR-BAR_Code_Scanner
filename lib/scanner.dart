import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  Future<void> barcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'CANCEL', true, ScanMode.BARCODE);
  }

  Future<void> qrcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'CANCEL', true, ScanMode.QR);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  barcode();
                });
              },
              child: Text(
                'Bar-code Scanner',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                qrcode();
              },
              child: Text('QR-code Scanner', style: TextStyle(fontSize: 25.0)),
            ),
            Text('result', style: TextStyle(fontSize: 25.0)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
