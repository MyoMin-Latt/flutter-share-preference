import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SharedPreferences.getInstance().then((preferences) {
      _name.text = preferences.getString('name') ?? '';
      _passwod.text = preferences.getString('password') ?? '';
      _address.text = preferences.getString('address') ?? '';
    });
    super.initState();
  }

  final TextEditingController _name = TextEditingController();
  final TextEditingController _passwod = TextEditingController();
  final TextEditingController _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('shared_preferences')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Name',
                      hintText: 'Enter you name')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _passwod,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Password',
                      hintText: 'Enter you password')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _address,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Address',
                      hintText: 'Enter you address')),
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 40),
                    side: BorderSide(width: 10, style: BorderStyle.none),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)))),
                onPressed: () {
                  saveSharePreference('name', _name.text);
                  saveSharePreference('password', _passwod.text);
                  saveSharePreference('address', _address.text);
                  print(
                      _name.text + '/ ' + _passwod.text + '/ ' + _address.text);
                },
                icon: Icon(Icons.save),
                label: Text('Save'))
          ],
        ),
      ),
    );
  }

  void saveSharePreference(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }
}
