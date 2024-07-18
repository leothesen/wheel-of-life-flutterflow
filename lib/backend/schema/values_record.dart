import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ValuesRecord extends FirestoreRecord {
  ValuesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _value = snapshotData['value'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('values');

  static Stream<ValuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ValuesRecord.fromSnapshot(s));

  static Future<ValuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ValuesRecord.fromSnapshot(s));

  static ValuesRecord fromSnapshot(DocumentSnapshot snapshot) => ValuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ValuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ValuesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ValuesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ValuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createValuesRecordData({
  DocumentReference? userId,
  String? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class ValuesRecordDocumentEquality implements Equality<ValuesRecord> {
  const ValuesRecordDocumentEquality();

  @override
  bool equals(ValuesRecord? e1, ValuesRecord? e2) {
    return e1?.userId == e2?.userId && e1?.value == e2?.value;
  }

  @override
  int hash(ValuesRecord? e) => const ListEquality().hash([e?.userId, e?.value]);

  @override
  bool isValidKey(Object? o) => o is ValuesRecord;
}
