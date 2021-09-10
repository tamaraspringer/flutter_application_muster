import 'package:flutter/material.dart';
import 'package:flutter_application_muster/src/data-domain/service/get_user.dart';

class UsersList extends StatefulWidget {
  static const routeName = '/users-list';
  @override
  UsersListState createState() => UsersListState();
}

class UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Muster App"),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading...", style: TextStyle(fontSize: 25.0)),
                  ),
                );
              } else
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: Colors.green[50],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(5.0),
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.green[300],
                                child: Text(snapshot.data[index].id.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0))),
                            title: Text(snapshot.data[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0)),
                            subtitle: Text(snapshot.data[index].deviceType,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic)),
                            trailing: Text(snapshot.data[index].currency,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0)),
                            /*onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsPage(snapshot.data[index])));
                            },*/
                          ));
                    });
            },
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        child: Icon(Icons.refresh),
        onPressed: () => GetUsers(userRepository)(),
      ),*/
    );
  }
}
