import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_note_taking_app/app.dart';
import 'package:simple_note_taking_app/core/logger.dart';
import 'package:simple_note_taking_app/injectable_config.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // init system chrome setting device orientation
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      // init injectable
      configureDependencies();
      // run app
      runApp(const MyApp());
    },
    (error, stackTrace) {
      LoggerApp.logger.e('Error Happen',
          time: DateTime.now(), error: error, stackTrace: stackTrace);
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String message) {
        // Disable print statements in release mode
        if (!kReleaseMode) {
          parent.print(zone, message);
        }
      },
    ),
  );
}
