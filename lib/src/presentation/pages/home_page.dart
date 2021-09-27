import 'package:flutter/material.dart';
import 'package:flutter_application_muster/src/presentation/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
    );
  }
}
