import 'package:flutter_timelapse/api/api.dart';

class Camera {
  String ip;

  Camera({required this.ip});

  get image => API.getImage(ip);
}
