import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';



class WebViewStack extends StatefulWidget {
  const WebViewStack({required this.controller, super.key});

  final Completer<WebViewController> controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;



  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        WebView(

          initialUrl: 'https://servicesv2.apiplatform.io/chatbot',

       // userAgent:"ngrok-skip-browser-warning",
          onWebViewCreated: (webViewController) {
            widget.controller.complete(webViewController);
          },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });

          },
          javascriptMode: JavascriptMode.unrestricted,

        ),
        /*if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),*/
      ],
    );
  }
}