import 'package:flutter/material.dart';
import 'package:flutter_timelapse/app.dart';
import 'package:provider/provider.dart';

import 'db/db.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DB(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
