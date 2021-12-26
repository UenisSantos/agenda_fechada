import 'package:agenda_fechada/app/app_module.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
  
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) {
        return AppModule();
      }, // Wrap your app
    ),
  );
}
