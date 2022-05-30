import 'package:beauty_clinic/models/app_state_manager.dart';
import 'package:beauty_clinic/models/beautyclinic_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: HomeScreen(),
      name: BeautyClinicPages.home,
      key: ValueKey(BeautyClinicPages.home),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
      );
    });
  }
}
