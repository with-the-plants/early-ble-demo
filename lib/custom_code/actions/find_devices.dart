// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:developer' show log;

Future<void> findDevices() async {
  log("findDevices: constructing devices…");
  final UNKNOWN = "(unknown)"; // TBD. Localize?
  final Stream<List<ScanResult>> scanResults = FlutterBluePlus.scanResults;
  final state = FFAppState();
  scanResults.forEach((srList) {
    srList.forEach((ScanResult sr) {
      final id = sr.device.remoteId.toString();
      final name =
          (sr.device.localName.isEmpty) ? UNKNOWN : sr.device.localName;
      final index =
          state.foundDevices.indexWhere((BTDeviceStruct e) => (id == e.id));
      if (index >= 0) {
        // Updating an existing device
        state.updateFoundDevicesAtIndex(index, (BTDeviceStruct existing) {
          existing.name = name;
          existing.rssi = sr.rssi;
          log("findDevices: updating $existing");
          return existing;
        });
      } else {
        final BTDeviceStruct newDevice = BTDeviceStruct(
          name: name,
          id: id,
          rssi: sr.rssi,
        );
        log("findDevices: adding $newDevice");
        state.addToFoundDevices(newDevice);
      }
    });
  });

  final isScanning = FlutterBluePlus.isScanningNow;
  if (!isScanning) {
    log("findDevices: start a scan.");
    FlutterBluePlus.startScan();
  }
}
