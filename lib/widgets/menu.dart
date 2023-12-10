import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: Text(
          //     'Drawer Header',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24,
          //     ),
          //   ),
          // ),
          const UserAccountsDrawerHeader(
            currentAccountPicture: Icon(Icons.face),
            accountName: Text('Uttapol  Yompuay'),
            accountEmail: Text('kirby2253@gmail.com'),
            otherAccountsPictures: [
              Icon(Icons.bookmark_border),
            ],
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Image/Snow.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: ModalRoute.of(context)?.settings.name == 'homestack/home'
            ? true
            : false,
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/homestack', (route) => false);
            },
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits_outlined),
            title: const Text('Product'),
            selected: ModalRoute.of(context)?.settings.name == 'porductstack/product'
            ? true
            : false,
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/productstack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('New'),
            selected: ModalRoute.of(context)?.settings.name == 'newsStack/news'
            ? true
            : false,
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/newsStack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.sports_soccer),
            title: Text('Premier League Teams'),
            selected: ModalRoute.of(context)?.settings.name == 'premierStack/team'
            ? true
            : false,
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/premierStack', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
