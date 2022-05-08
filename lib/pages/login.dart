import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/login_buttons.dart';
import 'package:moodvicer/widgets/login_input.dart';
import 'package:moodvicer/widgets/shaped_container.dart';
import 'package:moodvicer/widgets/text_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        color: Colors.white60,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  height: 150,
                  width: 150,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(10), // Image radius
                        child: Image.asset(
                          "moodvicer_icon.jpg",
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonContainer(
                    radius: 30,
                    padding: const EdgeInsets.all(15),
                    width: screenWidth / 1.0,
                    height: screenHeight / 1.39,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Login to MoodVicer",
                            style: TextStyle(color: AppColors.darkPurple, fontSize: 20),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                              child: CustomSignInTextField(
                                keyboardType: TextInputType.emailAddress,
                                hint: "Email",
                                label: 'Email',
                                controller: emailController,
                                borderColor: AppColors.lightOrange,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                              child: CustomSignInTextField(
                                borderColor: AppColors.lightOrange,
                                keyboardType: TextInputType.visiblePassword,
                                hint: "Password",
                                label: 'Password',
                                controller: passwordController,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            CustomLogButton(text: "Login"),
                            CustomLogButton(text: "Sign Up"),
                          ],
                        ),
                        CustomTextButton(
                          text: "Forgot Password?",
                          onPressed: () {},
                          fontSize: 15,
                        ),
                        const Text(
                          "━━ Other Login Options ━━",
                          style: TextStyle(color: AppColors.lightOrange, fontSize: 15),
                        ),
                        SizedBox(
                            height: screenHeight * 0.08,
                            width: screenWidth * 0.65,
                            child: CustomImageButton(
                              text: "Login With Gmail",
                              imagePath: "assets/google.png",
                              ImageHeight: screenHeight / 20,
                              ImageWidth: screenWidth / 10,
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
