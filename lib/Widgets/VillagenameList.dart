import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding VillageNameList(String villageName) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 2.5),
    child: Container(
      alignment: Alignment.center,
      height: 25,
      width: 116,
      child: TextField(
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: villageName,
            hintStyle: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
      ),
    ),
  );
}