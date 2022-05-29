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

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  int a = 0;
  int outcome = 0;
  int conducted = 0;
  int type = 0;
  int injection = 0;
  int preg = 0;
  int sex = 0;
  int cried = 0;
  int management = 0;
  int defect = 0;
  int feed = 0;
  int jsy = 0;

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
            topic("Delivery", ""),
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
              name: "Delivery outcome",
              num: 2,
              item: const ["Livebirth", "Stillbirth"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                outcome = int.parse(val.toString());
                print("$outcome");
              }),
              selectedButton: outcome,
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
                          "Date of delivery",
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
                          "Time of delivery",
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
              name: "Delivery conducted by",
              num: 3,
              item: const ["Doctor", "Nurse", "Dhai"],
              height: 180,
              a: (a++) % 4,
              press: (val) => setState(() {
                conducted = int.parse(val.toString());
                print("$conducted");
              }),
              selectedButton: conducted,
            ),
            radioContainer(
              name: "Type of delivery",
              num: 3,
              item: const ["Normal", "Ceasarean section", "Assisted"],
              height: 180,
              a: (a++) % 4,
              press: (val) => setState(() {
                type = int.parse(val.toString());
                print("$type");
              }),
              selectedButton: type,
            ),
            CheckBoxCont(
              name: "Complications during delivery",
              item: const [
                "Convulsions",
                "APH",
                "PIH",
                "Repeated abortions",
                "Stillbirth",
                "Congenital anomaly",
                "Cesearean section",
                "Blood transfusion",
                "Twin pregnancy",
                "Obstructed labour",
                "PPH",
                "Any other"
              ],
              height: 848,
              a: (a++) % 4,
            ),
            radioContainer(
              name: "Corticosteriod injection for delivery",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                injection = int.parse(val.toString());
                print("$injection");
              }),
              selectedButton: injection,
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
                          "Date of discharge",
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
                          "Discharge time",
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
              name: "Singleton or twin pregnancy",
              num: 2,
              item: const ["Singleton", "Twins"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                preg = int.parse(val.toString());
                print("$preg");
              }),
              selectedButton: preg,
            ),
            radioContainer(
              name: "Sex of the infant",
              num: 3,
              item: const ["Male", "Female", "Indeterminate"],
              height: 180,
              a: (a++) % 4,
              press: (val) => setState(() {
                sex = int.parse(val.toString());
                print("$sex");
              }),
              selectedButton: sex,
            ),
            radioContainer(
              name: "Baby cried at birth",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                cried = int.parse(val.toString());
                print("$cried");
              }),
              selectedButton: cried,
            ),
            radioContainer(
              name: "Referred to higher centre for management",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                management = int.parse(val.toString());
                print("$management");
              }),
              selectedButton: management,
            ),
            radioContainer(
              name: "Any defect seen at birth",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                defect = int.parse(val.toString());
                print("$defect");
              }),
              selectedButton: defect,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "Birth weight (gm)",
                count: "3000",
                height: 60,
              ),
            ),
            radioContainer(
              name: "Breastfeeding started in 1 hour of birth",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                feed = int.parse(val.toString());
                print("$feed");
              }),
              selectedButton: feed,
            ),
            rowRadioBtnContainer(color: colors[(a++)%4], name: "Birth doses", item: const ["OPV-Zero", "BCG", "Hep B", "Vit k"], num: 4, height: 400),
            radioContainer(
              name: "JSY payment received",
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
            Cont(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Date of JSY payment received",
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
            Cont(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "JSY payment - Cheque number",
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
