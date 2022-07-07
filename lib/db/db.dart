import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/camera.dart';
import '../widgets/camera_card.dart';

class DB extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final List<Camera> _cameras = [
    // Camera(ip: "192.168.1.111"),
    // CameraCard(ip: "192.168.1.112"),
    // Camera(ip: "192.168.1.113"),
  ];

  Future<String> getServerIp() async {
    final SharedPreferences prefs = await _prefs;
    String serverIp = prefs.getString("serverIp") ?? "";
    return serverIp;
  }

  Future<void> setServerIp(String ip) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("serverIp", ip);
  }

  List<Camera> get cameras => _cameras;

  List<CameraCard> get cameraCards {
    List<CameraCard> cards = [];
    for (Camera c in _cameras) {
      cards.add(c.card);
    }
    return cards;
  }

  Widget get cameraCardsInRows {
    List<Widget> rows = [];

    for (int i = 0; i < cameraCards.length; i += 3) {
      int j = min(cameraCards.length, i + 3);
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: cameraCards.sublist(i, j),
        ),
      );
    }

    return ListView(
      children: rows,
    );
  }

  void addCamera(String ip) {
    _cameras.add(Camera(ip: ip));
    notifyListeners();
  }
}
