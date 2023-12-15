import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_navbar_component/custom_navbar_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'my_ads_model.dart';
export 'my_ads_model.dart';

class MyAdsWidget extends StatefulWidget {
  const MyAdsWidget({super.key});

  @override
  _MyAdsWidgetState createState() => _MyAdsWidgetState();
}

class _MyAdsWidgetState extends State<MyAdsWidget>
    with TickerProviderStateMixin {
  late MyAdsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyAdsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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

    return Title(
        title: 'my_ads',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: const BoxDecoration(),
                            child: Opacity(
                              opacity: 0.5,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: const Alignment(0.0, 0),
                                      child: TabBar(
                                        isScrollable: true,
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                32.0, 0.0, 32.0, 0.0),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                        unselectedLabelStyle: const TextStyle(),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        indicatorWeight: 3.0,
                                        tabs: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  Icons.favorite_rounded,
                                                  color: _model
                                                              .tabBarCurrentIndex ==
                                                          0
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText),
                                                ),
                                              ),
                                              const Tab(
                                                text: 'Saved Ads',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.man,
                                                color:
                                                    _model.tabBarCurrentIndex ==
                                                            1
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                              ),
                                              const Tab(
                                                text: 'Own Ads',
                                              ),
                                            ],
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Builder(
                                                builder: (context) {
                                                  final shops =
                                                      (currentUserDocument
                                                                  ?.savedShops
                                                                  .toList() ??
                                                              [])
                                                          .toList();
                                                  return SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          shops.length,
                                                          (shopsIndex) {
                                                        final shopsItem =
                                                            shops[shopsIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: StreamBuilder<
                                                              ShopsRecord>(
                                                            stream: ShopsRecord
                                                                .getDocument(
                                                                    shopsItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final containerShopsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'Product_Page',
                                                                    queryParameters:
                                                                        {
                                                                      'shopDetails':
                                                                          serializeParam(
                                                                        containerShopsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'shopDetails':
                                                                          containerShopsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: const Color(
                                                                          0xFF828282),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.5,
                                                                        height:
                                                                            120.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              containerShopsRecord.images.first,
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.42,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(24.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 15.0, 0.0),
                                                                                child: Container(
                                                                                  width: 20.0,
                                                                                  height: 20.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent2,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      'R',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              constraints: const BoxConstraints(
                                                                                maxHeight: 80.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Text(
                                                                                      '₹ ${() {
                                                                                        if (containerShopsRecord.adCategory == 'Rent_Shop') {
                                                                                          return valueOrDefault<String>(
                                                                                            '${containerShopsRecord.monthlyRent.toString()} /month',
                                                                                            'Nan',
                                                                                          );
                                                                                        } else if (containerShopsRecord.adCategory == 'Sell_Shop') {
                                                                                          return containerShopsRecord.sellPrice.toString();
                                                                                        } else if (containerShopsRecord.adCategory == 'Sell_Inventory') {
                                                                                          return valueOrDefault<String>(
                                                                                            '${containerShopsRecord.inventoryPrice.toString()}/Inventory',
                                                                                            'Nan',
                                                                                          );
                                                                                        } else if (containerShopsRecord.adCategory == 'RS_SI') {
                                                                                          return '${containerShopsRecord.monthlyRent.toString()}/month + ${containerShopsRecord.adCategory}/inv';
                                                                                        } else {
                                                                                          return '10';
                                                                                        }
                                                                                      }()}'
                                                                                          .maybeHandleOverflow(
                                                                                        maxChars: 20,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                      maxLines: 1,
                                                                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            fontSize: 18.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            lineHeight: 1.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        containerShopsRecord.title.maybeHandleOverflow(
                                                                                          maxChars: 26,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Opacity(
                                                                                            opacity: 0.6,
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 4.0, 0.0),
                                                                                              child: FaIcon(
                                                                                                FontAwesomeIcons.mapMarkerAlt,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 12.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 2.0),
                                                                                            child: Text(
                                                                                              'Miyapur, Hyderabad',
                                                                                              textAlign: TextAlign.start,
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 11.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                      child: Container(
                                                                                        constraints: const BoxConstraints(
                                                                                          maxHeight: 56.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          boxShadow: const [
                                                                                            BoxShadow(
                                                                                              blurRadius: 20.0,
                                                                                              color: Color(0xC00E9F66),
                                                                                              offset: Offset(0.0, 5.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(1000.0),
                                                                                        ),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            boxShadow: const [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.5,
                                                                                                color: Color(0x4A0E9F66),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            borderRadius: BorderRadius.circular(1000.0),
                                                                                          ),
                                                                                          child: Container(
                                                                                            width: 50.0,
                                                                                            height: 22.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(13.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                '8.5 km',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      fontSize: 11.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
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
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Builder(
                                                builder: (context) {
                                                  final shops =
                                                      (currentUserDocument
                                                                  ?.adsPosted
                                                                  .toList() ??
                                                              [])
                                                          .toList();
                                                  return SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          shops.length,
                                                          (shopsIndex) {
                                                        final shopsItem =
                                                            shops[shopsIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: StreamBuilder<
                                                              ShopsRecord>(
                                                            stream: ShopsRecord
                                                                .getDocument(
                                                                    shopsItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final containerShopsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'Product_Page',
                                                                    queryParameters:
                                                                        {
                                                                      'shopDetails':
                                                                          serializeParam(
                                                                        containerShopsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'shopDetails':
                                                                          containerShopsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: const Color(
                                                                          0xFF828282),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.5,
                                                                        height:
                                                                            120.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              containerShopsRecord.images.first,
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.42,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(24.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 15.0, 0.0),
                                                                                child: Container(
                                                                                  width: 20.0,
                                                                                  height: 20.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent2,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      'R',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              constraints: const BoxConstraints(
                                                                                maxHeight: 80.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Text(
                                                                                      '₹ ${() {
                                                                                        if (containerShopsRecord.adCategory == 'Rent_Shop') {
                                                                                          return valueOrDefault<String>(
                                                                                            '${containerShopsRecord.monthlyRent.toString()} /month',
                                                                                            'Nan',
                                                                                          );
                                                                                        } else if (containerShopsRecord.adCategory == 'Sell_Shop') {
                                                                                          return containerShopsRecord.sellPrice.toString();
                                                                                        } else if (containerShopsRecord.adCategory == 'Sell_Inventory') {
                                                                                          return valueOrDefault<String>(
                                                                                            '${containerShopsRecord.inventoryPrice.toString()}/Inventory',
                                                                                            'Nan',
                                                                                          );
                                                                                        } else if (containerShopsRecord.adCategory == 'RS_SI') {
                                                                                          return '${containerShopsRecord.monthlyRent.toString()}/month + ${containerShopsRecord.adCategory}/inv';
                                                                                        } else {
                                                                                          return '10';
                                                                                        }
                                                                                      }()}'
                                                                                          .maybeHandleOverflow(
                                                                                        maxChars: 20,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                      maxLines: 1,
                                                                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            fontSize: 18.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            lineHeight: 1.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        containerShopsRecord.title.maybeHandleOverflow(
                                                                                          maxChars: 26,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Opacity(
                                                                                            opacity: 0.6,
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 4.0, 0.0),
                                                                                              child: FaIcon(
                                                                                                FontAwesomeIcons.mapMarkerAlt,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 12.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 2.0),
                                                                                            child: Text(
                                                                                              'Miyapur, Hyderabad',
                                                                                              textAlign: TextAlign.start,
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 11.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                      child: Container(
                                                                                        constraints: const BoxConstraints(
                                                                                          maxHeight: 56.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          boxShadow: const [
                                                                                            BoxShadow(
                                                                                              blurRadius: 20.0,
                                                                                              color: Color(0xC00E9F66),
                                                                                              offset: Offset(0.0, 5.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(1000.0),
                                                                                        ),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            boxShadow: const [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.5,
                                                                                                color: Color(0x4A0E9F66),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            borderRadius: BorderRadius.circular(1000.0),
                                                                                          ),
                                                                                          child: Container(
                                                                                            width: 50.0,
                                                                                            height: 22.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(13.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                '8.5 km',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      fontSize: 11.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
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
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
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
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.customNavbarComponentModel,
                          updateCallback: () => setState(() {}),
                          child: const CustomNavbarComponentWidget(
                            pageName: 'my ads',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
