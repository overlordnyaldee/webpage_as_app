import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'src/menu.dart'; // ADD
import 'src/navigation_controls.dart';
import 'src/web_view_stack.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    MaterialApp(
      home: const WebViewApp(),
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    var uri = 'https://flutter.dev';
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(uri),
      );
  }

  @override
  Widget build(BuildContext context) {
    const title = 'OMGWTF';
    return Scaffold(
      body: WebViewStack(controller: controller),
      persistentFooterButtons: [
        NavigationControls(controller: controller),
        // Menu(controller: controller), // ADD
        // Text(title),
      ],
    );
  }
}
