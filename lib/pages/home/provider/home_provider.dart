import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class HomeProvider extends ChangeNotifier {
  String baseUrl = "http://flutter.dev";
  late WebViewController webViewController;
  bool canBack = false;

  HomeProvider() {
    webViewController = WebViewController.fromPlatformCreationParams(
      initWVParams(),
    );

    webViewController
      ..loadRequest(
        Uri.parse(baseUrl),
      )
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      );
  }

  initWVParams() {
    var params;

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }

    return params;
  }
}
