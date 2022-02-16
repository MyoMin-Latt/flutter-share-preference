import 'package:flutter/material.dart';
import 'package:share_preference01/share_preference/share_preference.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please fill something';
                  }
                },
                keyboardType: TextInputType.name,
                controller: _name,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    hintText: 'Enter you name',
                    labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please fill something';
                  }
                },
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    hintText: 'Enter you email',
                    labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please fill something';
                  }
                },
                keyboardType: TextInputType.phone,
                controller: _phone,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    hintText: 'Enter you phone',
                    labelText: 'Phone'),
              ),
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  bool valid = _formKey.currentState!.validate();
                  print(_name.text + _email.text + _phone.text);
                  if(valid){
                    setState(() {
                  
                  saveData(key: 'name', value: _name.text);
                  saveData(key: 'email', value: _email.text);
                  saveData(key: 'phone', value: _phone.text);
                  login(key: 'login', value: true);
                  refreshData(context);
                  });
                  }
                },
                icon: Icon(Icons.save),
                label: Text('Save')),
          ],
        ),
      ),
    );
  }
}
