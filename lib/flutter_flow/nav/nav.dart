import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const HomePageColumnWidget()
          : const AppStartScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const HomePageColumnWidget()
              : const AppStartScreenWidget(),
        ),
        FFRoute(
          name: 'App_start_Screen',
          path: '/appStartScreen',
          builder: (context, params) => const AppStartScreenWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'auth_3_Create',
          path: '/auth3Create',
          builder: (context, params) => const Auth3CreateWidget(),
        ),
        FFRoute(
          name: 'auth_3_Login',
          path: '/auth3Login',
          builder: (context, params) => const Auth3LoginWidget(),
        ),
        FFRoute(
          name: 'auth_3_phone',
          path: '/auth3Phone',
          builder: (context, params) => const Auth3PhoneWidget(),
        ),
        FFRoute(
          name: 'auth_3_verifyPhone',
          path: '/auth3VerifyPhone',
          builder: (context, params) => Auth3VerifyPhoneWidget(
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'auth_3_ForgotPassword',
          path: '/auth3ForgotPassword',
          builder: (context, params) => const Auth3ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(
            pageName: params.getParam('pageName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'user_details_profile',
          path: '/userDetailsProfile',
          builder: (context, params) => UserDetailsProfileWidget(
            phone: params.getParam('phone', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'my_ads',
          path: '/myAds',
          builder: (context, params) => const MyAdsWidget(),
        ),
        FFRoute(
          name: 'Product_Page',
          path: '/productPage',
          asyncParams: {
            'shopDetails': getDoc(['shops'], ShopsRecord.fromSnapshot),
          },
          builder: (context, params) => ProductPageWidget(
            shopDetails: params.getParam('shopDetails', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'sell_categories_1',
          path: '/sellCategories1',
          builder: (context, params) => const SellCategories1Widget(),
        ),
        FFRoute(
          name: 'sell_shop_details_2',
          path: '/sellShopDetails2',
          builder: (context, params) => SellShopDetails2Widget(
            adCategory: params.getParam('adCategory', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'sell_UploadShopImages_3',
          path: '/sellUploadShopImages3',
          builder: (context, params) => SellUploadShopImages3Widget(
            adName: params.getParam('adName', ParamType.String),
            adCategory: params.getParam('adCategory', ParamType.String),
            isPreviousShopExists:
                params.getParam('isPreviousShopExists', ParamType.String),
            typeOfPreviousShop:
                params.getParam('typeOfPreviousShop', ParamType.String),
            shopSize: params.getParam('shopSize', ParamType.int),
            description: params.getParam('description', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'sell_product_price_4',
          path: '/sellProductPrice4',
          builder: (context, params) => SellProductPrice4Widget(
            adName: params.getParam('adName', ParamType.String),
            adCategory: params.getParam('adCategory', ParamType.String),
            isPreviousShopExists:
                params.getParam('isPreviousShopExists', ParamType.String),
            typeOfPreviousShop:
                params.getParam('typeOfPreviousShop', ParamType.String),
            shopSize: params.getParam('shopSize', ParamType.int),
            description: params.getParam('description', ParamType.String),
            selectedImages: params.getParam<FFUploadedFile>(
                'selectedImages', ParamType.FFUploadedFile, true),
          ),
        ),
        FFRoute(
          name: 'sell_product_location_5',
          path: '/sellProductLocation5',
          builder: (context, params) => SellProductLocation5Widget(
            adName: params.getParam('adName', ParamType.String),
            adCategory: params.getParam('adCategory', ParamType.String),
            isPreviousShopExists:
                params.getParam('isPreviousShopExists', ParamType.String),
            typeOfPreviousShop:
                params.getParam('typeOfPreviousShop', ParamType.String),
            shopSize: params.getParam('shopSize', ParamType.int),
            description: params.getParam('description', ParamType.String),
            selectedImages: params.getParam<FFUploadedFile>(
                'selectedImages', ParamType.FFUploadedFile, true),
            priceOfProperty: params.getParam('priceOfProperty', ParamType.int),
            rentPerMonth: params.getParam('rentPerMonth', ParamType.int),
            inventoryCost: params.getParam('inventoryCost', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Copy',
          path: '/copy',
          builder: (context, params) => const CopyWidget(),
        ),
        FFRoute(
          name: 'ad_review_success_6',
          path: '/adReviewSuccess6',
          builder: (context, params) => const AdReviewSuccess6Widget(),
        ),
        FFRoute(
          name: 'HomePageColumn',
          path: '/homePageColumn',
          builder: (context, params) => const HomePageColumnWidget(),
        ),
        FFRoute(
          name: 'Product_PageCopy',
          path: '/productPageCopy',
          asyncParams: {
            'shopDetails': getDoc(['shops'], ShopsRecord.fromSnapshot),
          },
          builder: (context, params) => ProductPageCopyWidget(
            shopDetails: params.getParam('shopDetails', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'all_users',
          path: '/allUsers',
          builder: (context, params) => const AllUsersWidget(),
        ),
        FFRoute(
          name: 'main_chat',
          path: '/mainChat',
          asyncParams: {
            'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => MainChatWidget(
            chatUser: params.getParam('chatUser', ParamType.Document),
            chatRef: params.getParam(
                'chatRef', ParamType.DocumentReference, false, ['chats']),
          ),
        ),
        FFRoute(
          name: 'all_active_users',
          path: '/allActiveUsers',
          builder: (context, params) => const AllActiveUsersWidget(),
        ),
        FFRoute(
          name: 'HomePageColumnCopy',
          path: '/homePageColumnCopy',
          builder: (context, params) => const HomePageColumnCopyWidget(),
        ),
        FFRoute(
          name: 'Product_PageCopy2',
          path: '/productPageCopy2',
          asyncParams: {
            'shopDetails': getDoc(['shops'], ShopsRecord.fromSnapshot),
          },
          builder: (context, params) => ProductPageCopy2Widget(
            shopDetails: params.getParam('shopDetails', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PhoneNumberProfile',
          path: '/phoneNumberProfile',
          builder: (context, params) => PhoneNumberProfileWidget(
            phone: params.getParam('phone', ParamType.String),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/appStartScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/SPLASH_SCREEN.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
