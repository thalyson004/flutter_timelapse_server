import 'package:flutter/material.dart';
import 'package:flutter_timelapse/widgets/camera_card.dart';

class Home extends StatefulWidget {
  static String route = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CameraCard> cameras = [];

  @override
  void initState() {
    //TODO: build the camera cards
    cameras = [
      CameraCard(ip: "192.168.1.111"),
      //CameraCard(ip: "192.168.1.112"),
      CameraCard(ip: "192.168.1.113"),
      CameraCard(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: Column(
            children: const [
              Text("Home"),
              Text("Add camera"),
              Text("Sobre"),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Center(child: Text("TimeLapse App")),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.pink,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: cameras,
            )
          ],
        ),
      ),
    );
  }
}
