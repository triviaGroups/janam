import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

Padding Search() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Container(
      padding:EdgeInsets.symmetric(horizontal: 24),
      height: 56,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Colors.grey),
            borderRadius: BorderRadius.circular(50)
        ),
        child: TextFormField(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          onChanged: (val) {

          },
          decoration:
          InputDecoration(
              hintText: "Search",
              errorMaxLines: 1,
              prefixIcon: Icon(Icons.search,size: 30,),
              contentPadding: EdgeInsets.only(left: 20,right: 10),
              hintStyle: GoogleFonts.inter(fontSize: 14,color: black),
              border: InputBorder.none
          ),
          style: GoogleFonts.inter(fontSize: 14,color: black),
        ),
      ),
    ),
  );
}