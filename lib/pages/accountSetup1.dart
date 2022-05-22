import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moodvicer/widgets/gender_selection_box.dart';
import 'package:moodvicer/widgets/login_buttons.dart';

import '../values.dart';
import '../widgets/long_button.dart';

class AccountSetupGender extends StatefulWidget {
  const AccountSetupGender({Key? key}) : super(key: key);

  @override
  _AccountSetupGenderState createState() => _AccountSetupGenderState();
}

class _AccountSetupGenderState extends State<AccountSetupGender> {
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
                padding: const EdgeInsets.only(top:70),
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
                    onTap: (){
                    },
                  ),
                  GenderSelector(
                    genderAsset: "assets/male.png",
                    genderName: "Male",
                    width: 100,
                    height: 150,
                  ),
                ],
              ),
              LongButton(
                primaryColor: AppColors.lightBlue,
                text: 'Next',
                onPressed: () {},
                width: screenWidth / 1.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
