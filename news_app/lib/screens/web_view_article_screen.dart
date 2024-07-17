import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewArticleScreen extends StatefulWidget {
  const WebViewArticleScreen({super.key, required this.articleUrl});
  final String articleUrl;

  @override
  State<WebViewArticleScreen> createState() => _WebViewArticleScreenState();
}

class _WebViewArticleScreenState extends State<WebViewArticleScreen> {
  var _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.articleUrl))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          WebViewWidget(
            controller: _controller,
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
