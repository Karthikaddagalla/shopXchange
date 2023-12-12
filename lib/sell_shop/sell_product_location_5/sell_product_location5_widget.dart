import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'sell_product_location5_model.dart';
export 'sell_product_location5_model.dart';

class SellProductLocation5Widget extends StatefulWidget {
  const SellProductLocation5Widget({
    super.key,
    required this.adName,
    required this.adCategory,
    required this.isPreviousShopExists,
    required this.typeOfPreviousShop,
    required this.shopSize,
    required this.description,
    required this.selectedImages,
    this.priceOfProperty,
    this.rentPerMonth,
    this.inventoryCost,
  });

  final String? adName;
  final String? adCategory;
  final String? isPreviousShopExists;
  final String? typeOfPreviousShop;
  final int? shopSize;
  final String? description;
  final List<FFUploadedFile>? selectedImages;
  final int? priceOfProperty;
  final int? rentPerMonth;
  final int? inventoryCost;

  @override
  _SellProductLocation5WidgetState createState() =>
      _SellProductLocation5WidgetState();
}

class _SellProductLocation5WidgetState
    extends State<SellProductLocation5Widget> {
  late SellProductLocation5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SellProductLocation5Model());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Your Location Please',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 12.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'sell_shop_details_2',
                                queryParameters: {
                                  'adCategory': serializeParam(
                                    'Rent Your Shop',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x34090F13),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        'Enter the price:',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.currency_rupee_rounded,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLength: 10,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.05),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final firestoreBatch =
                                    FirebaseFirestore.instance.batch();
                                try {
                                  {
                                    setState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var selectedMedia = <SelectedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles =
                                          widget.selectedImages!;
                                      selectedMedia =
                                          selectedFilesFromUploadedFiles(
                                        selectedUploadedFiles,
                                        isMultiData: true,
                                      );
                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFiles =
                                            selectedUploadedFiles;
                                        _model.uploadedFileUrls = downloadUrls;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  context.pushNamed('ad_review_success_6');

                                  var shopsRecordReference =
                                      ShopsRecord.collection.doc();
                                  firestoreBatch.set(shopsRecordReference, {
                                    ...createShopsRecordData(
                                      createdAt: getCurrentTimestamp,
                                      modifiedAt: getCurrentTimestamp,
                                      title: widget.adName,
                                      sellPrice: widget.priceOfProperty,
                                      monthlyRent: widget.rentPerMonth,
                                      size: widget.shopSize?.toDouble(),
                                      saves: 0,
                                      views: 0,
                                      description: widget.description,
                                      listedUser: currentUserReference,
                                      isPreviousShopExists:
                                          widget.isPreviousShopExists,
                                      previousShopType:
                                          widget.typeOfPreviousShop,
                                      inventoryPrice: widget.inventoryCost,
                                      adCategory: () {
                                        if (widget.adCategory ==
                                            'Rent Your Shop') {
                                          return 'Rent_Shop';
                                        } else if (widget.adCategory ==
                                            'Sell a Shop') {
                                          return 'Sell_Shop';
                                        } else if (widget.adCategory ==
                                            'Rent Shop + Sell Inventory') {
                                          return 'RS_SI';
                                        } else if (widget.adCategory ==
                                            'Sell Inventory') {
                                          return 'Sell_Inventory';
                                        } else {
                                          return 'Nan';
                                        }
                                      }(),
                                      mainShopImageindex:
                                          FFAppState().mainPhotoState,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'Images': _model.uploadedFileUrls,
                                      },
                                    ),
                                  });
                                  _model.shopActionReference =
                                      ShopsRecord.getDocumentFromData({
                                    ...createShopsRecordData(
                                      createdAt: getCurrentTimestamp,
                                      modifiedAt: getCurrentTimestamp,
                                      title: widget.adName,
                                      sellPrice: widget.priceOfProperty,
                                      monthlyRent: widget.rentPerMonth,
                                      size: widget.shopSize?.toDouble(),
                                      saves: 0,
                                      views: 0,
                                      description: widget.description,
                                      listedUser: currentUserReference,
                                      isPreviousShopExists:
                                          widget.isPreviousShopExists,
                                      previousShopType:
                                          widget.typeOfPreviousShop,
                                      inventoryPrice: widget.inventoryCost,
                                      adCategory: () {
                                        if (widget.adCategory ==
                                            'Rent Your Shop') {
                                          return 'Rent_Shop';
                                        } else if (widget.adCategory ==
                                            'Sell a Shop') {
                                          return 'Sell_Shop';
                                        } else if (widget.adCategory ==
                                            'Rent Shop + Sell Inventory') {
                                          return 'RS_SI';
                                        } else if (widget.adCategory ==
                                            'Sell Inventory') {
                                          return 'Sell_Inventory';
                                        } else {
                                          return 'Nan';
                                        }
                                      }(),
                                      mainShopImageindex:
                                          FFAppState().mainPhotoState,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'Images': _model.uploadedFileUrls,
                                      },
                                    ),
                                  }, shopsRecordReference);

                                  firestoreBatch.update(currentUserReference!, {
                                    ...mapToFirestore(
                                      {
                                        'ads_posted': FieldValue.arrayUnion([
                                          _model.shopActionReference?.reference
                                        ]),
                                      },
                                    ),
                                  });
                                } finally {
                                  await firestoreBatch.commit();
                                }

                                setState(() {});
                              },
                              text: 'Post Your Ad',
                              options: FFButtonOptions(
                                width: 270.0,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
