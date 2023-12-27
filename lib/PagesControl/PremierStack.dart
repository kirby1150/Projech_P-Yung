import 'package:flutter/material.dart';
import 'package:_6404800007/Pages/PremierDetail.dart';
import 'package:_6404800007/Pages/PremierTeam.dart';

class PremierStack extends StatefulWidget {
  const PremierStack({super.key});

  @override
  State<PremierStack> createState() => _PremierStackState();
}

class _PremierStackState extends State<PremierStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'premierStack/team',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'premierStack/team':
            builder = (BuildContext context) => const PremierTeamPage();
            break;
          case 'premierStack/detail':
            builder = (BuildContext context) => const PremierDetail();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}