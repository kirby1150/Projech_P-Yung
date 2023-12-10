import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  String footername = "Comsci@Siam";

  void _ChangeFooterName() {
    setState(() {
      footername = "Artchi@Siam";
    });
  }

  void initStat() {
    super.initState();
    print("init Footer");
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(footername),
      ElevatedButton(onPressed: _ChangeFooterName, child: const Text('Clicked Me'))
    ]);
  }
}
