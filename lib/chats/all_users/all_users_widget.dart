import '/components/custom_navbar_component/custom_navbar_component_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_users_model.dart';
export 'all_users_model.dart';

class AllUsersWidget extends StatefulWidget {
  const AllUsersWidget({super.key});

  @override
  _AllUsersWidgetState createState() => _AllUsersWidgetState();
}

class _AllUsersWidgetState extends State<AllUsersWidget> {
  late AllUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllUsersModel());

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
        title: 'all_users',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                'All Chats',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 4.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * 0.87,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: StreamBuilder<List<ChatsRecord>>(
                      stream: queryChatsRecord(
                        queryBuilder: (chatsRecord) => chatsRecord
                            .where(
                              'users',
                              arrayContains: currentUserReference,
                            )
                            .orderBy('last_message_time', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ChatsRecord> containerChatsRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final allChats =
                                    containerChatsRecordList.toList();
                                if (allChats.isEmpty) {
                                  return Center(
                                    child: Image.asset(
                                      'assets/images/messagesMainEmpty@2x.png',
                                      width: 300.0,
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: allChats.length,
                                  itemBuilder: (context, allChatsIndex) {
                                    final allChatsItem =
                                        allChats[allChatsIndex];
                                    return StreamBuilder<FFChatInfo>(
                                      stream: FFChatManager.instance
                                          .getChatInfo(
                                              chatRecord: allChatsItem),
                                      builder: (context, snapshot) {
                                        final chatInfo = snapshot.data ??
                                            FFChatInfo(allChatsItem);
                                        return FFChatPreview(
                                          onTap: () => context.pushNamed(
                                            'main_chat',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                chatInfo.otherUsers.length == 1
                                                    ? chatInfo
                                                        .otherUsersList.first
                                                    : null,
                                                ParamType.Document,
                                              ),
                                              'chatRef': serializeParam(
                                                chatInfo.chatRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chatUser':
                                                  chatInfo.otherUsers.length ==
                                                          1
                                                      ? chatInfo
                                                          .otherUsersList.first
                                                      : null,
                                            },
                                          ),
                                          lastChatText:
                                              chatInfo.chatPreviewMessage(),
                                          lastChatTime:
                                              allChatsItem.lastMessageTime,
                                          seen: allChatsItem.lastMessageSeenBy.contains(currentUserReference),
                                          title: chatInfo.chatPreviewTitle(),
                                          userProfilePic:
                                              chatInfo.chatPreviewPic(),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          unreadColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                          dateTextStyle: GoogleFonts.getFont(
                                            'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                          ),
                                          previewTextStyle: GoogleFonts.getFont(
                                            'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 3.0, 8.0, 3.0),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.customNavbarComponentModel,
                      updateCallback: () => setState(() {}),
                      child: const CustomNavbarComponentWidget(
                        pageName: 'chats',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
