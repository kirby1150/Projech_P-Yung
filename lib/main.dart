import 'package:flutter/material.dart';
import 'package:uttapol_6404800007/PagesControl/HomeStack.dart';
import 'package:uttapol_6404800007/PagesControl/NewStack.dart';
import 'package:uttapol_6404800007/PagesControl/PremierStack.dart';
import 'package:uttapol_6404800007/PagesControl/ProductStack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const homepage(title: 'Flutter Demo Home Page'),
      initialRoute: '/homestack',
      routes: {
        '/homestack': (context) => const HomeStack(),
        '/productstack': (context) => const ProductStack(),
        '/newsStack':(context) => const NewsStack(),
        '/premierStack':(context) => const PremierStack()
      },
    );
  }
}