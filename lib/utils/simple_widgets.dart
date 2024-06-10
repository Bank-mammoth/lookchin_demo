import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookchin_app/constants/constants.dart';

class ZimpleWidgets {
  static Widget arrowback(
      {VoidCallback? onTap, double? horizontal, Widget? icon}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontal ?? 20.0, vertical: 10),
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
                  child: icon ??
                      const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 20,
                      )),
            ),
          ), // The elevation of the card
        ),
      ),
    );
  }

  static Widget zContainer(
      {double? width,
      double? height,
      BoxConstraints? boxConstraints,
      Color? backgroundColor,
      Gradient? gradient,
      double borderRadius = 0,
      double sideWidth = 0,
      Color? sideColor,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BoxShape? boxShape,
      Clip clipBehavior = Clip.none,
      Widget? child}) {
    BorderRadiusGeometry? conner;
    if (borderRadius != 0) {
      conner = BorderRadius.circular(borderRadius);
    }
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      clipBehavior: clipBehavior,
      constraints: boxConstraints,
      decoration: BoxDecoration(
          color: backgroundColor,
          gradient: gradient,
          borderRadius: conner,
          border: Border.all(
              color: sideColor ?? const Color(0x000000ff), width: sideWidth),
          shape: boxShape ?? BoxShape.rectangle),
      child: child,
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
          fontSize: fontSize ?? FontSize.titleSmall,
          color: color ?? const Color(0xFF212123),
          fontFamily: fontFamily,
          fontWeight:
              fontWeight ?? (useBold ? FontWeight.bold : FontWeight.normal),
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
      double borderRadius = 20,
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

  static Widget zInkButton(
      {double? width,
      double? height,
      VoidCallback? onTap,
      double borderRadius = 8,
      Color? backgroundColor,
      Gradient? gradient,
      BoxShape? boxShape,
      EdgeInsetsGeometry? padding,
      Widget? child,
      double sideWidth = 0,
      Color? sideColor,
      MaterialStateProperty<Color?>? overlayColor}) {
    BorderRadius? conner;
    if (borderRadius != 0) {
      conner = BorderRadius.circular(borderRadius);
    }
    return InkWell(
      borderRadius: conner,
      onTap: onTap,
      // highlightColor: Color(0xFF4755FF),
      overlayColor: overlayColor,
      child: Ink(
        decoration: BoxDecoration(
            color: backgroundColor,
            gradient: gradient,
            borderRadius: conner,
            border: Border.all(
                color: sideColor ?? const Color(0xFFFFFFFF), width: sideWidth),
            shape: boxShape ?? BoxShape.rectangle),
        padding: padding,
        width: width,
        height: height,
        child: child,
      ),
    );
  }

  static Widget zSvgImage(String assetName,
      {double? width,
      double? height,
      BoxFit? boxFit,
      Color? color,
      BlendMode? blendMode,
      ColorFilter? colorFilter}) {
    return SvgPicture.asset(
      'images/svg/$assetName.svg',
      colorFilter: color == null
          ? colorFilter
          : ColorFilter.mode(color, blendMode ?? BlendMode.srcIn),
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.contain,
    );
  }

  static Future zShowDialogTwoButton({
    required context,
    Widget? icon,
    Color? backgroundColor,
    required String title,
    String? content,
    double? fontSize,
    double? contentfontSize,
    String? btCancelTitle,
    Color? btCancelbgColor,
    Color? btCancelTextColor,
    VoidCallback? onCancelPressed,
    String? btSaveTitle,
    Color? btSavebgColor,
    Color? btSaveTextColor,
    VoidCallback? onSavePressed,
    bool titleBold = false,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: backgroundColor ?? colorWhite,
        icon: icon??const Icon(Icons.info_outline_rounded,size: 60,color: colorBlack,),
        title: ZimpleWidgets.zText(title,fontSize: fontSize,textAlign: TextAlign.center,useBold: titleBold),
        content: content ==null ? null : ZimpleWidgets.zText(content,fontSize: contentfontSize ?? FontSize.title,textAlign: TextAlign.center,),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          ZimpleWidgets.zTextButton(
            btCancelTitle ?? "Cancel",
            width: 0.3.sw,
            height: 50.h,
            backgroundColor: btCancelbgColor ?? colorWhite,
            textColor: btCancelTextColor ?? colorBlack,
            onPressed: onCancelPressed ??
                () {
                  Navigator.pop(context);
                },
          ),
          ZimpleWidgets.zTextButton(
            btSaveTitle ?? "Save",
            width: 0.3.sw,
            height: 50.h,
            backgroundColor: btSavebgColor ?? colorBlack,
            textColor: btSaveTextColor ?? colorWhite,
            onPressed: onSavePressed ??
                () {
                  Navigator.pop(context);
                },
          ),
        ],
      ),
    );
  }

  static Future zShowDialogOneButton({
    required context,
    Widget? icon,
    Color? bgDialogColor,
    required String title,
    String? content,
    String? buttonTitle,
    Color? buttonbgColor,
    Color? buttonTextColor,
    double? buttonWidth,
    double? fontSize,
    VoidCallback? onPressed,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: bgDialogColor ?? colorWhite,
        icon: icon?? const Icon(Icons.info_outline,size: 60,),
        title: Center(child: ZimpleWidgets.zText(title,fontSize: fontSize,textAlign: TextAlign.center)),
        content: content == null? null: ZimpleWidgets.zText(content),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          ZimpleWidgets.zTextButton(
            buttonTitle ?? "ok",
            width: buttonWidth ?? 1.sw,
            height: 50.h,
            backgroundColor: buttonbgColor ?? colorBlack,
            textColor: buttonTextColor ?? colorWhite,
            onPressed: onPressed ??
                () {
                  Navigator.pop(context);
                },
          ),
        ],
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
  final String? hintText;
  final Widget? prefixIcons;
  const SearchBarCustom({
    super.key,
    this.readOnly = false,
    this.removeText,
    this.onTap,
    this.onChanged,
    this.textcontroller,
    this.hintText,
    this.prefixIcons,
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
        style: TextStyle(fontSize: FontSize.body),
        decoration: InputDecoration(
          hintText: widget.hintText ?? "Search...",
          hintStyle: TextStyle(fontSize: FontSize.body, height: 0.7.h),
          prefixIcon: widget.prefixIcons ??const Icon(Icons.search),
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
