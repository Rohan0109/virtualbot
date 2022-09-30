import 'dart:async';



import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'dart:io' show Platform;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  void initState() {
    try {} catch (e) {}
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF191B22),
      body:SafeArea(
        child:Column(
          mainAxisSize: MainAxisSize.max,

          children: [

            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                child: Text(
                  'APVA',
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
                  'Welcome to apiplatform virtual bot',
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
              alignment: AlignmentDirectional(0.1, 0.1),
              child: Image.network(
                ( 'https://apiplatform-io.herokuapp.com/assets/images/service/Student.png'),
                width: 500,
                height: 500,
                fit: BoxFit.scaleDown,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                            text: 'Go to Conversation',
                            options: FFButtonOptions(
                              elevation: 0,
                              height: 40,
                              color: Color(0xFFF2622E),
                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 10
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
                  Align(
                    alignment: AlignmentDirectional(0.15, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-0.2, -0.25),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF2622E),
                                  borderRadius: BorderRadius.circular(16),
                                ),

                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}




// ignore: must_be_immutable
class HomePageWidget extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Poppins', fontSize: 20.0);
  bool isGroupInProgress = false;

  String getPlatformName() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "iOS";
    } else {
      return "NOP";
    }
  }

  String getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  int getTimeStamp() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  void fetchUserDetails(String userid) {
    try {
      KommunicateFlutterPlugin.fetchUserDetails(userid).then((value) =>
          print("User details fetched: " + value));
    } on Exception catch (e) {
      print("Fetching user details error : " + e.toString());
    }
  }

  late String valueText;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter User ID'),
            content: TextField(
              onChanged: (value) {
                valueText = value;
                print(value);
              },
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  fetchUserDetails(valueText);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
/*onPressed: () {
                    KommunicateFlutterPlugin.openConversations();
                  },*/