import 'dart:io';

import 'package:binnima/pages/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      builder: (context, snapshot) {
        return Consumer<HomeProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              body: SafeArea(
                child: WebViewWidget(
                  controller: provider.webViewController,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
