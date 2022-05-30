import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

Padding textfield(String txt) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        onChanged: (val) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, right: 10),
          hintText: txt,
          errorMaxLines: 1,
          hintStyle: GoogleFonts.inter(fontSize: 14, color: white),
        ),
        style: GoogleFonts.inter(fontSize: 14, color: black),
      ),
    ),
  );
}