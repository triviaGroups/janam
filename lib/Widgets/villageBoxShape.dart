import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../List/villageList.dart';
import '../constants/color_constants.dart';
import 'nameTextfield.dart';

Container villageBoxShape(BuildContext context,Color clr,String topic1,String string1,int itemlength,VoidCallback function,List vil) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    height: 126,
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
          color: clr,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            topic1,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white),
          ),
        ),
      ),
      Container(
        height: 85,
        // constraints: BoxConstraints(
        //   maxHeight: double.infinity,
        // ),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  alignment: Alignment.topCenter,
                  child: Text(
                    string1,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: purple),
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 15),
                  child: ListView.builder(
                      itemCount: itemlength,
                      padding: EdgeInsets.only(bottom: 1),
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NameTextField(
                            vil[index].name);
                      }),
                )),
            Expanded(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: function,
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      ),
                    ))),
          ],
        ),
      )
    ]),
  );
}