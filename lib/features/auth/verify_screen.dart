import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/register_profile/register_profile_screen.dart';
import 'package:lookchin_app/utils/custom_textfield.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class VerifyScreen extends StatefulWidget {
//   const VerifyScreen({super.key});

//   @override
//   State<VerifyScreen> createState() => _AuthenScreenState();
// }

// class _AuthenScreenState extends State<VerifyScreen> {

// }

class VerifyScreen extends ConsumerStatefulWidget {
  const VerifyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends ConsumerState<VerifyScreen> {
  late int otp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vertical(30),
                  const CustomTextField(
                    readOnly: true,
                    inputType: TextInputType.number,
                    hintText: "0887654321",
                    prefixIcon: Icon(Icons.circle, size: 35),
                  ),
                  vertical(10),
                  TextField(
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter code",
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("04:29"),
                          horizontal(10),
                          TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade200)),
                              onPressed: () {},
                              child: Center(
                                  child:
                                      ZimpleWidgets.zText("send code again"))),
                          horizontal(10),
                        ],
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        otp = value.length;
                      });
                    },
                  ),
                  vertical(20),
                  Center(
                    child: ZimpleWidgets.zTextButton(
                      "Agree to get started",
                      useBold: true,
                      height: 48.h,
                      width: 1.sw,
                      textColor: otp == 4 ? colorWhite : null,
                      backgroundColor: otp == 4 ? colorBlack : null,
                      onPressed: () {
                        if (otp == 4) {
                          setLogin(context);

                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const RegisterProfileScreen()),
                          //     (Route<dynamic> route) => false);
                        }
                      },
                    ),
                  ),
                  vertical(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ZimpleWidgets.zText("Terms of Use and Privacy Policy",
                          fontSize: FontSize.body),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setLogin(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(Preference.loggedin, true);

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const RegisterProfileScreen()));
  }
}
