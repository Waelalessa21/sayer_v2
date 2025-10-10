import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/routing/app_router.dart';
import 'package:sayer_app/common/theming/app_theme.dart';

class SayerApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;

  const SayerApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          supportedLocales: const [Locale('ar')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          title: "ساير",
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: initialRoute,
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          themeMode: ThemeMode.system,

          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
