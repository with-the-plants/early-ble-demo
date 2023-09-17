// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GattCharacteristicStruct extends BaseStruct {
  GattCharacteristicStruct({
    String? uuid,
    String? name,
    DocumentReference? foo,
  })  : _uuid = uuid,
        _name = name,
        _foo = foo;

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

  // "foo" field.
  DocumentReference? _foo;
  DocumentReference? get foo => _foo;
  set foo(DocumentReference? val) => _foo = val;
  bool hasFoo() => _foo != null;

  static GattCharacteristicStruct fromMap(Map<String, dynamic> data) =>
      GattCharacteristicStruct(
        uuid: data['uuid'] as String?,
        name: data['name'] as String?,
        foo: data['foo'] as DocumentReference?,
      );

  static GattCharacteristicStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? GattCharacteristicStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'uuid': _uuid,
        'name': _name,
        'foo': _foo,
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
        'foo': serializeParam(
          _foo,
          ParamType.DocumentReference,
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
        foo: deserializeParam(
          data['foo'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: [''],
        ),
      );

  @override
  String toString() => 'GattCharacteristicStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GattCharacteristicStruct &&
        uuid == other.uuid &&
        name == other.name &&
        foo == other.foo;
  }

  @override
  int get hashCode => const ListEquality().hash([uuid, name, foo]);
}

GattCharacteristicStruct createGattCharacteristicStruct({
  String? uuid,
  String? name,
  DocumentReference? foo,
}) =>
    GattCharacteristicStruct(
      uuid: uuid,
      name: name,
      foo: foo,
    );
