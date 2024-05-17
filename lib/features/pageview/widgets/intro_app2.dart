import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class IntroApp2 extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  const IntroApp2({super.key, required this.onNext, required this.onBack});

  static const routeName = 'introapp1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back_ios)),
            Center(
              child: Column(
                children: [
                  ZimpleWidgets.zText("What about",
                      fontSize: FontSize.displaySmall, useBold: true),
                  ZimpleWidgets.zText(" \" Near Me \" ",
                      fontSize: FontSize.displaySmall, useBold: true),
                  Container(
                    width: 1.sw,
                    height: 0.45.sh,
                    color: Colors.amber,
                  ),
                  vertical(20),
                  const Divider(
                    indent: 150,
                    endIndent: 150,
                    thickness: 10,
                  ),
                  vertical(10),
                  ZimpleWidgets.zText(
                    "Experience decentralized secondhand",
                    fontSize: FontSize.body,
                  ),
                  ZimpleWidgets.zText(
                    "markets that keep your data safe",
                    fontSize: FontSize.body,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: ZimpleWidgets.zTextButton(
                "ต่อไป",
                width: 1.sw * 0.2,
                onPressed: onNext
              ),
            ),
            vertical(10),
          ],
        ),
      ),
    );
  }
}
