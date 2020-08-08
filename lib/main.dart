import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/ui/pages/quote_screen.dart';

final DBRef = FirebaseDatabase.instance.reference();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Full',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: QuoteScreen(),
      ),

    );
  }


}
