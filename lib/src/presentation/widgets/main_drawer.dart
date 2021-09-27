import 'package:flutter/material.dart';
import 'package:flutter_application_muster/src/presentation/pages/home_page.dart';
import 'package:flutter_application_muster/src/presentation/pages/users_list.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, void Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
        color: Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.indigo[700],
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.w500,
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
          DrawerHeader(
            curve: Curves.linear,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(color: Colors.indigo[200]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Home Page', Icons.home, () {
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          }),
          buildListTile('Users List', Icons.list_alt, () {
            Navigator.of(context).pushReplacementNamed(UsersList.routeName);
          }),
        ],
      ),
    );
  }
}
