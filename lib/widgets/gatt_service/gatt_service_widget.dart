import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gatt_service_model.dart';
export 'gatt_service_model.dart';

class GattServiceWidget extends StatefulWidget {
  const GattServiceWidget({
    Key? key,
    required this.service,
  }) : super(key: key);

  final GattServiceStruct? service;

  @override
  _GattServiceWidgetState createState() => _GattServiceWidgetState();
}

class _GattServiceWidgetState extends State<GattServiceWidget> {
  late GattServiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GattServiceModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.service?.name,
                  '(unknown)',
                ),
                style: FlutterFlowTheme.of(context).labelLarge,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.service?.uuid,
                  'UUID',
                ),
                style: FlutterFlowTheme.of(context).labelSmall,
              ),
            ],
          ),
          Divider(
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).secondary,
          ),
          Builder(
            builder: (context) {
              final characteristics =
                  widget.service?.characteristics?.toList() ?? [];
              return ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: characteristics.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.0),
                itemBuilder: (context, characteristicsIndex) {
                  final characteristicsItem =
                      characteristics[characteristicsIndex];
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              characteristicsItem.name,
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                            Text(
                              characteristicsItem.uuid,
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
