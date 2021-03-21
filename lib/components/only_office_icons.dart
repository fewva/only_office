import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnlyIcons {

  OnlyIcons._();

  static const String docx = 'assets/icons/docx.svg';
  static const String file = 'assets/icons/file.svg';
  static const String mp4 = 'assets/icons/mp4.svg';
  static const String pptx = 'assets/icons/pptx.svg';
  static const String xls = 'assets/icons/xls.svg';
  static const String xlsx = 'assets/icons/xlsx.svg';
  
}

class OnlyIcon extends StatelessWidget {

  final Color color;
  final double height;
  final double width;
  final String icon;

  OnlyIcon(
    {
      this.color,
      this.height,
      this.icon,
      this.width
    }
  );

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: color,
      height: height,
      width: width,
    );
  }
}