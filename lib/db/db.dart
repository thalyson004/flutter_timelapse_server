import 'dart:math';

import 'package:flutter/material.dart';

import '../models/camera.dart';
import '../widgets/camera_card.dart';

class DB extends ChangeNotifier {
  static final List<Camera> _cameras = [
    Camera(ip: "192.168.1.111"),
    //CameraCard(ip: "192.168.1.112"),
    Camera(ip: "192.168.1.113"),
  ];

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
