import 'package:alimulla_task/core/utils/colors.dart';
import 'package:alimulla_task/features/home/presentation/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SCSnackBar {
  static show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: DemoRobotoTextWidget(
      text: message,
    ),backgroundColor: kGoodPurple,));
  }
}
