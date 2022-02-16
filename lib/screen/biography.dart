import 'package:flutter/material.dart';
import 'package:share_preference01/screen/register.dart';
import 'package:share_preference01/screen/update.dart';
import 'package:share_preference01/share_preference/share_preference.dart';

class BiographyScreen extends StatefulWidget {
  const BiographyScreen({Key? key}) : super(key: key);

  @override
  _BiographyScreenState createState() => _BiographyScreenState();
}

class _BiographyScreenState extends State<BiographyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name'),
        getSPDtata(getData(key: 'name')),
        Divider(),
        Text('Email'),
        getSPDtata(getData(key: 'email')),
        Divider(),
        Text('Address'),
        getSPDtata(getData(key: 'address')),
        Divider(),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UpdateScreen();
                },
              ));
            },
            icon: Icon(Icons.edit_outlined),
            label: Text('Edit')),
        ElevatedButton.icon(
            onPressed: () {
              logout(context);
            },
            icon: Icon(Icons.logout),
            label: Text('LogOut'))
      ],
    );
  }

  Widget getSPDtata(Future<String> data) {
    return FutureBuilder<String>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Future Snapshot has error'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
