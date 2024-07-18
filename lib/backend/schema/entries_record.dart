import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EntriesRecord extends FirestoreRecord {
  EntriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "value_id" field.
  DocumentReference? _valueId;
  DocumentReference? get valueId => _valueId;
  bool hasValueId() => _valueId != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _valueId = snapshotData['value_id'] as DocumentReference?;
    _rating = castToType<int>(snapshotData['rating']);
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('entries');

  static Stream<EntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EntriesRecord.fromSnapshot(s));

  static Future<EntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EntriesRecord.fromSnapshot(s));

  static EntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEntriesRecordData({
  DocumentReference? valueId,
  int? rating,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value_id': valueId,
      'rating': rating,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class EntriesRecordDocumentEquality implements Equality<EntriesRecord> {
  const EntriesRecordDocumentEquality();

  @override
  bool equals(EntriesRecord? e1, EntriesRecord? e2) {
    return e1?.valueId == e2?.valueId &&
        e1?.rating == e2?.rating &&
        e1?.date == e2?.date;
  }

  @override
  int hash(EntriesRecord? e) =>
      const ListEquality().hash([e?.valueId, e?.rating, e?.date]);

  @override
  bool isValidKey(Object? o) => o is EntriesRecord;
}
