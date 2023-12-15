import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProfileImagesRecord extends FirestoreRecord {
  ProfileImagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pics" field.
  List<String>? _pics;
  List<String> get pics => _pics ?? const [];
  bool hasPics() => _pics != null;

  void _initializeFields() {
    _pics = getDataList(snapshotData['pics']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profile_images');

  static Stream<ProfileImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileImagesRecord.fromSnapshot(s));

  static Future<ProfileImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileImagesRecord.fromSnapshot(s));

  static ProfileImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileImagesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ProfileImagesRecordDocumentEquality
    implements Equality<ProfileImagesRecord> {
  const ProfileImagesRecordDocumentEquality();

  @override
  bool equals(ProfileImagesRecord? e1, ProfileImagesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.pics, e2?.pics);
  }

  @override
  int hash(ProfileImagesRecord? e) => const ListEquality().hash([e?.pics]);

  @override
  bool isValidKey(Object? o) => o is ProfileImagesRecord;
}
