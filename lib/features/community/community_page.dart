import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/community/widgets/show_botton_Sheet.dart';
import 'package:lookchin_app/features/community/widgets/show_card_commu.dart';
import 'package:lookchin_app/features/community/widgets/show_categoly.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';
import 'package:badges/badges.dart' as badges;

class CommunitiesPage extends StatelessWidget {
  const CommunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ZimpleWidgets.arrowback(horizontal: 10),
                  const SearchBarCustom(),
                  horizontal(20),
                  GestureDetector(
                    onTap: () {
                      print('click');
                    },
                    child: badges.Badge(
                        position: BadgePosition.custom(end: 0),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          size: 30,
                        )),
                  )
                ],
              ),
            ),
            Container(
              width: 1.sw,
              height: 1.sh * 0.2,
              color: Colors.amber,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   isScrollControlled: true,
                      //   backgroundColor: Colors.transparent,
                      //   builder: (context) => const ShowBottonSheet(),
                      // );
                    },
                    child: const Text('บทความยอดนิยม')),
                horizontal(10),
                ElevatedButton(
                    onPressed: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   isScrollControlled: true,
                      //   backgroundColor: Colors.transparent,
                      //   builder: (context) => const ShowBottonSheet(),
                      // );
                    },
                    child: const Text('ล่าสุด')),
              ],
            ),
            // vertical(20),
            const ShowCategoly(),
            vertical(10),
            const Expanded(child:  ShowCardCommu()),
          ],
        ),
      ),
    );
  }
}
