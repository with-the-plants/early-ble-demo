import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/gatt_services/gatt_services_widget.dart';
import '/widgets/stranght_indicator/stranght_indicator_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_page_model.dart';
export 'device_page_model.dart';

class DevicePageWidget extends StatefulWidget {
  const DevicePageWidget({
    Key? key,
    required this.deviceName,
    required this.deviceId,
    required this.deviceRssi,
    bool? hasWriteCharacteristic,
  })  : this.hasWriteCharacteristic = hasWriteCharacteristic ?? false,
        super(key: key);

  final String? deviceName;
  final String? deviceId;
  final int? deviceRssi;
  final bool hasWriteCharacteristic;

  @override
  _DevicePageWidgetState createState() => _DevicePageWidgetState();
}

class _DevicePageWidgetState extends State<DevicePageWidget> {
  late DevicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevicePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.foundServices = await actions.connectDevice(
        widget.deviceId!,
      );
      setState(() {
        _model.services =
            _model.foundServices!.toList().cast<GattServiceStruct>();
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      widget.deviceName!,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.stranghtIndicatorModel,
                    updateCallback: () => setState(() {}),
                    child: StranghtIndicatorWidget(
                      rssi: widget.deviceRssi!,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Text(
                  widget.deviceId!,
                  style: FlutterFlowTheme.of(context).labelSmall,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  icon: Icon(
                    Icons.bluetooth_disabled_rounded,
                    color: FlutterFlowTheme.of(context).error,
                    size: 28.0,
                  ),
                  onPressed: () async {
                    await actions.disconnectDevice(
                      widget.deviceId!,
                    );
                  },
                ),
              ],
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: wrapWithModel(
                    model: _model.gattServicesModel,
                    updateCallback: () => setState(() {}),
                    child: GattServicesWidget(
                      initialServices: _model.services,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
