import 'package:flutter/material.dart';
import 'login1_widget.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'MyCTO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyCTO'),
        ),
        body: Login1Widget(), 
      ),
    );
  }
}
