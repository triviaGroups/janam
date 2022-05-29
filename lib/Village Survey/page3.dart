import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class vPage3 extends StatefulWidget {
  const vPage3({Key? key}) : super(key: key);

  @override
  _vPage3State createState() => _vPage3State();
}

class _vPage3State extends State<vPage3> {
  int a = 0;

  int reli = 0;
  int eco = 0;
  int elec = 0;
  int house = 0;
  int toilet = 0;
  int caste = 0;
  int waste = 0;
  int fertile = 0;
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
            topic("Village survey", "Add new household"),
            const SizedBox(
              height: 8,
            ),
            Cont(
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 80,
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                ),
                              )),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Husband name",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: black),
                                      ),
                                      Text(
                                        "32 years",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: txt),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 80,
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                ),
                              )),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Husband name",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: black),
                                      ),
                                      Text(
                                        "32 years",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: txt),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                            Text(
                              "Plot No. 00, Street Name, Area Name,City, State - Pincode",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: txt),
                            )
                          ],
                        )),
                  ],
                ),
                height: 250,
                color: colors[(a++) % 4]),
            radioContainer(
              name: "Religion",
              num: 5,
              item: ["Hindu", "Christian", "Muslim", "Sikh", "Others"],
              height: 300,
              a: (a++) % 4,
              press: (val) => setState(() {
                reli = int.parse(val.toString());
                print("$reli");
              }),
              selectedButton: reli,
            ),
            radioContainer(
              name: "Caste",
              num: 3,
              item: ["Scheduled Caste", "Scheduled Tribe", "Others"],
              height: 200,
              a: (a++) % 4,
              press: (val) => setState(() {
                caste = int.parse(val.toString());
                print("$caste");
              }),
              selectedButton: caste,
            ),
            radioContainer(
              name: "Economic Status",
              num: 3,
              item: ["APL", "BPL", "Don't know"],
              height: 200,
              a: (a++) % 4,
              press: (val) => setState(() {
                eco = int.parse(val.toString());
                print("$eco");
              }),
              selectedButton: eco,
            ),
            radioContainer(
              name: "Electricity",
              num: 2,
              item: ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                elec = int.parse(val.toString());
                print("$elec");
              }),
              selectedButton: elec,
            ),
            radioContainer(
              name: "House Type",
              num: 2,
              item: ["Kutcha", "Pucca"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                house = int.parse(val.toString());
                print("$house");
              }),
              selectedButton: house,
            ),
            radioContainer(
              name: "Toilet facility",
              num: 2,
              item: ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                toilet = int.parse(val.toString());
                print("$toilet");
              }),
              selectedButton: toilet,
            ),
            radioContainer(
              name: "Waste disposal",
              num: 2,
              item: ["Panchayat", "Municipality"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                waste = int.parse(val.toString());
                print("$waste");
              }),
              selectedButton: waste,
            ),
            Cont(
                child: Column(
                  children: [
                    incDec(
                      color: colors[(a++) % 4],
                      name: "G - No. of times pregnant",
                      count: "1",
                      height: 60,
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "P - No. of times delivered",
                      count: "1",
                      height: 60,
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "L - No. of living children",
                      count: "1",
                      height: 60,
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "L - No. of male children",
                      count: "1",
                      height: 60,
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "L - No. of female children",
                      count: "1",
                      height: 60,
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "A- No. of abortions",
                      count: "1",
                      height: 60,
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "A- No. of spontaneous abortions",
                      count: "1",
                      height: 60,
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "A- No. of medical termination (MTP)",
                      count: "1",
                      height: 60,
                    ),
                  ],
                ),
                height: 610,
                color: white),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Details of Living Children",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600, color: black),
              ),
            ),
            Cont(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          "Details of First Child",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Name",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 8, bottom: 8, left: 6, right: 4),
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
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Date of Birth",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 8, bottom: 8, left: 6, right: 4),
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
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Sex",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 8, bottom: 8, left: 6, right: 4),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                hintText: "Male or Female",
                                hintStyle: GoogleFonts.poppins(fontSize: 14, color: txt),
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
                    )),
                  ],
                ),
                height: 250,
                color: colors[2]),
            radioContainer(
              name: "Is the couple fertile?",
              num: 2,
              item: ["Yes", "No"],
              height: 120,
              a: 3,
              press: (val) => setState(() {
                fertile = int.parse(val.toString());
                print("$fertile");
              }),
              selectedButton: fertile,
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
