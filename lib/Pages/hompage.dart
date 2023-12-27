
import 'package:_6404800007/widgets/menu.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Menu(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("HomePage"),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Image/BG.png"),
                    fit: BoxFit.fill)),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "homestack/company");
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.business, size: 80, color: Colors.blue),
                          Text(
                            "Company",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "homestack/map");
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map, size: 80, color: Colors.blue),
                          Text(
                            "Map",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'homestack/camera');
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera, size: 80, color: Colors.blue),
                          Text(
                            "Camera",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "homestack/about", arguments: {
                      'Email': 'kirby2253@gmail.com',
                      'Phone': '0647501457'
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, size: 80, color: Colors.blue),
                          Text(
                            "About Me",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                ),
              ],
            )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
