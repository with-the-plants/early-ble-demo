// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:developer' show log;

class GattCharacteristic extends StatefulWidget {
  const GattCharacteristic({
    Key? key,
    this.width,
    this.height,
    required this.deviceId,
    required this.serviceId,
    required this.characteristicId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String deviceId;
  final String serviceId;
  final String characteristicId;

  @override
  _GattCharacteristicState createState() => _GattCharacteristicState();
}

class GattCharacteristicModel extends FlutterFlowModel {
  late BluetoothDevice device;
  late BluetoothService? service;
  late BluetoothCharacteristic? characteristic;
  late Stream<List<int>>? dataStream;

  void initState(BuildContext context) {
    final GattCharacteristic gc = context.widget as GattCharacteristic;
    try {
      device = BluetoothDevice.fromId(gc.deviceId);
      log("device: $device");
      service = device.servicesList
          ?.firstWhere((s) => s.uuid.toString() == gc.serviceId);
      log("service: $service");
      characteristic = service?.characteristics
          ?.firstWhere((c) => (c.uuid.toString() == gc.characteristicId));
      log("characteristic: $characteristic");
      dataStream = characteristic?.lastValueStream;
      log("stream: $dataStream");
      characteristic?.read();
    } catch (e) {
      log("error: $e");
    }
  }

  void dispose() {}
}

class _GattCharacteristicState extends State<GattCharacteristic> {
  late GattCharacteristicModel _model;

  @override
  void setState(VoidCallback cb) {
    super.setState(cb);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GattCharacteristicModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
        stream: _model.dataStream,
        initialData: [],
        builder: (
          BuildContext context,
          AsyncSnapshot<List<int>> snapshot,
        ) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              log("snapshot: $snapshot");
              late String s;
              if (snapshot.hasError) {
                s = 'error';
              } else if (snapshot.data != null) {
                s = snapshot.data.toString();
                s += "\n";
                s += String.fromCharCodes(snapshot.data ?? []);
              } else {
                s = 'empty';
              }
              return Text(s);
            default:
              return Text('(default)');
          }
        });
  }
}
