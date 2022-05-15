import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moodvicer/pages/home.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/login_buttons.dart';
import 'package:moodvicer/widgets/login_input.dart';
import 'package:moodvicer/widgets/shaped_container.dart';
import 'package:moodvicer/widgets/text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          backgroundColor: Colors.black54,
          textColor: Colors.white60,
          timeInSecForIosWeb: 5);
    }

    Future<void> signUp(String email, String password) async {
      setState(() {
        isLoading = true;
      });

      UserCredential newUser;
      bool isvalidate = formKey.currentState!.validate();
      if (isvalidate) {
        try {
          newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
          uid = newUser.user!.uid;

          final user = User_(uid: uid, name: "", email: email, horoscope: "");
          final docRef = db
              .collection("users")
              .withConverter(
                fromFirestore: User_.fromFirestore,
                toFirestore: (User_ user, options) => user.toFirestore(),
              )
              .doc(uid);
          await docRef.set(user).onError((e, _) => print("Error writing document: $e"));

          /*db.collection("users")
              .doc(uid)
              .set({"email": email, "username": "", "avatarUrl": "", "name": "", "uid": uid}).onError(
                  (e, _) => print("Error writing document: $e")); */

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      uid: uid,
                    )),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            _showToast("The password provided is too weak.");
          } else if (e.code == 'email-already-in-use') {
            _showToast("The account already exists for that email.");
          }
        } catch (e) {
          print(e);
          _showToast(e.toString());
        }
      } else
        _showToast("Fill the necessary inputs");
      setState(() {
        isLoading = false;
      });
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
        color: Colors.white60,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomLogButton(
                                        text: "Login",
                                        onPressed: () {
                                          login(emailController.text, passwordController.text);
                                        }),
                                    CustomLogButton(
                                      text: "Sign Up",
                                      onPressed: () => {
                                        signUp(emailController.text, passwordController.text),
                                      },
                                    ),
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
      ),
    );
  }
}
