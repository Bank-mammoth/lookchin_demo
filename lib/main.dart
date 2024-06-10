import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/generated/l10n.dart';
import 'package:lookchin_app/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'langauge/view_models/langauge_provider.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langauge = ref.watch(languageProvider);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: const [Locale('en'), Locale('th')],
            locale: switch (langauge.name) {
              "en" => const Locale('en'),
              "th" => const Locale('th'),
              String() => throw UnimplementedError(),
            },
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
              
            ),
            // home: const MyHomePage(),
            // home: const SplashScreen(),
            routerConfig: ref.watch(appRouter),
          ),
        );
      },
    );
  }
}
