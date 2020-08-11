import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/ui/common/quote_widget.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:random_color/random_color.dart';

class _LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final Firestore _firestore = Firestore();
  final RandomColor _randomColor = RandomColor();
  _getToken() {
    _fcm.getToken().then((token) {
      _db
          .collection("tokens")
          .add({"token": token}).then((value) => print(value));
    });
  }

  @override
  void initState() {
    _fcm.requestNotificationPermissions(IosNotificationSettings());
      _getToken();
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //             content: ListTile(
        //             title: Text(message['notification']['title']),
        //             subtitle: Text(message['notification']['body']),
        //             ),
        //             actions: <Widget>[
        //             FlatButton(
        //                 child: Text('Ok'),
        //                 onPressed: () => Navigator.of(context).pop(),
        //             ),
        //         ],
        //     ),
        // );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // _getToken();
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        
        // TODO optional
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 340, height: 660);
    return Scaffold(
      body: StreamBuilder(
        stream: _firestore.collection('ahlalbayt').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return _LoadingIndicator();
          return PageView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              final document = snapshot.data.documents[index];
              return QuoteWidget(
                backgroundColor: _randomColor.randomColor(
                  colorBrightness: ColorBrightness.dark,
                ),
                quote: document['quote'],
                author: document['author'],
              );
            },
          );
        },
      ),
    );
  }
}
