import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../List/ashaList.dart';
import '../List/villageList.dart';
import '../Widgets/nameTextfield.dart';
import '../Widgets/subVillageBoxShape.dart';
import '../Widgets/villageBoxShape.dart';

class nurseDetails extends StatefulWidget {
  const nurseDetails({super.key});

  @override
  State<nurseDetails> createState() => _nurseDetailsState();
}

class _nurseDetailsState extends State<nurseDetails> {
  List<villageDetailsDataList> vil = <villageDetailsDataList>[];
  List<ashaDetailsDataList> ash = <ashaDetailsDataList>[];

  static int villageCount = 3;
  static int ashaCount = 3;

  @override
  void initState() {
    vil = villageDetailsList();
    ash = ashaDetailsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: purple,
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Text(
                  "Setting your profile",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 24, color: orange),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(top: 30),
                height: 50,
                width: double.infinity,
                child: TextField(
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 18, color: purple),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8),
                      border: InputBorder.none,
                      hintText: "Full Name",
                      hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: purple)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(top: 30),
                height: 50,
                width: double.infinity,
                child: TextField(
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 18, color: purple),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8),
                      border: InputBorder.none,
                      hintText: "Primary Health Center Name",
                      hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: purple)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(top: 30),
                height: 50,
                width: double.infinity,
                child: TextField(
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 18, color: purple),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8),
                      border: InputBorder.none,
                      hintText: "Sub Center name",
                      hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: purple)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Upload Photo",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: purple),
                          ),
                          Text(
                            "Take a photo or choose from gallery",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: purple),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: FaIcon(
                        FontAwesomeIcons.camera,
                        color: Colors.grey,
                        size: 27,
                      ),
                    ),
                  )
                ],
              ),
            ),

            villageBoxShape(
                context, purple, "List of Villages", "Village Name", vil.length,
                () {
              villageCount++;
              String temp = "Village $villageCount -Name";
              vil.add(villageDetailsDataList(name: temp));
            }, vil),

            subVillageBoxShape(context, orange, "Village1 - Details",
                "Village name", "Population"),

            villageBoxShape(
                context, purple, "List of ASHA's", "ASHA Name", ash.length,
                    () {
                  ashaCount++;
                  String temp = "ASHA $ashaCount -Name";
                  ash.add(ashaDetailsDataList(name: temp));
                }, ash),

            Container(
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
                      "ASHA 1 -Details",
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
                                  margin: EdgeInsets.symmetric(vertical: 12,horizontal: 32),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "ASHA name",
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
                                child: NameTextField("Enter Name"),
                              ),
                            ),
                          ],
                        ),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Mobile no",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: purple),
                                  ),
                                )),
                            Expanded(
                              child:Container(
                                margin: EdgeInsets.only(top: 16),
                                alignment: Alignment.topCenter,
                                child: NameTextField("99445*****"),
                              ),
                            ),
                          ],
                        ),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Village name",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: purple),
                                  ),
                                )),
                            Expanded(
                              child:Container(
                                margin: EdgeInsets.only(top: 16),
                                alignment: Alignment.topCenter,
                                child: NameTextField("Village Name"),
                              ),
                            ),
                          ],
                        ),),
                    ],
                  ),
                )
              ]),
            ),

          ],
        ),
      ),
    );
  }
}
