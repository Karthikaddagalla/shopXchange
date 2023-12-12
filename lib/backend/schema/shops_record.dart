import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopsRecord extends FirestoreRecord {
  ShopsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "sell_price" field.
  int? _sellPrice;
  int get sellPrice => _sellPrice ?? 0;
  bool hasSellPrice() => _sellPrice != null;

  // "monthly_rent" field.
  int? _monthlyRent;
  int get monthlyRent => _monthlyRent ?? 0;
  bool hasMonthlyRent() => _monthlyRent != null;

  // "size" field.
  double? _size;
  double get size => _size ?? 0.0;
  bool hasSize() => _size != null;

  // "saves" field.
  int? _saves;
  int get saves => _saves ?? 0;
  bool hasSaves() => _saves != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "isPreviousShopExists" field.
  String? _isPreviousShopExists;
  String get isPreviousShopExists => _isPreviousShopExists ?? '';
  bool hasIsPreviousShopExists() => _isPreviousShopExists != null;

  // "previousShopType" field.
  String? _previousShopType;
  String get previousShopType => _previousShopType ?? '';
  bool hasPreviousShopType() => _previousShopType != null;

  // "inventoryPrice" field.
  int? _inventoryPrice;
  int get inventoryPrice => _inventoryPrice ?? 0;
  bool hasInventoryPrice() => _inventoryPrice != null;

  // "ad_category" field.
  String? _adCategory;
  String get adCategory => _adCategory ?? '';
  bool hasAdCategory() => _adCategory != null;

  // "listed_user" field.
  DocumentReference? _listedUser;
  DocumentReference? get listedUser => _listedUser;
  bool hasListedUser() => _listedUser != null;

  // "mainShopImageindex" field.
  int? _mainShopImageindex;
  int get mainShopImageindex => _mainShopImageindex ?? 0;
  bool hasMainShopImageindex() => _mainShopImageindex != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _title = snapshotData['Title'] as String?;
    _images = getDataList(snapshotData['Images']);
    _sellPrice = castToType<int>(snapshotData['sell_price']);
    _monthlyRent = castToType<int>(snapshotData['monthly_rent']);
    _size = castToType<double>(snapshotData['size']);
    _saves = castToType<int>(snapshotData['saves']);
    _views = castToType<int>(snapshotData['views']);
    _description = snapshotData['description'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _isPreviousShopExists = snapshotData['isPreviousShopExists'] as String?;
    _previousShopType = snapshotData['previousShopType'] as String?;
    _inventoryPrice = castToType<int>(snapshotData['inventoryPrice']);
    _adCategory = snapshotData['ad_category'] as String?;
    _listedUser = snapshotData['listed_user'] as DocumentReference?;
    _mainShopImageindex = castToType<int>(snapshotData['mainShopImageindex']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shops');

  static Stream<ShopsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShopsRecord.fromSnapshot(s));

  static Future<ShopsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShopsRecord.fromSnapshot(s));

  static ShopsRecord fromSnapshot(DocumentSnapshot snapshot) => ShopsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShopsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShopsRecord._(reference, mapFromFirestore(data));

  static ShopsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ShopsRecord.getDocumentFromData(
        {
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'modified_at': convertAlgoliaParam(
            snapshot.data['modified_at'],
            ParamType.DateTime,
            false,
          ),
          'Title': snapshot.data['Title'],
          'Images': safeGet(
            () => snapshot.data['Images'].toList(),
          ),
          'sell_price': convertAlgoliaParam(
            snapshot.data['sell_price'],
            ParamType.int,
            false,
          ),
          'monthly_rent': convertAlgoliaParam(
            snapshot.data['monthly_rent'],
            ParamType.int,
            false,
          ),
          'size': convertAlgoliaParam(
            snapshot.data['size'],
            ParamType.double,
            false,
          ),
          'saves': convertAlgoliaParam(
            snapshot.data['saves'],
            ParamType.int,
            false,
          ),
          'views': convertAlgoliaParam(
            snapshot.data['views'],
            ParamType.int,
            false,
          ),
          'description': snapshot.data['description'],
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'isPreviousShopExists': snapshot.data['isPreviousShopExists'],
          'previousShopType': snapshot.data['previousShopType'],
          'inventoryPrice': convertAlgoliaParam(
            snapshot.data['inventoryPrice'],
            ParamType.int,
            false,
          ),
          'ad_category': snapshot.data['ad_category'],
          'listed_user': convertAlgoliaParam(
            snapshot.data['listed_user'],
            ParamType.DocumentReference,
            false,
          ),
          'mainShopImageindex': convertAlgoliaParam(
            snapshot.data['mainShopImageindex'],
            ParamType.int,
            false,
          ),
        },
        ShopsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ShopsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'shops',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ShopsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShopsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShopsRecordData({
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? title,
  int? sellPrice,
  int? monthlyRent,
  double? size,
  int? saves,
  int? views,
  String? description,
  LatLng? location,
  String? isPreviousShopExists,
  String? previousShopType,
  int? inventoryPrice,
  String? adCategory,
  DocumentReference? listedUser,
  int? mainShopImageindex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'Title': title,
      'sell_price': sellPrice,
      'monthly_rent': monthlyRent,
      'size': size,
      'saves': saves,
      'views': views,
      'description': description,
      'location': location,
      'isPreviousShopExists': isPreviousShopExists,
      'previousShopType': previousShopType,
      'inventoryPrice': inventoryPrice,
      'ad_category': adCategory,
      'listed_user': listedUser,
      'mainShopImageindex': mainShopImageindex,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShopsRecordDocumentEquality implements Equality<ShopsRecord> {
  const ShopsRecordDocumentEquality();

  @override
  bool equals(ShopsRecord? e1, ShopsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.sellPrice == e2?.sellPrice &&
        e1?.monthlyRent == e2?.monthlyRent &&
        e1?.size == e2?.size &&
        e1?.saves == e2?.saves &&
        e1?.views == e2?.views &&
        e1?.description == e2?.description &&
        e1?.location == e2?.location &&
        e1?.isPreviousShopExists == e2?.isPreviousShopExists &&
        e1?.previousShopType == e2?.previousShopType &&
        e1?.inventoryPrice == e2?.inventoryPrice &&
        e1?.adCategory == e2?.adCategory &&
        e1?.listedUser == e2?.listedUser &&
        e1?.mainShopImageindex == e2?.mainShopImageindex;
  }

  @override
  int hash(ShopsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.modifiedAt,
        e?.title,
        e?.images,
        e?.sellPrice,
        e?.monthlyRent,
        e?.size,
        e?.saves,
        e?.views,
        e?.description,
        e?.location,
        e?.isPreviousShopExists,
        e?.previousShopType,
        e?.inventoryPrice,
        e?.adCategory,
        e?.listedUser,
        e?.mainShopImageindex
      ]);

  @override
  bool isValidKey(Object? o) => o is ShopsRecord;
}
