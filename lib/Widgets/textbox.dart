import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

Padding textBox(String txt) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    child: Container(
      height: 56,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20,right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: heading,
      ),
      child: Text(txt,
          style: GoogleFonts.inter(fontSize: 14, color: white)),
    ),
  );
}