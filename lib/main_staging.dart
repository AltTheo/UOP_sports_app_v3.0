import 'package:flutter/material.dart';
import 'package:uop_sports_v3/app.dart';
import 'package:uop_sports_v3/env.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Appconfig.setupEnv(Environment.staging);
  runApp(const UopSportApp());
}
