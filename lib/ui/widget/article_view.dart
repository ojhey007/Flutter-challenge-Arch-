import 'package:flutter/material.dart';
import 'package:xflutter/ui/widget/app_bar.dart';
import 'package:xflutter/ui/widget/webview_renderer.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  const ArticleView({required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(20, 64),
          child: AppBarMenu(
            appTitle: "Flutter challenge(Arc) ",
          )),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebViewRenderer(
            initialUrl: widget.postUrl,
          )),
    );
  }
}
