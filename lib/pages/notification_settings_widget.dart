import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSettingsWidget extends StatefulWidget {
  const NotificationSettingsWidget({Key? key}) : super(key: key);

  @override
  _NotificationSettingsWidgetState createState() => _NotificationSettingsWidgetState();
}

class _NotificationSettingsWidgetState extends State<NotificationSettingsWidget> {
  bool? switchListTileValue = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1E),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifications',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFF1C1C1E),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Choose what notifcations you want to recieve below and we will update the settings.',
                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: SwitchListTile.adaptive(
                      value: switchListTileValue ?? true,
                      onChanged: (newValue) => setState(() => switchListTileValue = newValue),
                      title: Text(
                        'Push Notifications',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                      subtitle: Text(
                        'Receive Push notifications from our application on a semi regular basis.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.of(context).tertiaryColor,
                      activeTrackColor: FlutterFlowTheme.of(context).primaryColor,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Save Changes',
                    options: FFButtonOptions(
                      width: 250,
                      height: 45,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                      disabledTextColor: Colors.white,
                      disabledColor: Colors.black,
                      splashColor: Colors.purple,
                    ),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
