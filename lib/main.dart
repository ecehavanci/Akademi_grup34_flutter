import 'package:flutter/material.dart';
import 'package:moodvicer/pages/accountSetup1.dart';
import 'package:moodvicer/pages/accountSetup3.dart';
import 'package:moodvicer/pages/login.dart';
import 'package:moodvicer/pages/login1.dart';
import 'package:moodvicer/pages/notification_settings_widget.dart';
import 'package:moodvicer/pages/onBoard.dart';
import 'package:moodvicer/pages/privacy_policy_widget.dart';
import 'package:moodvicer/pages/registerPage.dart';
import 'package:moodvicer/values.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? isViewed = prefs.getInt('onBoard');
  runApp(MyApp(
    isViewed: isViewed,
  ));
}

class MyApp extends StatelessWidget {
  final int? isViewed;

  const MyApp({Key? key, this.isViewed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Comfortaa',
          primarySwatch: Colors.indigo,
          backgroundColor: Colors.black12,
          buttonColor: Colors.deepOrangeAccent,
          sliderTheme: const SliderThemeData(
            thumbColor: Colors.green,
            overlayColor: AppColors.lightOrange2,
            valueIndicatorColor: AppColors.lightOrange2,

            /// track color
            activeTrackColor: AppColors.kblue,
            inactiveTrackColor: Colors.black12,

            /// ticks in between
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: Colors.transparent,
          )),
      home: isViewed != 0 ? OnBoard() : const RegisterPage(),
    );
  }
}
