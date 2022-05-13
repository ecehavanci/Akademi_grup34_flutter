import 'package:flutter/material.dart';
import 'package:moodvicer/pages/login.dart';
import 'package:moodvicer/values.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primarySwatch: Colors.indigo,
        backgroundColor: Colors.black12,
        buttonColor: Colors.deepOrangeAccent,
      ),
      home: const LoginPage(),
    );
  }
}
