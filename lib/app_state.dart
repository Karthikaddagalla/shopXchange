import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _uploadedImagesAppState = [];
  List<String> get uploadedImagesAppState => _uploadedImagesAppState;
  set uploadedImagesAppState(List<String> value) {
    _uploadedImagesAppState = value;
  }

  void addToUploadedImagesAppState(String value) {
    _uploadedImagesAppState.add(value);
  }

  void removeFromUploadedImagesAppState(String value) {
    _uploadedImagesAppState.remove(value);
  }

  void removeAtIndexFromUploadedImagesAppState(int index) {
    _uploadedImagesAppState.removeAt(index);
  }

  void updateUploadedImagesAppStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _uploadedImagesAppState[index] = updateFn(_uploadedImagesAppState[index]);
  }

  void insertAtIndexInUploadedImagesAppState(int index, String value) {
    _uploadedImagesAppState.insert(index, value);
  }

  List<DocumentReference> _savedShops = [];
  List<DocumentReference> get savedShops => _savedShops;
  set savedShops(List<DocumentReference> value) {
    _savedShops = value;
  }

  void addToSavedShops(DocumentReference value) {
    _savedShops.add(value);
  }

  void removeFromSavedShops(DocumentReference value) {
    _savedShops.remove(value);
  }

  void removeAtIndexFromSavedShops(int index) {
    _savedShops.removeAt(index);
  }

  void updateSavedShopsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _savedShops[index] = updateFn(_savedShops[index]);
  }

  void insertAtIndexInSavedShops(int index, DocumentReference value) {
    _savedShops.insert(index, value);
  }

  int _mainPhotoState = 0;
  int get mainPhotoState => _mainPhotoState;
  set mainPhotoState(int value) {
    _mainPhotoState = value;
  }

  final _shopsDocumentHomePageManager =
      FutureRequestManager<List<ShopsRecord>>();
  Future<List<ShopsRecord>> shopsDocumentHomePage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ShopsRecord>> Function() requestFn,
  }) =>
      _shopsDocumentHomePageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearShopsDocumentHomePageCache() =>
      _shopsDocumentHomePageManager.clear();
  void clearShopsDocumentHomePageCacheKey(String? uniqueKey) =>
      _shopsDocumentHomePageManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
