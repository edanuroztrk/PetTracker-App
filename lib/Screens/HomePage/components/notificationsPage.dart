import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';


class notificationsPage extends StatefulWidget {

  const notificationsPage({Key key}) : super(key: key);

  @override
  _notificationsPageState createState() => _notificationsPageState();
}

class _notificationsPageState extends State<notificationsPage> {
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  // void initState() {
  //   // ...
  //
  //   _firebaseMessaging.configure(
  //     onMessage: (Map<String, dynamic> message) async {
  //       print("onMessage: $message");
  //       showDialog(
  //         context: context,
  //         builder: (context) =>
  //             AlertDialog(
  //               content: ListTile(
  //                 title: Text(message['notification']['title']),
  //                 subtitle: Text(message['notification']['body']),
  //               ),
  //               actions: <Widget>[
  //                 FlatButton(
  //                   child: Text('Ok'),
  //                   onPressed: () => Navigator.of(context).pop(),
  //                 ),
  //               ],
  //             ),
  //       );
  //     },
  //     onLaunch: (Map<String, dynamic> message) async {
  //       print("onLaunch: $message");
  //       // TODO optional
  //     },
  //     onResume: (Map<String, dynamic> message) async {
  //       print("onResume: $message");
  //       // TODO optional
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Text("hello")
    );

  }
}