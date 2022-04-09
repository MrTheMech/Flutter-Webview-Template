// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MyApp> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercemur',
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          String url = await controller.currentUrl().toString();
          if (url == "https://mercemur.io/login") {
            return true;
          } else {
            controller.goBack();
            return false;
          }
        },
        child: Scaffold(
          appBar: null,
          body: SafeArea(
              child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://mercemur.io/login',
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            /*onPageStarted: (url) {
            print('New Website: $url');
          },*/
          )),
        ),
      ),
    );
  }
}
