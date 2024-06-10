import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/simple_widgets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const routeName = "splashScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    checkLogin().then((value) {
      if (value!) {
        Future.delayed(const Duration(milliseconds: 3200), () {
          context.go("/tab/home");
        });
      } else {
        Future.delayed(const Duration(milliseconds: 3200), () {
          context.go("/onboard");
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZimpleWidgets.zText('LOOKCHIN', fontSize: FontSize.display),
            Image.asset('images/lookchin.gif'),
          ],
        ),
      ),
    ));
  }

  Future<bool?> checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool logedin = prefs.getBool(Preference.loggedin) ?? false;
    return logedin;
  }
}
