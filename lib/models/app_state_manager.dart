import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'app_cache.dart';

class AppStateManager extends ChangeNotifier {
  bool _loggedIn = false;
  bool _initialized = true;
  final _appCache = AppCache();

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;

  void initializeApp() async {
    _loggedIn = await _appCache.isUserLoggedIn();

    Timer(
      const Duration(milliseconds: 2000),
      () {
        notifyListeners();
      },
    );
  }

  void login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void logout() async {
    _initialized = false;

    await _appCache.invalidate();

    initializeApp();
    notifyListeners();
  }


}
