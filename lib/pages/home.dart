import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moodvicer/pages/movieHomePage.dart';
import 'package:moodvicer/pages/profilePage.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/text_button.dart';

import '../widgets/login_buttons.dart';
import '../widgets/shaped_container.dart';
import '../widgets/slider.dart';

class HomePage extends StatefulWidget {
  final String uid;

  const HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected;
  String? userName;

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  Future<void> getUserName() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(widget.uid).get();

    Map<String, dynamic> data = docSnapshot.data()!;
    setState(() {
      userName = data['name'];
    });
  }

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
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome $userName',
                textScaleFactor: 0.8,
              ),
            ),
            const Text(
              'How do you feel today?',
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      uid: widget.uid,
                    ),
                  ));
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CommonContainer(
                  height: screenHeight,
                  width: screenWidth,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset(
                        "mood-scaled.jpg",
                        width: screenWidth / 1.5,
                      ),
                      SizedBox(
                        height: screenHeight / 20,
                        width: screenWidth / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SliderLabelWidget(
                          onChanged: selected,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomLogButton(
                          text: "Choose your mood",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieHome(),
                                ));
                          },
                          primaryColor: AppColors.lightOrange,
                        ),
                      ),
                      Image.asset(
                        "horoscopes.png",
                        width: screenWidth / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomLogButton(
                          text: "Get random according to your horoscope",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieHome(),
                                ));
                          },
                          primaryColor: AppColors.lightOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
