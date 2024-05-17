import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.inputType,
      this.maxlength,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.readOnly,
      });

  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextInputType? inputType;
  final int? maxlength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: readOnly ?? false,
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: maxlength,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        onChanged: onChanged);
  }
}
