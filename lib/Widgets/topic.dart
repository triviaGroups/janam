import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

Row topic(String heading,String subheading) {
  return Row(
    children: [
      Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: purple),
                ),
                Text(
                  subheading,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: purple),
                )
              ],
            ),
          )),
      Expanded(child: Container()),
    ],
  );
}