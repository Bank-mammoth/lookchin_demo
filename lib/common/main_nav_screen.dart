import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/community/community_page.dart';
import '../features/home/views/home_page.dart';
import '../features/infomation/information_page.dart';
import '../features/near_me/nearme_page.dart';
import '../features/profile/profile_page.dart';
import '../utils/util.dart';

part '../common/widgets/nav_tab.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key, required this.tab});

  final String tab;
  static const routeName = "mainNavScreen";

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  final List<String> _tabs = [
    "home",
    // "communities",
    // "nearme",
    "informations",
    "profile",
  ];

  late int _currentIndex = _tabs.indexOf(widget.tab);

  final List<Widget> _pages = const [
    MyHomePage(),
    // CommunitiesPage(),
    // NearMePage(),
    InformationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildCustomTabbar()),
    );
  }

  Widget _buildCustomTabbar() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
            bottom: -100,
            child: Container(
              width: 1.sw,
              height: 200.h,
              color: Colors.white,
            )),
        Positioned.fill(
            child: Padding(
          padding: EdgeInsets.only(
              bottom: Util.sizeByPlatform(android: 77, ios: 60)),
          child: _pages[_currentIndex],
        )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(14),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 10,
                  offset: Offset(-1, -4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildBotton(
                    currentIndex: _currentIndex,
                    activeIndex: 0,
                    ontap: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    icon: Icons.home),
                // BuildBotton(
                //     currentIndex: _currentIndex,
                //     activeIndex: 1,
                //     ontap: () {
                //       setState(() {
                //         _currentIndex = 1;
                //       });
                //     },
                //     icon: Icons.groups),
                // BuildBotton(
                //     currentIndex: _currentIndex,
                //     activeIndex: 2,
                //     ontap: () {
                //       setState(() {
                //         _currentIndex = 2;
                //       });
                //     },
                //     icon: Icons.location_on),
                BuildBotton(
                    currentIndex: _currentIndex,
                    activeIndex: 1,
                    ontap: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    icon: Icons.newspaper_rounded),
                BuildBotton(
                    currentIndex: _currentIndex,
                    activeIndex: 2,
                    ontap: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    icon: Icons.perm_identity_sharp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
