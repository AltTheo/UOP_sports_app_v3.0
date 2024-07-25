import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uop_sports_v3/env.dart';
import 'package:uop_sports_v3/navigation/global_key.dart';
import 'package:uop_sports_v3/navigation/uop_bottom_nav.dart';
import 'package:uop_sports_v3/utils/provider/refresh_screen.dart';
import 'package:uop_sports_v3/utils/provider/time_slot_provider.dart';
import 'package:uop_sports_v3/utils/theme/theme.dart';

class UopSportApp extends StatelessWidget {
  const UopSportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RefreshProvider()),
        ChangeNotifierProvider(create: (_) => TimeSlotProvider()),
      ],
      child: MaterialApp(
        theme: AppTheme.androidLightTheme,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: Appconfig.debugBanner,
        home: const UopBottomNavBar(),
      ),
    );
  }
}
