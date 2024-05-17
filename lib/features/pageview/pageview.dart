import 'package:flutter/material.dart';
import 'package:lookchin_app/features/pageview/widgets/intro_app2.dart';
import 'package:lookchin_app/features/pageview/widgets/intro_app3.dart';
import 'package:lookchin_app/features/terms_agree/terms_agree_screen.dart';

import 'widgets/intro_app1.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          IntroApp1(
            onPressed: () {
              setState(() {
                _pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              });
            },
          ),
          IntroApp2(
            onBack: () => setState(() {
              _pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            }),
            onNext: () => setState(() {
              _pageController.animateToPage(2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            }),
          ),
          IntroApp3(
            onBack: () => setState(() {
              _pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            }),
            onNext: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsAgreeScreen())),
          ),
        ]);
  }
}
