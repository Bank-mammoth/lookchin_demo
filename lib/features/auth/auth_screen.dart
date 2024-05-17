import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/features/auth/verify_screen.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

// class AuthenScreen extends StatefulWidget {
//   const AuthenScreen({super.key});

//   @override
//   State<AuthenScreen> createState() => _AuthenScreenState();
// }

// class _AuthenScreenState extends State<AuthenScreen> {

// }

class AuthenScreen extends ConsumerStatefulWidget {

  static const routeName = "authenscreen";

  const AuthenScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenScreenState();
}

class _AuthenScreenState extends ConsumerState<AuthenScreen> {
 final TextEditingController _phonNumber = TextEditingController();


  @override
  void dispose() {
    _phonNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // vertical(60),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.r),
            child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  ZimpleWidgets.zText("Let's verify your",
                  fontSize: FontSize.displaySmall, useBold: true),
              ZimpleWidgets.zText("Phone number",
                  fontSize: FontSize.displaySmall, useBold: true),
              ZimpleWidgets.zText("Your number is not shown to others"),
              ZimpleWidgets.zText("and is only used for verification"),
              vertical(30),
               TextField(
                controller: _phonNumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                  hintText: "Enter phone number",
                  prefixIcon: Icon(
                    Icons.circle,
                    size: 35,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    _phonNumber.text = value;
                  });
                },
              ),
              vertical(30),
              Center(
                child: ZimpleWidgets.zTextButton(
                  "Send code",
                  useBold: true,
                  height: 48.h,
                  width: 1.sw ,
                  textColor:  _phonNumber.text.length == 10 ? colorWhite : null,
                  backgroundColor: _phonNumber.text.length == 10 ? colorBlack : null,
                  onPressed: () {
                    if(_phonNumber.text.length == 10){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyScreen()));
                    }
                  },
                ),
              ),
              vertical(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: ZimpleWidgets.zText("Change phone number?",
                          useBold: true, fontSize: FontSize.body)),
                  ZimpleWidgets.zText("Find account by email.",
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
}