import 'package:device_preview/device_preview.dart';

import 'package:flaury_mobile/app/config/appconfig.dart';
import 'package:flaury_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void maincommon(Appconfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ProviderScope(
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
    final color = config.satchcolor;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: color, statusBarIconBrightness: Brightness.light),
    );
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      onGenerateRoute: AppPages.ongenerateRoute,
    );
  }
}
