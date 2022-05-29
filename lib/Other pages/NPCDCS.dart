import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/search.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class NPCDCS extends StatefulWidget {
  const NPCDCS({Key? key}) : super(key: key);

  @override
  _NPCDCSState createState() => _NPCDCSState();
}

class _NPCDCSState extends State<NPCDCS> {
  int a = 0;
  int tobacco = 0;
  int tob_smokeless = 0;
  int alcohol = 0;
  int sedentary = 0;
  int history = 0;
  int oral = 0;
  int breast = 0;
  int cervix = 0;
  int status = 0;
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
                topic("NPCDCS", "Select member"),
                searchWidget(),
                Cont(
                    child: Column(
                      children: [
                        Expanded(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Name of member",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(

                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  onChanged: (val) {},
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                  ),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: black),
                                ),
                              ),),
                          ],
                        ),),
                        Expanded(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Address",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  onChanged: (val) {},
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                  ),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: black),
                                ),
                              ),),
                          ],
                        ),),
                        Expanded(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Date of birth",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(

                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  onChanged: (val) {},
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                  ),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: black),
                                ),
                              ),),
                          ],
                        )),
                      ],
                    ),
                    height: 300,
                    color: colors[(a++) % 4]),
                CheckBoxCont(
                  name: "Known NCD",
                  item: const [
                    "Diabetes mellitus",
                    "Hypertension",
                    "Heart disease (CVD)",
                    "Stroke",
                    "Kidney disease (CKD)",
                    "COPID",
                    "Pul. TB",
                    "Cancer"
                  ],
                  height: 568,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Tobacco - Smoking",
                  num: 2,
                  item: const ["Yes", "No"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    tobacco = int.parse(val.toString());
                    print("$tobacco");
                  }),
                  selectedButton: tobacco,
                ),
                radioContainer(
                  name: "Tobacco - Smokeless (Chewing / snuffing)",
                  num: 2,
                  item: const ["Yes", "No"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    tob_smokeless = int.parse(val.toString());
                    print("$tob_smokeless");
                  }),
                  selectedButton: tob_smokeless,
                ),
                radioContainer(
                  name: "Alcohol consumption in last ? months",
                  num: 2,
                  item: const ["Yes", "No"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    alcohol = int.parse(val.toString());
                    print("$alcohol");
                  }),
                  selectedButton: alcohol,
                ),
                radioContainer(
                  name: "Sedentary lifestyle",
                  num: 2,
                  item: const ["Yes", "No"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    sedentary = int.parse(val.toString());
                    print("$sedentary");
                  }),
                  selectedButton: sedentary,
                ),
                radioContainer(
                  name: "Family history",
                  num: 9,
                  item: const ["Diabetes","High BP","CVD","Stroke","COPD","CKD","RHD","Pul. TB","Cancer"],
                  height: 500,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    history = int.parse(val.toString());
                    print("$history");
                  }),
                  selectedButton: history,
                ),
                Container(
                  height: 69,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colors[(a++) % 4],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(1, 2),
                        ),
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                            color: Colors.transparent,
                            child: Text(
                              "BP",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 8, bottom: 8, right: 8),
                                      color: Colors.transparent,
                                      child: Text(
                                        "Sys",
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
                                        "120",
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
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 8, bottom: 8, right: 8),
                                      color: Colors.transparent,
                                      child: Text(
                                        "Dia",
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
                                        "80",
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
                            ),
                          )),
                    ],
                  ),
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
                              "Blood sugar -FBS-----",
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
                    height: 60,
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
                              "Blood sugar -RBS",
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
                  name: "Oral cavity",
                  num: 2,
                  item: const ["Normal","Abnormal"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    oral = int.parse(val.toString());
                    print("$oral");
                  }),
                  selectedButton: oral,
                ),
                radioContainer(
                  name: "Breast examination",
                  num: 2,
                  item: const ["Normal","Abnormal"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    breast = int.parse(val.toString());
                    print("$breast");
                  }),
                  selectedButton: breast,
                ),
                radioContainer(
                  name: "Visual examination of cervix",
                  num: 2,
                  item: const ["Normal","Abnormal"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    cervix = int.parse(val.toString());
                    print("$cervix");
                  }),
                  selectedButton: cervix,
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
                              "Any other",style: GoogleFonts.poppins(
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
                              "Start of treatment",
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
                  name: "Status",num: 3,
                  item: const ["Referred to FU","Lost to FU","Dead"],
                  height: 160,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    status = int.parse(val.toString());
                    print("$status");
                  }),
                  selectedButton: status,
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
                              "Any other co-morbidities",
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
                    height: 60,
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
                              "Remarks",
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
