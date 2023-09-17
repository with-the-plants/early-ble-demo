// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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
  void initState(BuildContext context) {}
  void dispose() {}

  final Stream<int> stream // TBD
      = (() async* {
    await Future<void>.delayed(Duration(seconds: 2));

    for (int i = 1; i <= 5; i++) {
      await Future<void>.delayed(Duration(seconds: 1));
      yield i;
    }
  })();
}

class _GattCharacteristicState extends State<GattCharacteristic> {
  late GattCharacteristicModel _model;

  @override
  void setState() {
    super.setState();
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
    return StreamBuilder<int>(
        stream: _model.stream,
        initialData: 0,
        builder: (
          BuildContext context,
          AsyncSnapshot<int> snapshot,
        ) {
          switch (snapshot.connectionState) {
            default:
              return Text('default');
          }
        });
  }
}
