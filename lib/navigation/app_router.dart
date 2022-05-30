import 'package:beauty_clinic/models/beautyclinic_pages.dart';
import 'package:flutter/material.dart';

import '../models/app_state_manager.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import 'app_link.dart';

class AppRouter extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        // Navigator(
        //   key: navigatorKey,
        //   onPopPage: _handlePopPage,
        //   pages: [
        //     if (!appStateManager.isInitialized) ...[
        //       SplashScreen.page(),
        //     ] else if (!appStateManager.isLoggedIn) ...[
        //       LoginScreen.page(),
        //     ] else ...[
        //       HomeScreen.page(),
        //       // if (profileManager.didSelectUser)
        //       //   ProfileScreen.page(profileManager.getUser),
        //       // if (profileManager.didTapOnRaywenderlich) WebViewScreen.page(),
        //     ]
        //   ],
        );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

  @override
  AppLink get currentConfiguration => getCurrentPath();

  @override
  Future<void> setNewRoutePath(AppLink configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  getCurrentPath() {}

  // TODO: Replace setNewRoutePath

}
