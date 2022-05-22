import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/text_button.dart';

import '../widgets/login_buttons.dart';
import '../widgets/shaped_container.dart';

class HomePage extends StatefulWidget {
  final String uid;

  const HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.apps, color: AppColors.white, size: 25),
            tooltip: 'Open shopping builder',
            onPressed: () {
              // Scaffold.of(context).openDrawer();
            }),
        title: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome UserName',
                textScaleFactor: 0.8,
              ),
            ),
            Text(
              'What would you love to do today?',
              textScaleFactor: 0.6,
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(80),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: AppColors.white, size: 30),
            tooltip: 'Open account settings',
            onPressed: () {
              // handle the press
            },
          ),
        ],
        backgroundColor: Colors.indigo,
        elevation: 0,
        toolbarHeight: screenHeight / 5,
        leadingWidth: 80,
      ),
      body: Container(
        color: AppColors.mediumGrayLight,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonContainer(
                  height: screenWidth / 1.9,
                  width: screenWidth,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset("mood-scaled.jpg"),
                      CustomLogButton(
                        text: "Choose your mood",
                        onPressed: () {},
                        primaryColor: AppColors.lightOrange,
                      ),
                    ],
                  ),
                ),
                CommonContainer(
                  height: screenWidth / 1.2,
                  width: screenWidth,
                  padding: const EdgeInsets.only(top: 7),
                  child: Column(
                    children: [
                      Image.asset(
                        "horoscopes.png",
                        width: screenWidth / 1.5,
                      ),
                      CustomLogButton(
                        text: "Choose your horoscope ",
                        onPressed: () {},
                        primaryColor: AppColors.lightOrange,
                      ),
                    ],
                  ),
                ),
                const Text("And get started!",textScaleFactor: 1.1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
