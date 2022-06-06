import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moodvicer/pages/loginPage.dart';
import 'package:moodvicer/values.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import './notification_settings_widget.dart';
import './privacy_policy_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  final String uid;

  const ProfilePage({Key? key, required this.uid}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  String? userName, email;

  Future<void> getUserName_Email() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(widget.uid).get();

    Map<String, dynamic> data = docSnapshot.data()!;
    setState(() {
      userName = data['name'];
      email = data['email'];
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getUserName_Email();
    super.initState();

    /* startPageLoadAnimations(
      animationsMap.values.where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    ); */
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.white, size: 25),
            tooltip: 'Open shopping builder',
            onPressed: () {
              Navigator.pop(context);
            }),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(80),
          ),
        ),
        backgroundColor: AppColors.mediumGrayDark,
        elevation: 0,
        toolbarHeight: screenHeight / 13,
        leadingWidth: 80,
      ),
      key: scaffoldKey,
      backgroundColor: const Color(0xFF1C1C1E),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: AppColors.lightOrange2,
                              offset: Offset(0, 2),
                              spreadRadius: 5,
                            )
                          ],
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /* AnimatedContainer(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.width * 0.3,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                duration: const Duration(),
                                child: Image.network(
                                  'https://picsum.photos/seed/487/600',
                                ),
                              ).animated(animationsMap['circleImageOnPageLoadAnimation']!!),*/
                              Text(
                                userName ?? "Error in loading name",
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  email ?? "Error in loading email",
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    color: AppColors.mediumGrayDark,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'My Account',
                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotificationSettingsWidget(),
                                  ),
                                );
                              },
                              text: 'Notification Settings',
                              options: FFButtonOptions(
                                width: 350,
                                height: 50,
                                color: Color(0x004B39EF),
                                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                print('Button-datas pressed ...');
                              },
                              text: 'My Datas',
                              options: FFButtonOptions(
                                width: 350,
                                height: 50,
                                color: Color(0x004B39EF),
                                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PrivacyPolicyWidget(),
                                  ),
                                );
                              },
                              text: 'Privacy Policy',
                              options: FFButtonOptions(
                                width: 350,
                                height: 50,
                                color: Color(0x004B39EF),
                                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ));
                              },
                              text: 'Logout',
                              options: FFButtonOptions(
                                width: 350,
                                height: 50,
                                color: Color(0x004B39EF),
                                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: 10,
                              ),
                            ),
                          ],
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
