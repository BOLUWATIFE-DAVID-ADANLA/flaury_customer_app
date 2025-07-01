import 'package:device_preview/device_preview.dart';

import 'package:flaury_mobile/app/config/appconfig.dart';
import 'package:flaury_mobile/app/routes/app_pages.dart';
import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/util/provider_logger.dart';

void maincommon(Appconfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ProviderScope(
        observers: [ProviderLogger()],
        child: MyApp(
          config: config,
        ),
      ),
    ),
  );
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}

class MyApp extends StatelessWidget {
  final Appconfig config;
  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final color = config.satchcolor ?? AppColors.primary;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.dark),
    );
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        scaffoldBackgroundColor: AppColors.background,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      onGenerateRoute: AppPages.ongenerateRoute,
    );
  }
}
