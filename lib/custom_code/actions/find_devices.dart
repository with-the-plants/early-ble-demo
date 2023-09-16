// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:developer';

Future<List<BTDeviceStruct>> findDevices() async {
  final isScanning = FlutterBluePlus.isScanningNow;
  if (!isScanning) {
    FlutterBluePlus.startScan();
    await Future.delayed(Duration(milliseconds: 1000));
  }

  Completer<List<BTDeviceStruct>> completer =
      new Completer<List<BTDeviceStruct>>();
  List<BTDeviceStruct> devices = [];

  log("findDevices: constructing devices…");
  final Stream<List<ScanResult>> scanResults = FlutterBluePlus.scanResults;
  scanResults.map((srList) {
    srList.forEach((ScanResult sr) {
      devices.add(BTDeviceStruct(
        name: sr.device.localName,
        id: sr.device.remoteId.toString(),
        rssi: sr.rssi,
      ));
    });
    log("findDevices: returning $devices");
    completer.complete(devices);
  });

  return completer.future;
}
