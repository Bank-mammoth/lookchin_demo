import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';
import 'package:lookchin_app/utils/custom_textfield.dart';
import 'package:lookchin_app/utils/simple_widgets.dart';

class ProfileDetailScreen extends StatelessWidget {
  static const routeName = "profiledetail";

  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ZimpleWidgets.zText("Profile Setting"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.sp),
                alignment: Alignment.center,
                child: Badge(
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
              ),
              vertical(20),
              _rowCustom(
                label: "Nickname",
                hintText: "name",
                ontap: () {},
              ),
              vertical(20),
              _rowCustom(
                label: "Phone number",
                hintText: "phone",
                ontap: () {},
              ),
              vertical(20),
              _rowCustom(
                label: "Email",
                hintText: "email",
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _rowCustom(
      {required String label,
      required String hintText,
      required VoidCallback ontap}) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            width: 1.sw,
            hintText: hintText,
            underLine: true,
            label: label,
          ),
        ),
        GestureDetector(onTap: ontap, child: ZimpleWidgets.zText("Edit"))
      ],
    );
  }
}
