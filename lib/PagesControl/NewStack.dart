
import 'package:flutter/material.dart';
import 'package:_6404800007/Pages/newpage.dart';
import 'package:_6404800007/Pages/webviewpage.dart';

class NewsStack extends StatefulWidget {
  const NewsStack({super.key});

  @override
  State<NewsStack> createState() => _NewsStackState();
}

class _NewsStackState extends State<NewsStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'newsStack/news',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'newsStack/news':
            builder = (BuildContext context) => const NewsPage();
            break;
          case 'newsStack/webview':
            builder = (BuildContext context) => const WebviewPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}
