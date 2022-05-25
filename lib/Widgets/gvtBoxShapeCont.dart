import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/provider/nurseProvider.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';


class gvtBoxShapeCont extends StatefulWidget {
  final String title;
  final String string1;
  final String string2;
  final String string3;
  final int index;
  final int part;
  const gvtBoxShapeCont(
      {Key? key,
      required this.title,
      required this.string1,
      required this.string2,
      required this.string3,
      required this.index,
      required this.part})
      : super(key: key);

  @override
  _gvtBoxShapeContState createState() => _gvtBoxShapeContState();
}

class _gvtBoxShapeContState extends State<gvtBoxShapeCont> {

  var tecc = new TextEditingController();
  var tecm = new TextEditingController();
  var tecn = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 183,
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
            color: orange,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              widget.title,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 140,
          // constraints: BoxConstraints(
          //   maxHeight: double.infinity,
          // ),
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
                      margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.string1,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: purple),
                      ),
                    )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 2.5),
                          child: Container(
                            //color: Colors.red,
                            alignment: Alignment.center,
                            height: 25,
                            width: 116,
                            child: TextFormField(
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter name",
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                              onChanged: (val){

                              },
                              onEditingComplete: (){

                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.string2,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: purple),
                      ),
                    )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 16),
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 2.5),
                          child: Container(
                            //color: Colors.red,
                            alignment: Alignment.center,
                            height: 25,
                            width: 116,
                            child: TextFormField(
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile number",
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                              onChanged: (val){

                              },
                              onEditingComplete: (){

                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.string3,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: purple),
                      ),
                    )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 16),
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 2.5),
                          child: Container(
                            //color: Colors.red,
                            alignment: Alignment.center,
                            height: 25,
                            width: 116,
                            child: TextFormField(
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "No. of childreh",
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                              onChanged: (val){

                              },
                              onEditingComplete: (){

                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
