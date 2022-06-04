import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

Container Heading(String value) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.symmetric(horizontal: 24),
    child: Text(
      value,
      style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: hTxt),
    ),
  );
}