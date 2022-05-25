import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/provider/nurseProvider.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';


class subVillageBoxShape extends StatefulWidget {
  final Color clr;
  final String topic;
  final String string1;
  final String string2;
  final int index;
  const subVillageBoxShape(
      {Key? key,
      required this.clr,
      required this.topic,
      required this.string1,
      required this.string2,
      required this.index})
      : super(key: key);

  @override
  _subVillageBoxShapeState createState() => _subVillageBoxShapeState();
}

class _subVillageBoxShapeState extends State<subVillageBoxShape> {
  var tecp = new TextEditingController();
  var tecv = new TextEditingController();

  String village = "";
  String pop = "";

  @override
  Widget build(BuildContext context) {
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
            color: widget.clr,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              widget.topic,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.5, vertical: 2.5),
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
                                    hintText: "Village name",
                                    hintStyle: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    )),
                                onChanged: (val) {
                                  village = val;
                                },
                                onEditingComplete: () {
                                  Provider.of<NurseDetails>(context,listen: false).add_village(village, widget.index);
                                },
                              ),
                            ),
                          )),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.5, vertical: 2.5),
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
                                    hintText: "Enter population",
                                    hintStyle: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    )),
                                onChanged: (val) {
                                 setState(() {
                                   pop = val;
                                 });
                                },
                                onEditingComplete: () {
                                  Provider.of<NurseDetails>(context,listen: false).add_pop(pop, widget.index);
                                },
                              ),
                            ),
                          )),
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
