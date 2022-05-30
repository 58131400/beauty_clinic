import 'package:beauty_clinic/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/app_state_manager.dart';
import 'navigation/app_link.dart';
import 'package:flutter/material.dart';
import 'navigation/app_route_parser.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(
    const BeautyClinic(),
  );
}

class BeautyClinic extends StatefulWidget {
  const BeautyClinic({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _BeautyClinicState? state =
        context.findAncestorStateOfType<_BeautyClinicState>();
    state?.changeLanguage(newLocale);
  }

  @override
  _BeautyClinicState createState() => _BeautyClinicState();
}

class _BeautyClinicState extends State<BeautyClinic> {
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;
  final routeParser = AppRouteParser();

  // @override
  // void initState() {
  //   super.initState();
  //   _appRouter = AppRouter(
  //     appStateManager: _appStateManager,
  //   );
  // }
  late Locale _locale;
  @override
  void initState() {
    super.initState();
    _locale = const Locale.fromSubtags(languageCode: 'vi');
  }

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('vi', ''),
          Locale('en', ''),
        ],
        locale: _locale,
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        // home: MaterialApp.router(
        //     routeInformationParser: routeParser, routerDelegate: _appRouter));
        home: LoginScreen());
  }
}
