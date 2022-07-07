import 'package:flutter/material.dart';
import 'package:flutter_timelapse/pages/add.dart';

import '../pages/about.dart';
import '../pages/login.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: SafeArea(
          child: Column(
            children: [
              DrawerTile(
                  text: "Home",
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
              DrawerTile(
                  text: "Add camera",
                  onTap: () {
                    showAdd(context);
                  }),
              DrawerTile(
                  text: "About",
                  onTap: () {
                    showAbout(context);
                  }),
              DrawerTile(
                  text: "Logout",
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Login.route);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const DrawerTile({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        onTap: onTap,
      ),
    );
  }
}
