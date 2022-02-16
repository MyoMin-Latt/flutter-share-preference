import 'package:flutter/material.dart';
import 'package:share_preference01/screen/biography.dart';
import 'package:share_preference01/screen/register.dart';
import 'package:share_preference01/share_preference/share_preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biography App'),
      ),
      body: FutureBuilder<bool>(
        future: isLogin(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data!) {
              return BiographyPage();
            } else if (snapshot.data != null && snapshot.data == false) {
              return RegisterPage();
            } else {
              return Center(
                child: Text('Error in Snapshot Data'),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Future Snapshot has error'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
