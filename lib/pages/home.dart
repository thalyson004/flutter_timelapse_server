import 'package:flutter/material.dart';
import 'package:flutter_timelapse/widgets/mydrawer.dart';
import 'package:provider/provider.dart';

import '../db/db.dart';
import '../widgets/mybar.dart';

class Home extends StatefulWidget {
  static String route = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const MyBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        color: Colors.pink,
        child: Provider.of<DB>(context, listen: true).cameraCardsInRows,
      ),
    );
  }
}
