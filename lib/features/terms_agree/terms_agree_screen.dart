import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/auth/auth_screen.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class TermsAgreeScreen extends StatefulWidget {
  const TermsAgreeScreen({super.key});

  @override
  State<TermsAgreeScreen> createState() => _TermsAgreeScreenState();
}

class _TermsAgreeScreenState extends State<TermsAgreeScreen> {
  bool agreeAll = false;
  bool termService = false;
  bool personalInfo = false;
  bool ageOver18 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            Expanded(
                child: Column(
              children: [
                Container(
                  width: 1.sw,
                  height: 0.5.sh,
                  color: Colors.amber,
                ),
                vertical(10),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (!agreeAll) {
                            widgetShowDialog(context,
                                title: "Terms  of Service",
                                agreeBtnCallback: () {
                              Navigator.pop(context);
                            });
                            widgetShowDialog(context,
                                title: "Personal Information",
                                agreeBtnCallback: () {
                              Navigator.pop(context);
                            });
                          }

                          setState(() {
                            agreeAll = !agreeAll;
                            ageOver18 = agreeAll;
                            termService = agreeAll;
                            personalInfo = agreeAll;
                          });
                        },
                        icon: Icon(
                          Icons.check_circle,
                          color: (ageOver18 && termService && personalInfo)
                              ? Colors.green
                              : colorGrey,
                        )),
                    ZimpleWidgets.zText("Agree All")
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (!termService) {
                            widgetShowDialog(context,
                                title: "Terms  of Service",
                                agreeBtnCallback: () {
                              Navigator.pop(context);
                            });
                          }

                          setState(() {
                            termService = !termService;
                          });
                        },
                        icon: Icon(
                          Icons.check,
                          color: termService ? Colors.blue : colorGrey,
                          size: 20,
                        )),
                    ZimpleWidgets.zText(
                        "[Required] Terms of Service Agreement.",
                        fontSize: FontSize.body)
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (!personalInfo) {
                            widgetShowDialog(context,
                                title: "Personal Information",
                                agreeBtnCallback: () {
                              Navigator.pop(context);
                            });
                          }

                          setState(() {
                            personalInfo = !personalInfo;
                          });
                        },
                        icon: Icon(
                          Icons.check,
                          color: personalInfo ? Colors.blue : colorGrey,
                          size: 20,
                        )),
                    Expanded(
                        child: ZimpleWidgets.zText(
                            "[Required] Personal Information Collection and Usage Agreement.",
                            fontSize: FontSize.body))
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            ageOver18 = !ageOver18;
                          });
                        },
                        icon: Icon(
                          Icons.check,
                          color: ageOver18 ? Colors.blue : colorGrey,
                          size: 20,
                        )),
                    ZimpleWidgets.zText("I am over 18 years old.",
                        fontSize: FontSize.body)
                  ],
                ),
              ],
            )),
            Center(
              child: ZimpleWidgets.zTextButton(
                "Agree to GetStarted",
                useBold: true,
                textColor: (ageOver18 && personalInfo && termService)
                    ? colorWhite
                    : null,
                backgroundColor: (ageOver18 && personalInfo && termService)
                    ? Colors.blue
                    : null,
                width: 1.sw * 0.8,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroApp1()));
                  if (ageOver18 && personalInfo && termService) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthenScreen()));
                  }
                },
              ),
            ),
            vertical(10)
          ],
        ),
      )),
    );
  }

  Future widgetShowDialog(
    contex, {
    required String title,
    required VoidCallback agreeBtnCallback,
  }) {
    return showDialog(
      barrierDismissible: false,
      useSafeArea: true,
      barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 45.h,
                  // color: Colors.amber,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: agreeBtnCallback,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ZimpleWidgets.zText(title),
                      )
                    ],
                  ),
                ),
                vertical(10),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: colorGrey,
                      borderRadius: BorderRadius.circular(20)),
                )),
                vertical(10),
                Center(
                  child: ZimpleWidgets.zTextButton(
                    "Agree",
                    width: 1.sw,
                    textColor: colorWhite,
                    fontSize: FontSize.title,
                    backgroundColor: Colors.blue,
                    onPressed: agreeBtnCallback,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
