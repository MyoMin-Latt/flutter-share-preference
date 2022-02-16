import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLogin()async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool('login') ?? false;
}
Future saveData({required String key, required String value})async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setString(key, value);
}
Future<bool> login({required String key, required bool isLogin})async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setBool(key, isLogin);
}