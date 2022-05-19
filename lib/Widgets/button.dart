import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

Container Button(String value) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(vertical: 8),
    height: 40,
    width: 130,
    decoration: BoxDecoration(
      color: heading,
      borderRadius: BorderRadius.circular(5)
    ),
    child: Text(
      value,
      style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: white),
    ),
  );
}