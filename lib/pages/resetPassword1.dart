import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/long_button.dart';
import 'package:moodvicer/widgets/shaped_container.dart';

class ResetPasswordPage1 extends StatefulWidget {
  const ResetPasswordPage1({Key? key}) : super(key: key);

  @override
  _ResetPasswordPage1State createState() => _ResetPasswordPage1State();
}

class _ResetPasswordPage1State extends State<ResetPasswordPage1> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isSelected = false;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.grayDark,
        title: const Text("Forget Password"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 34,
          onPressed: () {},
        ),
      ),
      body: Container(
        height: screenHeight,
        color: AppColors.grayDark,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [ Image.asset("assets/resetPasswordRobot.png"),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Approve your contact details.",
                        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ),
                    CommonContainer(
                      width: screenWidth / 1.1,
                      height: screenHeight / 8,
                      color: AppColors.mediumGrayLight,
                      padding: const EdgeInsets.all(5),
                      radius: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: const [
                            Text(
                              "Via Mail:",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "alpertas.cpp@gmail.com", //this will be changed to real mail address
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                LongButton(
                  primaryColor: AppColors.lightOrange2,
                  text: 'Next',
                  onPressed: () {},
                  width: screenWidth / 1.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
