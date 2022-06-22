import 'package:flutter/material.dart';
import 'package:flutter_timelapse/pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.route: (context) => const Home(),
      },
      initialRoute: Home.route,
    );
  }
}
