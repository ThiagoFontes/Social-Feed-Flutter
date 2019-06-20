import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_feed/user_model.dart';

class DetailPage extends StatelessWidget {
  final User _user;

  DetailPage(this._user);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Text("Posts")),
                Tab(icon: Text("Details")),
              ],
            ),
            title: Text(_user.username),
          ),
          body: TabBarView(
            children: [
              Text("Posts will be here..."),
              new _UserDetails(_user),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserDetails extends StatelessWidget{
  final User _user;
  _UserDetails(this._user);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ListTile(
              title: Text("Name"),
              subtitle: Text(_user.name),
              leading: Icon(Icons.assignment_ind),
            ),
            ListTile(
              title: Text("Email"),
              subtitle: Text(_user.email),
              leading: Icon(Icons.mail),
            ),
            ListTile(
              title: Text("Phone"),
              subtitle: Text(_user.phone),
              leading: Icon(Icons.phone),
            ),
          ],
        ),
      ),
    );
  }

}