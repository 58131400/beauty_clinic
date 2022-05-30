import 'package:beauty_clinic/main.dart';
import 'package:beauty_clinic/models/beautyclinic_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

enum Menu { en, vi }

class LoginScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: BeautyClinicPages.loginPath,
      key: ValueKey(BeautyClinicPages.loginPath),
      child: LoginScreen(),
    );
  }

  String selectedLanguage = 'English';
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();

  final _passController = TextEditingController();

  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);

  final TextStyle focusedStyle = const TextStyle(color: Colors.green);

  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);
  String _selectedLanguage = 'Select Language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButtonMenu(),
                const SizedBox(
                  height: 200,
                  child: Image(
                    image: AssetImage('assets/beautyClinic_assets/rw_logo.png'),
                  ),
                ),
                const SizedBox(height: 16),
                buildUsernameTextfield(),
                const SizedBox(height: 16),
                buildPasswordTextfield(),
                const SizedBox(height: 16),
                buildButton(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.noAccount),
                    TextButton(
                        onPressed: (() {}),
                        child: Text(AppLocalizations.of(context)!.register))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              // height: 55,
              ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: rwColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: 5,
            ),
            child: Text(
              AppLocalizations.of(context)!.login,
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              Provider.of<AppStateManager>(context, listen: false)
                  .login('mockUsername', 'mockPassword');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              onSurface: Colors.grey,
              // : 55,
              primary: const Color.fromARGB(255, 220, 210, 206),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            child: Text(
              AppLocalizations.of(context)!.clear,
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _userController.clear();
              _passController.clear();
            },
          ),
        ),
      ],
    );
  }

  Widget buildUsernameTextfield() {
    return TextField(
      controller: _userController,
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        hintText: Text(AppLocalizations.of(context)!.username).data,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }

  Widget buildPasswordTextfield() {
    return TextField(
      obscureText: true,
      controller: _passController,
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        hintText: Text(AppLocalizations.of(context)!.password).data,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }

  Widget buildButtonMenu() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Center(
        child: PopupMenuButton(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(color: rwColor)),
            child: Text(_selectedLanguage),
          ),
          onSelected: (Menu item) {
            if (item == Menu.en) _selectedLanguage = 'English';
            if (item == Menu.vi) _selectedLanguage = 'Vietnamese';
            Locale newLocale = Locale(item.name);
            BeautyClinic.setLocale(context, newLocale);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
            const PopupMenuItem<Menu>(
              value: Menu.en,
              child: Text('English'),
            ),
            const PopupMenuItem<Menu>(
              value: Menu.vi,
              child: Text('Vietnamese'),
            ),
          ],
        ),
      ),
    );
  }
}
