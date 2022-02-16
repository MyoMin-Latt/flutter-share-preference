import 'package:flutter/material.dart';
import 'package:share_preference01/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLogin() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool('login') ?? false;
}

Future saveData({required String key, required String value}) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setString(key, value);
}

Future<bool> login({required String key, required bool isLogin}) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setBool(key, isLogin);
}

Future<String> getData({required String key}) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString(key) ?? '';
}

void logout(context) {
  saveData(key: 'name', value: '');
  saveData(key: 'email', value: '');
  saveData(key: 'address', value: '');
  login(key: 'login', isLogin: false);
  refresh(context);
}

void refresh(context) {
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
}
