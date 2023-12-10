import 'package:flutter/material.dart';

class aboutpage extends StatefulWidget {
  const aboutpage({super.key});

  @override
  State<aboutpage> createState() => _aboutpageState();
}

class _aboutpageState extends State<aboutpage> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> company =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
        appBar: AppBar(
          title: const Text('AbountPage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('About Page'),
              const Padding(padding: EdgeInsets.only(top: 30)),
              Text('Email ${company['Email']}'),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Text('Telephone : ${company['Phone']}'),
              const Divider(),
              ElevatedButton(
                child: const Text("Return To Home"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text("Contact Me"),
                onPressed: () {
                  Navigator.pushNamed(context, 'homestack/contact');
                },
              )
            ],
          ),
        ));
  }
}
