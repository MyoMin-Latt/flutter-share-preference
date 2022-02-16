import 'package:flutter/material.dart';
import 'package:share_preference01/screen/biography.dart';
import 'package:share_preference01/screen/register.dart';
import 'package:share_preference01/share_preference/share_preference.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biography App'),
      ),
      body: FutureBuilder<bool>(
          future: isLogin(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.hasData != null && snapshot.data!) {
                return BiographyScreen();
              } else if (snapshot.data != null && snapshot.data == false) {
                return RegisterScreen();
              } else {
                return Center(
                  child: Text('Please check Future isLogin()'),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
