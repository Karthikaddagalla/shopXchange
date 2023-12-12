import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TestMainChatsRecord extends FirestoreRecord {
  TestMainChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "message_seen" field.
  bool? _messageSeen;
  bool get messageSeen => _messageSeen ?? false;
  bool hasMessageSeen() => _messageSeen != null;

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "user_b" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _messageSeen = snapshotData['message_seen'] as bool?;
    _userA = snapshotData['user_a'] as DocumentReference?;
    _userB = snapshotData['user_b'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test_main_Chats');

  static Stream<TestMainChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestMainChatsRecord.fromSnapshot(s));

  static Future<TestMainChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestMainChatsRecord.fromSnapshot(s));

  static TestMainChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestMainChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestMainChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestMainChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestMainChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestMainChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestMainChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  String? image,
  bool? messageSeen,
  DocumentReference? userA,
  DocumentReference? userB,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'image': image,
      'message_seen': messageSeen,
      'user_a': userA,
      'user_b': userB,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestMainChatsRecordDocumentEquality
    implements Equality<TestMainChatsRecord> {
  const TestMainChatsRecordDocumentEquality();

  @override
  bool equals(TestMainChatsRecord? e1, TestMainChatsRecord? e2) {
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.image == e2?.image &&
        e1?.messageSeen == e2?.messageSeen &&
        e1?.userA == e2?.userA &&
        e1?.userB == e2?.userB &&
        e1?.user == e2?.user;
  }

  @override
  int hash(TestMainChatsRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.lastMessageTime,
        e?.image,
        e?.messageSeen,
        e?.userA,
        e?.userB,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is TestMainChatsRecord;
}
