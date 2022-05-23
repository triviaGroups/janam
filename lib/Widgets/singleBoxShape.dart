import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';
import 'nameTextfield.dart';

Container singleBoxShape(BuildContext context,String title,String string1) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    height: 99,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(width: 0.1, color: Colors.black38),
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 5,
          spreadRadius: 1,
          offset: Offset(1, 2),
        ),
      ],
    ),
    child: Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 35,
        decoration: BoxDecoration(
          color: purple,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            title,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white),
          ),
        ),
      ),
      Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 12,horizontal: 32),
                        alignment: Alignment.topLeft,
                        child: Text(
                          string1,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: purple),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: NameTextField("Number"),
                    ),
                  ),
                ],
              ),),
          ],
        ),
      )
    ]),
  );
}