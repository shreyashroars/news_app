import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatefulWidget {
  final String? blogUrl;
  ArticleScreen({this.blogUrl});
  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Turbo', style: TextStyle(color: Colors.black)),
            Text(
              'News',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(
                  Icons.share,
                )),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
            initialUrl: widget.blogUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewcontroller) {
              _completer.complete(webviewcontroller);
            }),
      ),
    );
  }
}
