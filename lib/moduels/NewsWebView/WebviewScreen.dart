import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {

  late final String? url ;
  WebViewScreen(this.url);
  //final controller =WebViewController()..loadRequest(Uri.parse("https://flutter.dev"));

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(url!));
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller)
    );
  }
}
