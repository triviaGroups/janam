import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/SearchWidgets/searchCC.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/rowRadioButtonContainer.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/pregDocId.dart';

class ChildCare extends StatefulWidget {
  const ChildCare({Key? key}) : super(key: key);

  @override
  _ChildCareState createState() => _ChildCareState();
}

class _ChildCareState extends State<ChildCare> {
  int a = 0;
  int aefi = 1;

  List<String> yn = const ["Yes", "No"];
  List<String> fortyList = ["", "", "", "", "", "", ""];
  List<int> forty = [1, 1, 1, 1, 1, 1, 1];

  List<String> seventyList = [
    "",
    "",
    "",
    "",
    "",
  ];
  List<int> seventy = [1, 1, 1, 1, 1];

  List<String> ninetyList = ["", "", "", "", "", ""];
  List<int> ninety = [1, 1, 1, 1, 1, 1];

  TextEditingController dateOfVisit = TextEditingController();
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
            topic("Child care", "Select member"),
            const ChildSearch(),
            context.watch<PregDocID>().doc == ""
                ? const SizedBox()
                : Cont(
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Text(
                              Provider.of<PregDocID>(context, listen: false)
                                  .name,
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                            Text(
                              ", Female, " +
                                  (2021 -
                                          (int.parse(Provider.of<PregDocID>(
                                                  context,
                                                  listen: false)
                                              .dob
                                              .substring(0, 4))))
                                      .toString(),
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
                                  Provider.of<PregDocID>(context, listen: false)
                                      .address,
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
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Date of Visit",
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
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          controller: dateOfVisit,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 5),
                            border: InputBorder.none,
                          ),
                          style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () async {
                              var datePicked =
                                  await DatePicker.showSimpleDatePicker(
                                context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1960,1),
                                    lastDate: DateTime(2022,12),
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DateTimePickerLocale.en_us,
                                looping: true,
                              );
                              final DateFormat formatter =
                                  DateFormat('yyyy-MM-dd');
                              final String formatted =
                                  formatter.format(datePicked!);
                              setState(() {
                                dateOfVisit.text = formatted;
                              });
                              final snackBar = SnackBar(
                                  content: Text("Date Picked $formatted"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.black87,
                              size: 24,
                            )),
                      ),
                    )
                  ],
                ),
                height: 40,
                color: colors[(a++) % 4]),
            context.watch<PregDocID>().doc == "" ? const SizedBox() : Column(
              children: [
                context.watch<PregDocID>().diff > 42 &&
                    context.watch<PregDocID>().diff <= 70
                    ? rowRadioBtnContainer(
                  color: colors[(a++) % 4],
                  name: "6th week dose",
                  item: const [
                    "OPV-1",
                    "DPT-1",
                    "Hep B-1",
                    "PV-1",
                    "Rota-1",
                    "IPV-1",
                    "PCV-1"
                  ],
                  num: 7,
                  height: 700,
                  dates: fortyList,
                  val: forty,
                )
                    : const SizedBox(),
                context.watch<PregDocID>().diff > 70 &&
                    context.watch<PregDocID>().diff <= 98
                    ? rowRadioBtnContainer(
                  color: colors[(a++) % 4],
                  name: "10th week dose",
                  item: const ["OPV-2", "DPT-2", "Hep B-2", "PV-2", "Rota-2"],
                  num: 5,
                  height: 500,
                  val: seventy,
                  dates: seventyList,
                )
                    : const SizedBox(),
                context.watch<PregDocID>().diff > 98
                    ? rowRadioBtnContainer(
                  color: colors[(a++) % 4],
                  name: "14th week dose",
                  item: const [
                    "OPV-3",
                    "DPT-3",
                    "Hep B-3",
                    "PV-3",
                    "IPV-2",
                    "PCV-2"
                  ],
                  num: 6,
                  height: 600,
                  val: ninety,
                  dates: ninetyList,
                )
                    : const SizedBox(),
              ],
            ),
            radioContainer(
              name: "Adverse event following immunization (AEFI)",
              num: 2,
              item: yn,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                aefi = int.parse(val.toString());
              }),
              selectedButton: aefi,
              fun: (val){
                setState(() {
                  aefi = val;
                });
              },

            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
                onTap: () async {
                  Map<String, dynamic> data = {};
                  if (context.watch<PregDocID>().diff > 42 &&
                      context.watch<PregDocID>().diff <= 70) {
                    setState(() {
                      data = {
                        "6th week dose": true,
                        "6th Week date": dateOfVisit.text,
                        "OPV - 1": [yn[forty[0] - 1], fortyList[0]],
                        "DPT - 1": [yn[forty[1] - 1], fortyList[1]],
                        "HEP B - 1": [yn[forty[2] - 1], fortyList[2]],
                        "PV - 1": [yn[forty[3] - 1], fortyList[3]],
                        "ROTA - 1": [yn[forty[4] - 1], fortyList[4]],
                        "IPV - 1": [yn[forty[5] - 1], fortyList[5]],
                        "PCV - 1": [yn[forty[6] - 1], fortyList[6]],
                        "6th week AEFI": yn[aefi],
                      };
                    });
                  } else if (context.watch<PregDocID>().diff > 70 &&
                      context.watch<PregDocID>().diff <= 98) {
                    setState(() {
                      data = {
                        "10th week dose": true,
                        "10th Week date": dateOfVisit.text,
                        "OPV - 2": [yn[seventy[0] - 1], seventyList[0]],
                        "DPT - 2": [yn[seventy[1] - 1], seventyList[1]],
                        "HEP B - 2": [yn[seventy[2] - 1], seventyList[2]],
                        "PV - 2": [yn[seventy[3] - 1], seventyList[3]],
                        "ROTA - 2": [yn[seventy[2] - 1], seventyList[2]],
                        "10th week AEFI": yn[aefi],
                      };
                    });
                  } else if (context.watch<PregDocID>().diff > 98) {
                    setState(() {
                      data = {
                        "14th week dose": true,
                        "14th Week date": dateOfVisit.text,
                        "OPV - 3": [yn[ninety[0] - 1], ninetyList[0]],
                        "DPT - 3": [yn[ninety[1] - 1], ninetyList[1]],
                        "HEP B - 3": [yn[ninety[2] - 1], ninetyList[2]],
                        "PV - 3": [yn[ninety[3] - 1], ninetyList[3]],
                        "IPV - 2": [yn[ninety[2] - 1], ninetyList[2]],
                        "PCV - 2": [yn[ninety[2] - 1], ninetyList[2]],
                        "14th week AEFI": yn[aefi],
                      };
                    });
                  }

                  await FirebaseFirestore.instance
                      .collection("Village Children")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection("New born")
                      .doc(Provider.of<PregDocID>(context, listen: false).doc)
                      .update(data);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(
                    backgroundColor: Colors.black,
                    duration: const Duration(seconds: 2),
                    content: Text(
                      "The details are registered successfully!",
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                  ));

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeSub(
                              number: Provider.of<Details>(context,
                                  listen: false)
                                  .phone)));
                },
                child: Button("Save")),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ));
  }
}
