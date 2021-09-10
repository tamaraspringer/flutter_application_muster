import 'package:flutter/material.dart';
import 'package:flutter_application_muster/src/presentation/pages/home_page.dart';
import 'package:flutter_application_muster/src/presentation/pages/users_list.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, void Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          buildListTile('Home Page', Icons.home, () {
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          }),
          buildListTile('Users List', Icons.home, () {
            Navigator.of(context).pushReplacementNamed(UsersList.routeName);
          }),
        ],
      ),
    );
  }
}
