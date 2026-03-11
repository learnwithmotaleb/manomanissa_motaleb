import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/basic_import.dart';
class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.textAlign,
    this.textOverflow,
    this.padding = EdgeInsets.zero,
    this.opacity = 1.0,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.style,
    this.onTap,
    this.isLoading,
  });

  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final EdgeInsetsGeometry padding;
  final double opacity;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? style;
  final VoidCallback? onTap;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Opacity(
        opacity: opacity,
        child: Padding(
          padding: padding,
          child: Text(
            text.tr,
            textAlign: textAlign,
            overflow: textOverflow,
            maxLines: maxLines,
            style: GoogleFonts.montserrat(
              color: color ?? CustomColors.whiteColor,
              fontSize: fontSize ?? Dimensions.titleMedium,
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
