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

class Pregnancy extends StatefulWidget {
  const Pregnancy({Key? key}) : super(key: key);

  @override
  _PregnancyState createState() => _PregnancyState();
}

class _PregnancyState extends State<Pregnancy> {


  int a = 0;
  int test = 0;
  int result = 0;
  int jsy = 0;
  int blood = 0;
  int gravida = 0;
  int facility = 0;
  int rpr = 0;
  int hiv = 0;

  TextEditingController dob = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final datePicked = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter. format(datePicked);
    dob.text = formatted;
  }

  @override
  Widget build(BuildContext context) {
    a = 0;
    return SafeArea(
        child: Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            topic("Pregnancy", "Select member"),
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
                            EdgeInsets.only(left: 10, right: 10,bottom: 5),
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
                          "Last mestrual period (LMP)",
                          maxLines: 2,
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
                          style: GoogleFonts.poppins(fontSize: 14, color: black),
                        ),
                      ),
                    ),
                  ],
                ),
                height: 50,
                color: colors[(a++) % 4]),
            radioContainer(
              name: "Pregnancy test conducted?",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                test = int.parse(val.toString());
                print("$test");
              }),
              selectedButton: test,
            ),
            radioContainer(
              name: "Pregnancy test result",
              num: 2,
              item: const ["Positive", "Negative"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                result = int.parse(val.toString());
                print("$result");
              }),
              selectedButton: result,
            ),
            result == 1 ? Column(
              children: [
                radioContainer(
                  name: "JSY beneficiary",
                  num: 2,
                  item: const ["Yes", "No"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    jsy = int.parse(val.toString());
                    print("$jsy");
                  }),
                  selectedButton: jsy,
                ),
                CheckBoxCont(
                  name: "Past history of illness",
                  item: const ["Tuberculosis (TB)","Diabetes mellitus (DM)","Hypertension","Heart disease","Epilepsy","Sexually Transmitted disease","HIV","Hepatisis B","Asthma","Other"],
                  height: 700,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "Blood grouping",
                  num: 9,
                  item: const [
                    "A +ve",
                    "A -ve",
                    "B +ve",
                    "B -ve",
                    "AB +ve",
                    "AB -ve",
                    "O +ve",
                    "O -ve",
                    "Not done"
                  ],
                  height: 500,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    blood = int.parse(val.toString());
                    print("$blood");
                  }),
                  selectedButton: blood,
                ),
                CheckBoxCont(
                  name: "If Gravida 2 \n\nComplications in previous pregnancy",
                  item: const ["Convulsions","APH","PIH","Repeated abortions","Stillbirth","Congenital anomaly","Cesearean section","Blood transfusion","Twin pregnancy","Obstructed labour","PPH","Any other"],
                  height: 848,
                  a: (a++) % 4,
                ),
                radioContainer(
                  name: "If Gravida 2\n\nOutcome of last pregnancy",
                  num: 3,
                  item: const ["Live birth", "Strillbirth", "Abortion"],
                  height: 200,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    gravida = int.parse(val.toString());
                    print("$gravida");
                  }),
                  selectedButton: gravida,
                ),
                radioContainer(
                  name: "Expected facility for delivery",
                  num: 10,
                  item: const [
                    "District hospital",
                    "Other Govt. hospital",
                    "Accredited private hospital",
                    "Other private hospital",
                    "Home",
                    "Sub district hospital",
                    "Medical college hospital",
                    "Sub centre",
                    "PHC",
                    "CHC"
                  ],
                  height: 600,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    facility = int.parse(val.toString());
                    print("$facility");
                  }),
                  selectedButton: facility,
                ),
                radioContainer(
                  name: "VDRL / RPR Test",
                  num: 3,
                  item: const ["Positive", "Negative", "Test not done"],
                  height: 180,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    rpr = int.parse(val.toString());
                    print("$rpr");
                  }),
                  selectedButton: rpr,
                ),
                radioContainer(
                  name: "HIV",
                  num: 3,
                  item: const ["Positive", "Negative", "Test not done"],
                  height: 180,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    hiv = int.parse(val.toString());
                    print("$hiv");
                  }),
                  selectedButton: hiv,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "Current weight (kg)",
                    count: 0,
                    height: 60,
                    add: (){},
                    sub: (){},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "Height (cm)",
                    count: 0,
                    height: 60,
                    add: (){},
                    sub: (){},
                  ),
                ),
              ],
            ) : SizedBox(),
            const SizedBox(
              height: 32,
            ),
            Button("Register"),
            const SizedBox(
              height: 16,
            ),

          ],
        ),
      ),
    ));
  }
}
