import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'custom_navbar_component_model.dart';
export 'custom_navbar_component_model.dart';

class CustomNavbarComponentWidget extends StatefulWidget {
  const CustomNavbarComponentWidget({
    super.key,
    String? pageName,
  })  : pageName = pageName ?? 'home';

  final String pageName;

  @override
  _CustomNavbarComponentWidgetState createState() =>
      _CustomNavbarComponentWidgetState();
}

class _CustomNavbarComponentWidgetState
    extends State<CustomNavbarComponentWidget> {
  late CustomNavbarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomNavbarComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 120.0,
      decoration: const BoxDecoration(),
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 1.0),
        children: [
          Container(
            width: double.infinity,
            height: 80.0,
            decoration: const BoxDecoration(
              color: Color(0x09002F34),
            ),
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 0.0),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/nav-bg-dark.svg'
                        : 'assets/images/nav-bg-light.svg',
                    width: double.infinity,
                    height: 80.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('HomePageColumn');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Icon(
                              FFIcons.khome,
                              color: widget.pageName == 'home'
                                  ? FlutterFlowTheme.of(context).info
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: 57.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  widget.pageName == 'home'
                                      ? const Color(0xFF2F80ED)
                                      : Colors.transparent,
                                  const Color(0xFF2F80ED),
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.00, 0.00),
                                child: Text(
                                  'Home',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: valueOrDefault<Color>(
                                          widget.pageName == 'home'
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          Colors.white,
                                        ),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('all_users');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Icon(
                                FFIcons.kpinglun,
                                color: widget.pageName == 'chats'
                                    ? FlutterFlowTheme.of(context).info
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 22.0,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 57.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    widget.pageName == 'chats'
                                        ? const Color(0xFF2F80ED)
                                        : Colors.transparent,
                                    Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    'Chats',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: valueOrDefault<Color>(
                                            widget.pageName == 'chats'
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('my_ads');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Icon(
                                FFIcons.kheart,
                                color: widget.pageName == 'my ads'
                                    ? FlutterFlowTheme.of(context).info
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 57.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    widget.pageName == 'my ads'
                                        ? const Color(0xFF2F80ED)
                                        : Colors.transparent,
                                    Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    'My Ads',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: valueOrDefault<Color>(
                                            widget.pageName == 'my ads'
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('profile');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Icon(
                              FFIcons.kuser21,
                              color: widget.pageName == 'profile'
                                  ? FlutterFlowTheme.of(context).info
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: 57.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  widget.pageName == 'profile'
                                      ? const Color(0xFF2F80ED)
                                      : Colors.transparent,
                                  Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.00, 0.00),
                                child: Text(
                                  'Profile',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: valueOrDefault<Color>(
                                          widget.pageName == 'profile'
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
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
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.00, -0.80),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('sell_categories_1');
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 4.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(3.0, 2.0, 3.0, 3.0),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: Icon(
                        FFIcons.kplus,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
