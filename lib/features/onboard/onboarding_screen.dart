import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/pageview/pageview.dart';
import 'package:lookchin_app/features/onboard/widgets/choose_country.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class OnboarddingScreen extends StatelessWidget {
  const OnboarddingScreen({super.key});

  static const routeName = "onboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        title: ZimpleWidgets.zText("LookChin", useBold: true),
        backgroundColor: colorWhite,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                      width: 1.sw,
                      height: 0.45.sh,
                      child: Image.asset('images/lookchin.gif')),
                  vertical(80),
                  ZimpleWidgets.zText("Welcom to LookChin",
                      fontSize: FontSize.displaySmall, useBold: true),
                  ZimpleWidgets.zText("Experience decentralized secondhand"),
                  ZimpleWidgets.zText("markets that keep ypur data safe"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZimpleWidgets.zInkButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.circle),
                      horizontal(10),
                      ZimpleWidgets.zText("Thailand"),
                      const Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                  onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const BottonSheetChooseCountry(),
                  ),
                ),
              ],
            ),
            vertical(5),
            Center(
              child: ZimpleWidgets.zTextButton(
                "เริ่มต้นการใช้งาน",
                width: 1.sw * 0.8,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroApp1()));
               
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PageViewScreen()));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZimpleWidgets.zText("Have an account ?"),
                TextButton(
                    onPressed: () {},
                    child: ZimpleWidgets.zText("Log in",
                        useBold: true, fontSize: FontSize.titleSmall))
              ],
            ),
            vertical(20),
          ],
        ),
      ),
    );
  }
}
