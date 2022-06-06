import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/login_buttons.dart';
import 'package:moodvicer/widgets/login_input.dart';
import 'package:moodvicer/widgets/long_button.dart';

import 'home.dart';

class AccountSetup3 extends StatefulWidget {
  final String uid;

  AccountSetup3({Key? key, required this.uid}) : super(key: key);

  @override
  _AccountSetup3State createState() => _AccountSetup3State();
}

class _AccountSetup3State extends State<AccountSetup3> {
  final TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  _showToast(errorMessage) {
    Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.white,
        textColor: Colors.deepOrange,
        timeInSecForIosWeb: 5);
  }

  Future<void> setUpBirth_Name(DateTime birthDate, String name) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .update({"birthDate": birthDate, "name": name})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    bool _decideWhichDayToEnable(DateTime day) {
      if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
          day.isBefore(DateTime.now().add(Duration(days: 10))))) {
        return true;
      }
      return false;
    }

    _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        // Refer step 1
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.input,
        initialDatePickerMode: DatePickerMode.year,
        // selectableDayPredicate: _decideWhichDayToEnable,
        helpText: "Select your birth date",
        errorFormatText: 'Enter valid date',
        fieldHintText: 'Month/Date/Year',
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    return Scaffold(
      body: Container(
        height: screenHeight,
        color: AppColors.grayDark,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                "Fill your profile",
                                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Final brushes..",
                                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 15),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(30.0),
                              child: CircleAvatar(
                                foregroundImage: NetworkImage(
                                    "https://atlantagirlsschool.org/wp-content/uploads/img_headshot-900x900.png"),
                                radius: 75,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                              child: CustomSignInTextField(
                                textColor: AppColors.white,
                                borderColor: AppColors.lightOrange,
                                keyboardType: TextInputType.text,
                                hint: "Name Surname",
                                label: 'Name',
                                controller: nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    _showToast("Please enter your password");
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: screenHeight / 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("${selectedDate.toLocal()}".split(' ')[0],
                                    style:
                                        TextStyle(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 20)),
                                CustomLogButton(
                                  onPressed: () => _selectDate(context), // Refer step 3
                                  primaryColor: AppColors.lightOrange2, text: 'Select birth date',
                                  fontsize: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight / 10,
                        ),
                        LongButton(
                          primaryColor: AppColors.lightOrange2,
                          text: 'Next',
                          onPressed: () {
                            setUpBirth_Name(selectedDate, nameController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(uid: widget.uid),
                                ));
                          },
                          width: screenWidth / 1.2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
