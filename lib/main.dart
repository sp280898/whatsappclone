import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/whatsapp_home.dart';
// import 'package:flutterwhatsapp/whatsapp_home.dart';

List<CameraDescription>? cameras;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp",
      theme: ThemeData(
        primaryColor: const Color(0xff075E54),
        // accentColor: new Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,
      home: WhatsAppHome(cameras: cameras!),
    );
  }
}
