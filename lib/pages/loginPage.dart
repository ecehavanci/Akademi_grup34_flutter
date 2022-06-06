import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moodvicer/pages/home.dart';
import 'package:moodvicer/pages/registerPage.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/login_buttons.dart';
import 'package:moodvicer/widgets/login_input.dart';
import 'package:moodvicer/widgets/long_button.dart';
import 'package:moodvicer/widgets/shaped_container.dart';
import 'package:moodvicer/widgets/text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../auth/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final String uid;
  late final String loginUid;
  bool isLoading = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isChecked = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    _showToast(errorMessage) {
      Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.white,
          textColor: Colors.deepOrange,
          timeInSecForIosWeb: 5);
    }

    Future<void> login(String email, String password) async {
      setState(() {
        isLoading = true;
      });
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

        if (userCredential != null) {
          uid = userCredential.user!.uid;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      uid: uid,
                    )),
          );
        }
      } catch (e) {
        _showToast("Wrong email or password");
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.grey,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(
                          60.0,
                        ),
                        child: Text(
                          "Login to your Account",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonContainer(
                            radius: 30,
                            padding: const EdgeInsets.all(05),
                            width: screenWidth / 0.50,
                            height: screenHeight / 1.39,
                            color: Colors.grey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                                      child: CustomSignInTextField(
                                        borderColor: AppColors.lightOrange2,
                                        textColor: AppColors.white,
                                        keyboardType: TextInputType.emailAddress,
                                        hint: "Email",
                                        label: 'Email',
                                        controller: emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                                      child: CustomSignInTextField(
                                        borderColor: AppColors.lightOrange2,
                                        textColor: AppColors.white,
                                        keyboardType: TextInputType.visiblePassword,
                                        hint: "Password",
                                        label: 'Password',
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor: MaterialStateProperty.resolveWith((states) {
                                        // If the button is pressed, return size 40, otherwise 20
                                        if (states.contains(MaterialState.pressed)) {
                                          return AppColors.kblue;
                                        }
                                        return AppColors.lightOrange2;
                                      }),
                                      //fillColor: MaterialStateProperty.resolveWith(getColor),
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Remember Me",
                                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    LongButton(
                                      primaryColor: AppColors.lightOrange2,
                                      text: 'Log In',
                                      onPressed: () {
                                        login(emailController.text, passwordController.text);
                                      },
                                      width: screenWidth / 1.2,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Don't have have an account?  ",
                                      style:
                                          TextStyle(color: AppColors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextButton(
                                      text: "Sign Up!",
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => RegisterPage()),
                                        );
                                      },
                                      fontSize: 18,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
