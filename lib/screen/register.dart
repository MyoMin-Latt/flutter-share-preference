import 'package:flutter/material.dart';
import 'package:share_preference01/share_preference/share_preference.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.name,
            controller: _name,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Enter you name",
              labelText: 'Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _email,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Enter you email",
              labelText: 'Email',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: _address,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Enter you address",
              labelText: 'Address',
            ),
          ),
        ),
        ElevatedButton.icon(
            onPressed: () {
              print(_name.text + "/ " + _email.text + "/ " + _address.text);
              setState(() {
                saveData(key: 'name', value: _name.text);
                saveData(key: 'email', value: _email.text);
                saveData(key: 'address', value: _address.text);
                login(key: 'login', isLogin: true);
                refresh(context);
              });
            },
            icon: Icon(Icons.save_outlined),
            label: Text('Save')),
      ],
    );
  }
}
