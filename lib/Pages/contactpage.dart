import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('contact'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Contact Page'),
              ElevatedButton(
                child: const Text("Return To Home"),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'homestack/home', (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ));
  }
}
