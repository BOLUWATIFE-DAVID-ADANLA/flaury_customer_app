import 'package:flaury_mobile/config/appconfig.dart';
import 'package:flaury_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void maincommon(Appconfig config) async {
  runApp(const ProviderScope(child: MyApp()));
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (context, _) => MaterialApp(
        theme: ThemeData(fontFamily: 'Figtree'),
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initial,
        onGenerateRoute: AppPages.ongenerateRoute,
      ),
    );
  }
}
