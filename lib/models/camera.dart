import 'package:flutter_timelapse/api/api.dart';
import 'package:flutter_timelapse/widgets/camera_card.dart';

class Camera {
  String ip;

  Camera({required this.ip});

  get image => API.getImage(ip);

  get card => CameraCard(ip: ip);
}
