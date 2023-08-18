import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRenderer extends StatefulWidget {
  final initialUrl;
  const WebViewRenderer({Key? key, required this.initialUrl}) : super(key: key);

  @override
  State<WebViewRenderer> createState() => _WebViewRendererState();
}

class _WebViewRendererState extends State<WebViewRenderer> {
  var loadingPercentage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: widget.initialUrl,
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 20;
            });
          },
          onProgress: (progess) {
            setState(() {
              loadingPercentage = progess;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
        if (loadingPercentage < 100)
          Center(
            child: CircularProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
          )
      ],
    );
  }
}
