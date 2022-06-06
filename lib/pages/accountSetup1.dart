import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moodvicer/pages/accountSetup3.dart';
import 'package:moodvicer/widgets/gender_selection_box.dart';
import 'package:moodvicer/widgets/login_buttons.dart';

import '../values.dart';
import '../widgets/long_button.dart';

class AccountSetupGender extends StatefulWidget {
  final String uid;

  const AccountSetupGender({Key? key, required this.uid}) : super(key: key);

  @override
  _AccountSetupGenderState createState() => _AccountSetupGenderState();
}

class _AccountSetupGenderState extends State<AccountSetupGender> {
  String selected = "F";
  int selectedIndex = 0;

  Future<void> setUpGender() async {
    if (selectedIndex == 1) {
      selected = "M";
    }

    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .update({"gender": selected})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isSelected = false;

    return Scaffold(
      body: Container(
        height: screenHeight,
        color: AppColors.grayDark,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  children: const [
                    Text(
                      "Tell us about yourself",
                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "To give you a best experience and results \n \t\t\t\t\t\t\t\t\t we need to know your gender.",
                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GenderSelector(
                    genderAsset: "assets/female.png",
                    genderName: "Female",
                    width: 150,
                    height: 150,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                      print(selectedIndex);
                    },
                  ),
                  GenderSelector(
                    genderAsset: "assets/male.png",
                    genderName: "Male",
                    width: 100,
                    height: 150,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                      print(selectedIndex);
                    },
                  ),
                ],
              ),
              LongButton(
                primaryColor: AppColors.lightBlue,
                text: 'Next',
                onPressed: () {
                  setUpGender();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountSetup3(uid: widget.uid),
                      ));
                },
                width: screenWidth / 1.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
