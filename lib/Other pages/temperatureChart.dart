import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/rowRadioButtonContainer.dart';
import 'package:janam/Widgets/search.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class TempChart extends StatefulWidget {
  const TempChart({Key? key}) : super(key: key);

  @override
  _TempChartState createState() => _TempChartState();
}

class _TempChartState extends State<TempChart> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                topic("Temperature chart", "Select freezer"),
                Search(),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Name of ILR",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                                border: InputBorder.none,
                              ),
                              style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 40,
                    color: colors[(a++) % 4]),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Date of charting",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                                border: InputBorder.none,
                              ),
                              style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 40,
                    color: colors[(a++) % 4]),
                radioContainer(
                  name: "Is the ILR level?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Is the ILR, away from sun?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Is the ILR, locked?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Is the ILR, defrosted periodically?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Is the ILR, plugged to socket permanently",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Is the ILR, used for food or drinks?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Are the vaccines, stacked neatly?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Are the vaccines, rotated?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Are the vaccines, kept in the door?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Are the vaccines, frozen?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Are the vaccines, date expired?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                ),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "No. of ice packs prepared this month?",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                                border: InputBorder.none,
                              ),
                              style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 80,
                    color: colors[(a++) % 4]),
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colors[(a++)%4],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(1, 2),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Temp. in deep freezer - 8.00 am",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
                                color: Colors.transparent,
                                child: Text(
                                  "ILR",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: black),
                                ),
                              )),
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, 0),
                                            child: const Icon(
                                              Icons.add,
                                              color: black,
                                              size: 16,
                                            )),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text(
                                          "0",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: black),
                                        ),
                                      )),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, -4),
                                            child: const Icon(
                                              Icons.minimize,
                                              color: black,
                                              size: 16,
                                            )),
                                      )),
                                ],
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
                                color: Colors.transparent,
                                child: Text(
                                  "Deep freezer",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: black),
                                ),
                              )),
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, 0),
                                            child: const Icon(
                                              Icons.add,
                                              color: black,
                                              size: 16,
                                            )),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text(
                                          "0",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: black),
                                        ),
                                      )),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, -4),
                                            child: const Icon(
                                              Icons.minimize,
                                              color: black,
                                              size: 16,
                                            )),
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colors[(a++)%4],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(1, 2),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Temp. in deep freezer - 2.00 pm",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
                                color: Colors.transparent,
                                child: Text(
                                  "ILR",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: black),
                                ),
                              )),
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, 0),
                                            child: const Icon(
                                              Icons.add,
                                              color: black,
                                              size: 16,
                                            )),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text(
                                          "0",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: black),
                                        ),
                                      )),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, -4),
                                            child: const Icon(
                                              Icons.minimize,
                                              color: black,
                                              size: 16,
                                            )),
                                      )),
                                ],
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
                                color: Colors.transparent,
                                child: Text(
                                  "Deep freezer",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: black),
                                ),
                              )),
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, 0),
                                            child: const Icon(
                                              Icons.add,
                                              color: black,
                                              size: 16,
                                            )),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text(
                                          "0",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: black),
                                        ),
                                      )),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, -4),
                                            child: const Icon(
                                              Icons.minimize,
                                              color: black,
                                              size: 16,
                                            )),
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Button("Save"),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ));
  }
}
