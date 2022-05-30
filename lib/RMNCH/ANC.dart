import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/search.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class ANC extends StatefulWidget {
  const ANC({Key? key}) : super(key: key);

  @override
  _ANCState createState() => _ANCState();
}

class _ANCState extends State<ANC> {

  int a = 0;
  int urine = 0;
  int blood = 0;
  int risk = 0;
  int referral = 0;
  int type = 0;

  TextEditingController dob = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final datePicked = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter. format(datePicked!);
    dob.text = formatted;
  }

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
            topic("Antenatal Care", ""),
            searchWidget(),
            Cont(
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Harine",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                        Text(
                          ", Female, 23 years",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: txt),
                        ),
                      ],
                    )),
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\nAddress",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ),
                            Text(
                              "Plot No. 00, Street Name, Area Name,City, State - Pincode",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: txt),
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ],
                        )),
                  ],
                ),
                height: 150,
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
                          "Date of visit",
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
                          controller: dob,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "Current weight (kg)",
                count: "0",
                height: 60,
              ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "Haemoglobin",
                count: "0",
                height: 60,
              ),
            ),
            radioContainer(
              name: "Urine test",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                urine = int.parse(val.toString());
                print("$urine");
              }),
              selectedButton: urine,
            ),
            radioContainer(
              name: "Blood test",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                blood = int.parse(val.toString());
                print("$blood");
              }),
              selectedButton: blood,
            ),
            Cont(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Date of TT -\n1st Dose",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                            border: InputBorder.none,
                          ),
                          style:GoogleFonts.poppins(fontSize: 14, color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.calendar_today_outlined,color: Colors.black87,size: 24,),
                      ),
                    )
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
                          "Date of TT-\n2nd Dose",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "No. of folic acid tablets given",
                count: "0",
                height: 80,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "No. of iron folic acid tablets given",
                count: "0",
                height: 80,
              ),
            ),
            radioContainer(
              name: "High-risk symptoms",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                risk = int.parse(val.toString());
                print("$risk");
              }),
              selectedButton: risk,
            ),
            CheckBoxCont(
              name: "Antenatal Risk Factors",
              item: const [
                "Previous surgery",
                "Thyroid disease",
                "Jaundice",
                "Previous Low Birth Weight",
                "Twin pregnancy",
                "Previous LSCS",
                "Previous breech",
                "Previous transverse delivery",
                "Previous instrumental delivery",
                "Previous induced delivery",
                "Previous Oxytoxin",
                "Previous antibiotics",
                "Previous cortico steroids"
              ],
              height: 968,
              a: (a++) % 4,
            ),
            Cont(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Antenatal Risk Score",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: black),
                  ),
                ),
                height: 60,
                color: colors[(a++) % 4]),
            Cont(
              child: Container(),
              height: 200,
              color: white,
            ),
            radioContainer(
              name: "Need for referral",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                referral = int.parse(val.toString());
                print("$referral");
              }),
              selectedButton: referral,
            ),
            radioContainer(
              name: "Type of referral facility",
              num: 10,
              item: const ["District hospital","Other Govt. hospital","Accredited private hospital","Other private hospital","Home","Sub direct hospital","Medical college hospital","Sub centre","PHC","CHC"],
              height: 650,
              a: (a++) % 4,
              press: (val) => setState(() {
                type = int.parse(val.toString());
                print("$type");
              }),
              selectedButton: type,
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
