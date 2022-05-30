import 'package:flutter/cupertino.dart';

class AppLink {
  static const String kHomePath = '/home';
  static const String kLoginPath = '/login';
  static const String kRegisterPath = '/register';
  static const String kProfilePath = '/profile';
  static const String kHistoryPath = '/history';

  String? location;
  AppLink({required this.location});

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;
    final link = AppLink(location: uri.path);
    return link;
  }

  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '${key} = $value&';
    switch (location) {
      case kLoginPath:
        return kLoginPath;
      case kHomePath:
        return kHomePath;
      case kHistoryPath:
        return kHistoryPath;
      case kProfilePath:
        return kProfilePath;
      case kRegisterPath:
        return kRegisterPath;
      default:
        var loc = '$kHomePath?';
        return Uri.encodeFull(loc);
    }
  }
}
