import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'copy_model.dart';
export 'copy_model.dart';

class CopyWidget extends StatefulWidget {
  const CopyWidget({super.key});

  @override
  _CopyWidgetState createState() => _CopyWidgetState();
}

class _CopyWidgetState extends State<CopyWidget> {
  late CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CopyModel());
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

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Upload Images',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.00, -1.00),
              child: FlutterFlowPlacePicker(
                iOSGoogleMapsApiKey: 'AIzaSyDD4ZiTfl_riyXZFUUXT7RUDYMPfv4Vp90',
                androidGoogleMapsApiKey:
                    'AIzaSyDD4ZiTfl_riyXZFUUXT7RUDYMPfv4Vp90',
                webGoogleMapsApiKey: 'AIzaSyDD4ZiTfl_riyXZFUUXT7RUDYMPfv4Vp90',
                onSelect: (place) async {
                  setState(() => _model.placePickerValue = place);
                },
                defaultText: 'Select Location',
                icon: const Icon(
                  Icons.place,
                  color: Colors.black,
                  size: 16.0,
                ),
                buttonOptions: FFButtonOptions(
                  width: 200.0,
                  height: 40.0,
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.latLng.toString(),
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.name,
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.address,
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.city,
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.state,
                    '1',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.country,
                    '1',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.zipCode,
                    '1',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Expanded(
              child: FlutterFlowGoogleMap(
                controller: _model.googleMapsController,
                onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                initialLocation: _model.googleMapsCenter ??=
                    const LatLng(13.106061, -59.613158),
                markerColor: GoogleMarkerColor.violet,
                mapType: MapType.normal,
                style: GoogleMapStyle.standard,
                initialZoom: 14.0,
                allowInteraction: true,
                allowZoom: true,
                showZoomControls: true,
                showLocation: true,
                showCompass: false,
                showMapToolbar: false,
                showTraffic: false,
                centerMapOnMarkerTap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
