import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_widgets.dart';




import 'AppConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Color(0xFF191B22),
        body:
        LoginPage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController userId = new TextEditingController();
  TextEditingController password = new TextEditingController();

/*  void loginUser(context) {
    dynamic user = {
      'userId':"user",

      'password': "password",
      'appId': AppConfig.APP_ID
    };
    log("USER....ID",error: userId);
    KommunicateFlutterPlugin.login(user).then((result) {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      print("Login successful : " + result.toString());
    }).catchError((error) {
      print("Login failed : " + error.toString());
    });
  }*/

/*  void loginAsVisitor(context) {
    KommunicateFlutterPlugin.loginAsVisitor(AppConfig.APP_ID).then((result) {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      print("Login as visitor successful : " + result.toString());
    }).catchError((error) {
      print("Login as visitor failed : " + error.toString());
    });
  }
*/
  void buildConversation() {
    dynamic conversationObject = {'appId': AppConfig.APP_ID,
      'isSingleConversation': false};

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((result) {
      print("Conversation builder success : " + result.toString());
    }).catchError((error) {
      print("Conversation builder error occurred : " + error.toString());
    });
  }

/*  void buildConversationWithPreChat(context) {
    try {
      KommunicateFlutterPlugin.isLoggedIn().then((value) {
        print("Logged in : " + value.toString());
        if (value) {
          KommunicateFlutterPlugin.buildConversation(
              {'isSingleConversation': false, 'appId': AppConfig.APP_ID})
              .then((result) {
            print("Conversation builder success : " + result.toString());
          }).catchError((error) {
            print("Conversation builder error occurred : " + error.toString());
          });
        }
      });
    } on Exception catch (e) {
      print("isLogged in error : " + e.toString());
    }
  }
*/
  @override
  Widget build(BuildContext context) {

  /*  try {
      KommunicateFlutterPlugin.isLoggedIn().then((value) {
        print("Logged in : " + value.toString());
        if (value) {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      });
    } on Exception catch (e) {
      print("isLogged in error : " + e.toString());
    }*/

    return SingleChildScrollView(

      child:SafeArea(
        child:Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
              child: Text(
                'HAIVA',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Noto Serif',
                  color: Color(0xFFF2622E),
                  fontSize: 60,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 100, 0),
              child: Text(
                'Hey  I am Hyper Automation Intelligent Virtual Agent',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).title3.override(
                  fontFamily: 'Poppins',
                  color:
                  FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, -0.05),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.1, 0.1),
                    child: Image.network(
                      ( 'https://apiplatform-io.herokuapp.com/assets/images/service/Student.png'),
                      width: 500,
                      height: 500,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2622E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.05, 0.15),
                          child: FFButtonWidget(
                            onPressed: () {
                              buildConversation();
                            },
                            text: '   Get Started',
                            options: FFButtonOptions(
                              elevation: 0,
                              height: 40,
                              color: Color(0xFFF2622E),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
//buildConversationWithPreChat(context);