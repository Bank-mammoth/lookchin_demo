import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookchin_app/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.inputType,
    this.maxlength,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintMaxLines,
    this.readOnly,
    this.circular,
    this.noneborder,
    this.hintontSize,
    this.underLine,
    this.height,
    this.width,
    this.label,
    this.suffixText,
  });

  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextInputType? inputType;
  final int? maxlength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final int? hintMaxLines;
  final bool? readOnly;
  final double? circular;
  final bool? noneborder;
  final bool? underLine;
  final double? hintontSize;
  final double? height;
  final double? width;
  final String? label;
  final String? suffixText;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // ใช้งาน flutter_screenutil
      width: width??1.sw,
      child: TextField(
          readOnly: readOnly ?? false,
          controller: controller,
          keyboardType: inputType,
          maxLength: maxlength,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: hintontSize ?? FontSize.body, height: 1.h),
            hintMaxLines: hintMaxLines,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: useBorder(circular,noneborder,underLine),
            labelText: label,
            suffixText: suffixText,
            // border: noneborder != null
            //     ? InputBorder.none
            //     : OutlineInputBorder(
            //         borderRadius:
            //             BorderRadius.all(Radius.circular(circular ?? 15.r))),
            // enabledBorder: const OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            //   borderSide: BorderSide(color: Colors.grey),
            // ),
          ),
          onChanged: onChanged),
    );
  }

  InputBorder? useBorder(circular, noneborder, underLine) {
    if (underLine??false) {
      return null;
    }
    if(noneborder??false){
      return InputBorder.none;
    }
    return OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(circular ?? 15.r)));
  }
}
