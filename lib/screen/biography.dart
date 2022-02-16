import 'package:flutter/material.dart';
import 'package:share_preference01/screen/update.dart';
import 'package:share_preference01/share_preference/share_preference.dart';

class BiographyPage extends StatefulWidget {
  const BiographyPage({Key? key}) : super(key: key);

  @override
  _BiographyPageState createState() => _BiographyPageState();
}

class _BiographyPageState extends State<BiographyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Name'),
      getSharePreData(getData(key: 'name')),
      Divider(),
      Text('Email'),
      getSharePreData(getData(key: 'email')),
      Divider(),
      Text('Address'),
      getSharePreData(getData(key: 'phone')),
      Divider(),
      ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UpdatePage();
            }));
          },
          icon: Icon(Icons.edit),
          label: Text('Edit')),
      ElevatedButton.icon(
          onPressed: () {
            setState(() {
              logout(context);
            });
          },
          icon: Icon(Icons.logout),
          label: Text('Logout')),
    ]);
  }

  Widget getSharePreData(Future<String> Data) {
    return FutureBuilder<String>(
        future: Data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error'));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
