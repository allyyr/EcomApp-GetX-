import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      this.text = '',
      this.color = Colors.black,
      this.fontsize,
      this.fontWeight,
      this.alignment,
      this.height});
  final String? text;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Alignment? alignment;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        child: Text(
          text!,
          style: TextStyle(
              fontSize: fontsize,
              color: color,
              fontWeight: fontWeight,
              height: height),
        ));
  }
}
