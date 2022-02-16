import 'package:flutter/material.dart';

class BiographyScreen extends StatefulWidget {
  const BiographyScreen({ Key? key }) : super(key: key);

  @override
  _BiographyScreenState createState() => _BiographyScreenState();
}

class _BiographyScreenState extends State<BiographyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biography'),
      ),
    );
  }
}