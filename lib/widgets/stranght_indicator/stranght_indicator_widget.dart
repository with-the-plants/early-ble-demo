import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stranght_indicator_model.dart';
export 'stranght_indicator_model.dart';

class StranghtIndicatorWidget extends StatefulWidget {
  const StranghtIndicatorWidget({
    Key? key,
    int? rssi,
    Color? color,
  })  : this.rssi = rssi ?? 0,
        this.color = color ?? const Color(0xFF1100FF),
        super(key: key);

  final int rssi;
  final Color color;

  @override
  _StranghtIndicatorWidgetState createState() =>
      _StranghtIndicatorWidgetState();
}

class _StranghtIndicatorWidgetState extends State<StranghtIndicatorWidget> {
  late StranghtIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StranghtIndicatorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
              child: Container(
                width: 4.0,
                height: 7.0,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
              child: Container(
                width: 4.0,
                height: 11.0,
                decoration: BoxDecoration(
                  color: widget.rssi >= -90
                      ? widget.color
                      : FlutterFlowTheme.of(context).accent4,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
              child: Container(
                width: 4.0,
                height: 14.0,
                decoration: BoxDecoration(
                  color: widget.rssi >= -67
                      ? widget.color
                      : FlutterFlowTheme.of(context).accent4,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
              child: Container(
                width: 4.0,
                height: 17.0,
                decoration: BoxDecoration(
                  color: widget.rssi >= -55
                      ? widget.color
                      : FlutterFlowTheme.of(context).accent4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
