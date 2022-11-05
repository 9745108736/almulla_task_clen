import 'package:flutter/material.dart';

Widget TextFieldWidget({String? placeholder, int? minLine}) {
  return TextField(
    maxLines: null,
    minLines: minLine ?? 1,
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      counterText: '',
      errorMaxLines: 3,
      hintText: placeholder ?? "Message",
      // prefixIcon: widget.prefixIcon,
      // suffixIcon: widget.suffixIcon,
      // hintText: widget.hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      disabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 10.0,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        letterSpacing: 1.2,
      ),
    ),
  );
}
