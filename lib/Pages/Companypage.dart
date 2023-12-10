import 'package:flutter/material.dart';

class companypage extends StatefulWidget {
  const companypage({super.key});

  @override
  State<companypage> createState() => _companypageState();
}

class _companypageState extends State<companypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Company Page'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/Image/Arknights.jpg"),
                fit: BoxFit.cover,
              ),
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rhodes Island",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Text(
                        "The most advanced Infected research institution in the world, Rhodes Island is not afraid to employ the Infected. They are known to go deep into hazardous areas to take care of issues related to the Infected. They are currently working with many governments, corporations, and NGOs to uncover the causes of an Infected riot on an unprecedented scale. Your decisions will have a significant impact on how Rhodes Island will proceed."),
                    Divider(),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.phone_android,
                              color: Colors.orangeAccent,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [Text("Uttapol Yompuay")],
                            ),
                            Row(
                              children: [Text("0647501457")],
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                          6,
                          (index) => Chip(
                                label: Text("label ${index + 1}"),
                                avatar: Icon(Icons.star),
                                backgroundColor: Colors.orangeAccent,
                              )),
                    ),
                    Divider(),
                    BuilderRowFooter(),
                    Divider(),
                    BuilderRowFooter(),
                  ],
                ),
              ))
            ],
          ),
        ));
  }

  Row BuilderRowFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/Image/Amiya.jpg"),
          radius: 40,
        ),
        SizedBox(
          width: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.access_alarm),
              Icon(Icons.accessibility),
              Icon(Icons.account_balance),
            ],
          ),
        )
      ],
    );
  }
}
