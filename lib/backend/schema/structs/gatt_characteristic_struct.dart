// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GattCharacteristicStruct extends BaseStruct {
  GattCharacteristicStruct({
    String? uuid,
    String? name,
  })  : _uuid = uuid,
        _name = name;

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

  static GattCharacteristicStruct fromMap(Map<String, dynamic> data) =>
      GattCharacteristicStruct(
        uuid: data['uuid'] as String?,
        name: data['name'] as String?,
      );

  static GattCharacteristicStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? GattCharacteristicStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'uuid': _uuid,
        'name': _name,
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
      }.withoutNulls;

  static GattCharacteristicStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GattCharacteristicStruct(
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
      );

  @override
  String toString() => 'GattCharacteristicStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GattCharacteristicStruct &&
        uuid == other.uuid &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([uuid, name]);
}

GattCharacteristicStruct createGattCharacteristicStruct({
  String? uuid,
  String? name,
}) =>
    GattCharacteristicStruct(
      uuid: uuid,
      name: name,
    );
