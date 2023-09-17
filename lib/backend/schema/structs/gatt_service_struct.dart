// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GattServiceStruct extends BaseStruct {
  GattServiceStruct({
    String? uuid,
    String? name,
    List<GattCharacteristicStruct>? characteristics,
  })  : _uuid = uuid,
        _name = name,
        _characteristics = characteristics;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;
  bool hasUuid() => _uuid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "characteristics" field.
  List<GattCharacteristicStruct>? _characteristics;
  List<GattCharacteristicStruct> get characteristics =>
      _characteristics ?? const [];
  set characteristics(List<GattCharacteristicStruct>? val) =>
      _characteristics = val;
  void updateCharacteristics(
          Function(List<GattCharacteristicStruct>) updateFn) =>
      updateFn(_characteristics ??= []);
  bool hasCharacteristics() => _characteristics != null;

  static GattServiceStruct fromMap(Map<String, dynamic> data) =>
      GattServiceStruct(
        uuid: data['uuid'] as String?,
        name: data['name'] as String?,
        characteristics: getStructList(
          data['characteristics'],
          GattCharacteristicStruct.fromMap,
        ),
      );

  static GattServiceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GattServiceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'uuid': _uuid,
        'name': _name,
        'characteristics': _characteristics?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'characteristics': serializeParam(
          _characteristics,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static GattServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      GattServiceStruct(
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        characteristics: deserializeStructParam<GattCharacteristicStruct>(
          data['characteristics'],
          ParamType.DataStruct,
          true,
          structBuilder: GattCharacteristicStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GattServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GattServiceStruct &&
        uuid == other.uuid &&
        name == other.name &&
        listEquality.equals(characteristics, other.characteristics);
  }

  @override
  int get hashCode => const ListEquality().hash([uuid, name, characteristics]);
}

GattServiceStruct createGattServiceStruct({
  String? uuid,
  String? name,
}) =>
    GattServiceStruct(
      uuid: uuid,
      name: name,
    );
