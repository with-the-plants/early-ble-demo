// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:developer';

Future<void> findDevices() async {
  final isScanning = FlutterBluePlus.isScanningNow;
  if (!isScanning) {
    FlutterBluePlus.startScan();
    await Future.delayed(Duration(milliseconds: 1000));
  }

  log("findDevices: constructing devices…");
  final Stream<List<ScanResult>> scanResults = FlutterBluePlus.scanResults;
  scanResults.map((srList) {
    srList.forEach((ScanResult sr) {
      log("findDevices: scanResult: $sr");
      FFAppState().addToFoundDevices(BTDeviceStruct(
        name: sr.device.localName,
        id: sr.device.remoteId.toString(),
        rssi: sr.rssi,
      ));
    });
  });
  //
}
