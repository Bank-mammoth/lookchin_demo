import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/register_profile/recommend_screen.dart';
import 'package:lookchin_app/utils/custom_textfield.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class RegisterProfileScreen extends StatelessWidget {
  const RegisterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: SafeArea(
            child: Column(
          children: [
            vertical(20),
            Center(
              child: ZimpleWidgets.zText("Profile Setting"),
            ),
            vertical(30),
            Badge(
              backgroundColor: Colors.grey,
              largeSize: 32,
              label: GestureDetector(
                  onTap: () {
                    debugPrint("Cliock to add image Profile");
                  },
                  child: const Icon(Icons.add)),
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 60.r,
              ),
            ),
            vertical(30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextField(
                    hintText: "Enter your nickname",
                  ),
                  vertical(10),
                  ZimpleWidgets.zText(
                      "enter your profile picture and nickname."),
                  ZimpleWidgets.zText(
                      "You can only change name once in 30 days."),
                  vertical(20),
                  SizedBox(
                    height: 0.05.sh,
                    width: 1.sw,
                    child: ZimpleWidgets.zTextButton('Save', onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => showDialogV1(context),
                         );
                    }, backgroundColor: colorBlack, textColor: colorWhite),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  AlertDialog showDialogV1(context) {
    return AlertDialog(
      backgroundColor: colorWhite,
      icon: Icon(
        Icons.info_outline,
        size: 60.r,
      ),
      title: ZimpleWidgets.zText(
          "You can only change name once in \n 30 days. Change name ?"),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ZimpleWidgets.zTextButton(
          "Cancel",
          width: 100.w,
          height: 50.h,
          backgroundColor: colorWhite,
          textColor: colorBlack,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ZimpleWidgets.zTextButton(
          "Save",
          width: 100.w,
          height: 50.h,
          backgroundColor: colorBlack,
          textColor: colorWhite,
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const RecommendeScreen()));
          },
        ),
      ],
    );
  }
}
