import 'package:flutter/material.dart';

textFromFieldcustom({
  bool readOnly = false,
  passEnable = false,
  bool rtl = false,
  maxLines = 1,
  TextInputType keyboardType = TextInputType.name,
  length = false,
  double width = 120,
  required Function() onTap,
  required TextEditingController controller,
  required String text,
  double hight = 23,
  double padding = 10,
  double borderCirlcle = 10,
  Color bordercolor = const Color.fromARGB(99, 192, 192, 192),
  Color colorbackground = Colors.white,
}) {
  return SizedBox(
    width: width,
    child: TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      obscureText: passEnable,
      maxLines: maxLines,
      maxLength: length == true ? 250 : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '* يرجي ادخال البيانات';
        }
        return null;
      },
      controller: controller,
      style: const TextStyle(fontSize: 13),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: padding, vertical: hight),
          //active background Color
          filled: true,
          fillColor: colorbackground,
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(borderCirlcle)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderCirlcle),
            borderSide: BorderSide(
              color: bordercolor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderCirlcle),
            borderSide: BorderSide(
              color: bordercolor,
            ),
          ),
          // hintText: text,
          labelText: text,
          labelStyle: const TextStyle(fontSize: 12),
          // suffixIcon: prefixIcon != null ? prefixIcon : null,
          hintStyle: const TextStyle(fontSize: 13)),
      textAlign: rtl == true ? TextAlign.end : TextAlign.start,
    ),
  );
}
