import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_feed/user_model.dart';

import 'api_handler.dart';

class DetailPage extends StatelessWidget {
  final User _user;
  final int _userId;

  DetailPage(this._user, this._userId);

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
              new _UserPosts(_userId),
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

class _UserPosts extends StatelessWidget {
  final int _userId;

  _UserPosts(this._userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getListOfPosts(_userId),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            //If no data is returned
            if (snapshot.data == null) {
              return Container(
                child: Center(
                child: CircularProgressIndicator(),
              ),
            );
            } else { //We've got the posts list
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data[index].title,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                      subtitle: Text(
                        snapshot.data[index].body,
                        softWrap: true,
                      ),
                    )
                  );
                },
              );
            }
          },
        ),
      )
    );
  }
}