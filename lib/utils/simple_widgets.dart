import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';

class ZimpleWidgets {
  static Widget arrowback({VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
        onTap: onTap,
        child: Card(
          shape: const CircleBorder(
              side: BorderSide(color: Colors.transparent, width: 0)),
          elevation: 2.0,
          child: ClipOval(
            child: Container(
              color: Colors.grey[300],
              height: 35.0,
              width: 35.0,
              child: Padding(
                  padding: EdgeInsets.only(right: 5.0.sp),
                  child: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 20,
                  )),
            ),
          ), // The elevation of the card
        ),
      ),
    );
  }

  static Widget zText(
    String text, {
    Color? color,
    bool useBold = false,
    double? letterSpacing = 0,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    TextAlign? textAlign,
    double? height,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          height: height,
          fontSize: fontSize ?? FontSize.body,
          color: color ?? const Color(0xFF212123),
          fontFamily: fontFamily,
          fontWeight: fontWeight ?? (useBold ? FontWeight.bold : FontWeight.normal),
          letterSpacing: letterSpacing),
    );
  }

  static Widget zTextButton(String text,
      {VoidCallback? onPressed,
      double? width,
      double? height,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      Color? backgroundColor,
      Color? textColor,
      String? fontFamily,
      double borderRadius = 8,
      double fontSize = 15,
      double? textHeight,
      FontWeight? fontWeight,
      TextAlign? textAlign,
      double sideWidth = 0,
      Color? sideColor,
      bool useBold = false,
      double? letterSpacing = 0}) {
    Color backColor = backgroundColor ?? backgroundGrey;
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(padding),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(width: sideWidth, color: sideColor ?? backColor),
          )),
          backgroundColor: MaterialStateProperty.all(backColor),
        ),
        child: zText(text,
            color: textColor,
            textAlign: textAlign,
            fontSize: fontSize,
            useBold: useBold,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing),
      ),
    );
  }
}

class SearchBarCustom extends ConsumerStatefulWidget {
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool? readOnly;
  final VoidCallback? removeText;
  final TextEditingController? textcontroller;
  const SearchBarCustom({
    super.key,
    this.readOnly = false,
    this.removeText,
    this.onTap,
    this.onChanged,
    this.textcontroller,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchBarCustomState();
}

class _SearchBarCustomState extends ConsumerState<SearchBarCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h, // ใช้งาน flutter_screenutil
      width: 1.sw * 0.7,
      child: TextField(
        controller: widget.textcontroller,
        onTap: widget.onTap,
        readOnly: widget.readOnly ?? false,
        textAlignVertical: TextAlignVertical.center, // จัดกึ่งกลางแนวตั้ง
        textAlign: TextAlign.start, // จัดซ้ายแนวนอน
        style: TextStyle(fontSize: FontSize.title),
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(fontSize: FontSize.bodySmall, height: 0.7.h),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: widget.removeText != null
              ? GestureDetector(
                  onTap: widget.removeText,
                  child: Icon(
                    Icons.cancel,
                    size: 17.sp,
                  ))
              : null,
          filled: true, // Set this to true to enable the fillColor
          fillColor: backgroundGrey,
          contentPadding:
              EdgeInsets.symmetric(vertical: 11.h), // ตั้งค่า padding ตรงกลาง
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white),
            // ขอบสีขาว
            // หรือถ้าต้องการให้ไม่มีขอบเลยใช้
            // borderSide: BorderSide(color: Colors.transparent),
          ),
          // สำหรับสถานะที่ TextFormField ได้รับโฟกัส
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(20)),
          //   borderSide: BorderSide(color: Colors.white), // ขอบสีขาว
          //   // หรือถ้าต้องการให้ไม่มีขอบเลยใช้
          //   // borderSide: BorderSide(color: Colors.transparent),
          // ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
