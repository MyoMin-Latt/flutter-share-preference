import 'package:flutter/material.dart';
import 'package:share_preference01/share_preference/share_preference.dart';

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
      body: Column(
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
        ],
      ),
    );
  }
  Widget getSPDtata(Future<String> data){
    return FutureBuilder<String>(
      future: data,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Text(snapshot.data!);
        }
        else if(snapshot.hasError){
          return Center(child: Text('Future Snapshot has error'),);
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}