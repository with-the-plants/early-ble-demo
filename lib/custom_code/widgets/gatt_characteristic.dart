// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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
  late BluetoothService service;
  late BluetoothCharacteristic characteristic;
  late Stream<List<int>> dataStream;

  void initState(BuildContext context) {
    final GattCharacteristic gc = GattCharacteristic.of(context);
    device = BluetoothDevice.fromId(c.deviceId);
    service = device.servicesList.firstWhere((s) => (s.uuid == gc.serviceId));
    characteristic = service.characteristics
        .firstWhere((c) => (c.uuid == gc.characteristicId));
    dataStream = characteristic.lastValueStream;
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
        initialData: 0,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<int>> snapshot,
        ) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              return Text(snapshot.hasError
                  ? 'error'
                  : snapshot.hasData
                      ? snapshot.data.first.toString()
                      : '(empty)');
            default:
              return Text('(default)');
          }
        });
  }
}
