import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uop_sports_v3/auth/uop_welcome.dart';
import 'package:uop_sports_v3/app_env.dart';
import 'package:uop_sports_v3/navigation/global_key.dart';
import 'package:uop_sports_v3/navigation/uop_bottom_nav.dart';
import 'package:uop_sports_v3/utils/provider/refresh_screen.dart';
import 'package:uop_sports_v3/utils/provider/theme_provider.dart';
import 'package:uop_sports_v3/utils/provider/time_slot_provider.dart';
import 'package:uop_sports_v3/utils/theme/theme.dart';

class UopSportApp extends StatelessWidget {
  const UopSportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RefreshProvider()),
        ChangeNotifierProvider(create: (context) => TimeSlotProvider()),
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()), // Add ThemeProvider
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.isDarkTheme
                ? AppTheme.appDarkTheme
                : AppTheme.appLightTheme,
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: Appconfig.debugBanner,
            home: const UopBottomNavBar(),
          );
        },
      ),
    );
  }
}
