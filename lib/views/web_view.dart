import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key, required this.url});
  final String url;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {

 late final WebViewController controller;
  @override
  void initState() {
    
    super.initState();
    controller=WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
  ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
      ) ,
      body: WebViewWidget(controller: controller),
    );
  }
}