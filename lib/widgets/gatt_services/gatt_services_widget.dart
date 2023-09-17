import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/gatt_service/gatt_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gatt_services_model.dart';
export 'gatt_services_model.dart';

class GattServicesWidget extends StatefulWidget {
  const GattServicesWidget({
    Key? key,
    required this.initialServices,
  }) : super(key: key);

  final List<GattServiceStruct>? initialServices;

  @override
  _GattServicesWidgetState createState() => _GattServicesWidgetState();
}

class _GattServicesWidgetState extends State<GattServicesWidget> {
  late GattServicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GattServicesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final viewedServices = _model.services.toList();
        return ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: viewedServices.length,
          itemBuilder: (context, viewedServicesIndex) {
            final viewedServicesItem = viewedServices[viewedServicesIndex];
            return Container(
              height: 200.0,
              child: GattServiceWidget(
                key: Key(
                    'Keyyx7_${viewedServicesIndex}_of_${viewedServices.length}'),
                service: viewedServicesItem,
              ),
            );
          },
        );
      },
    );
  }
}
