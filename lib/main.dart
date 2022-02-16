// @14.1 Sharedpreference Storage
// @14.2 Sharedpreference (part 2)
// @14.3 Sharedpreference Storage (Part 3)
// @14.4 Login App (SharedPreference) [Part 1]
// @14.5 Login App( SharedPreference) [Part 2]
// @14.6 Login App (Shared-preference) [Part 3]
// @14.6 Login App (SharedPreference)[Part 4]






import 'package:flutter/material.dart';
import 'screen/home.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

