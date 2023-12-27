
import 'package:flutter/material.dart';
import 'package:_6404800007/Pages/AboutPage.dart';
import 'package:_6404800007/Pages/CameraPage.dart';
import 'package:_6404800007/Pages/Companypage.dart';
import 'package:_6404800007/Pages/MapPage.dart';
import 'package:_6404800007/Pages/PicturePage.dart';
import 'package:_6404800007/Pages/contactpage.dart';
import 'package:_6404800007/Pages/hompage.dart';

class HomeStack extends StatefulWidget {
  const HomeStack({super.key});

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'homestack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'homestack/home':
            builder = (BuildContext context) => const homepage();
            break;
          case 'homestack/about':
            builder = (BuildContext context) => const aboutpage();
            break;
          case 'homestack/contact':
            builder = (BuildContext context) => const ContactPage();
            break;
          case 'homestack/company':
            builder = (BuildContext context) => const companypage();
            break;
          case 'homestack/camera':
            builder = (BuildContext context) => const CameraPage();
            break;
          case 'homestack/picture':
            builder = (BuildContext context) => const PicturePage();
            break;
          case 'homestack/map':
            builder = (BuildContext context) => const MapPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}
