import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDesign extends StatelessWidget {
  final String data;
  final int maxLines;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  const TextDesign({this.data, this.maxLines, this.textAlign, this.textOverflow, this.color, this.fontSize, this.fontWeight, this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(data, maxLines: maxLines, textAlign: textAlign, overflow: textOverflow, style: GoogleFonts.montserrat(color: color, fontSize: fontSize, fontWeight: fontWeight, decoration: textDecoration));
  }
}
