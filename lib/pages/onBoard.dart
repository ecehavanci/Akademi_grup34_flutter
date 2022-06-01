import 'package:moodvicer/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/onboard_model.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/img-1.jpg',
      text: "Header",
      desc: "content",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/img-2.jpg',
      text: "Header",
      desc: "content",
      bg: const Color(0xFF4756DF),
      button: Colors.white,
    ),
    OnboardModel(
      img: 'assets/img-3.jpg',
      text: "Gunakan Fitur Kolaborasi Untuk Pengalaman Lebih",
      desc: "content",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex % 2 == 0 ? AppColors.kwhite : AppColors.kblue,
      appBar: AppBar(
        backgroundColor: currentIndex % 2 == 0 ? AppColors.kwhite : AppColors.kblue,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnboardInfo();
           //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: currentIndex % 2 == 0 ? AppColors.kblack : AppColors.kwhite,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(screens[index].img),
                  Container(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            width: currentIndex == index ? 25 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentIndex == index ? AppColors.kbrown : AppColors.kbrown300,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ]);
                      },
                    ),
                  ),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: index % 2 == 0 ? AppColors.kblack : AppColors.kwhite,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      color: index % 2 == 0 ? AppColors.kblack : AppColors.kwhite,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      print(index);
                      if (index == screens.length - 1) {
                        await _storeOnboardInfo();
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      }

                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                      decoration: BoxDecoration(
                          color: index % 2 == 0 ? AppColors.kblue : AppColors.kwhite,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          "Next",
                          style: TextStyle(fontSize: 16.0, color: index % 2 == 0 ? AppColors.kwhite : AppColors.kblue),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: index % 2 == 0 ? AppColors.kwhite : AppColors.kblue,
                        )
                      ]),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
