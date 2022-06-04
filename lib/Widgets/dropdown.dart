import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/heading.dart';
import 'package:janam/constants/color_constants.dart';

final List<String> genderItems = [
  'Male',
  'Female',
];

Padding DropDown(String value,String select) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      children: [
        Heading(value),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
          child:
          DropdownButtonFormField2(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),),
            isExpanded: true,
            hint: Text(
              select,
              style: GoogleFonts.poppins(fontSize: 14,color: white),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: white,
            ),
            iconSize: 30,
            buttonHeight: 52,
            buttonDecoration: BoxDecoration(
              color: heading,
              borderRadius: BorderRadius.circular(50),
            ),
            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            items: genderItems
                .map((item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ))
                .toList(),
            onChanged: (value) {

            },
            onSaved: (value) {

            },
          ),
        ),
      ],
    ),
  );
}

