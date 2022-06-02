import 'package:flutter/material.dart';

import '../../model/results.dart';
import '../screen/random_user_swipe_screen.dart';

class UserListWidget extends StatelessWidget {
  final Autogenerated userList;

  UserListWidget({Key key, this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            separatorBuilder: (context, index) =>
                Divider(color: Colors.grey.shade300),
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: EdgeInsets.all(18.0),
            itemCount: userList.results.length,
            itemBuilder: (BuildContext context, int index) {
              var user = userList.results[index];
              return ListTile(
                  leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                              image: NetworkImage('${user.picture.large}'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          border: Border.all(color: Colors.white, width: 2.0))),
                  title: Text('${user.name.first} ${user.name.last}'),
                  subtitle: Text('${user.email}',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  onLongPress: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => RandomUserSwipeScreen(
                              userIndex: index, resultUser: userList))),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            '${user.name.first} ${user.name.last},\nLong press item to enlarge view.')));
                  });
            }));
  }
}