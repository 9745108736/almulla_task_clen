import 'package:alimulla_task/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final dynamic onPressed;
  final double? width;
  final double? height;
  final double radius;
  final bool disabled;
  final bool isProgress;
  final Key? fieldKey;
  final double textSize;
  final Color? color;

  CustomButton(this.label,
      {Key? key,
      this.onPressed,
      this.disabled = false,
      this.width,
      this.isProgress = false,
      this.height,
      this.textSize = 16,
      this.radius = 6.0,
      this.fieldKey,
      this.color})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 40,
      width: widget.width ?? 140,
      child: MaterialButton(
          key: widget.fieldKey ?? widget.key,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(widget.radius),
          ),
          color: kGoodPurple,
          child: widget.isProgress
              ? buildLoader()
              : Text(widget.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.textSize,
                      fontWeight: FontWeight.w600)),
          onPressed: () async {
            widget.disabled ? null : await widget.onPressed();
          }),
    );
  }

  SizedBox buildLoader() {
    return SizedBox(
      height: 15,
      width: 15,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.black),
        strokeWidth: 2,
      ),
    );
  }
}
