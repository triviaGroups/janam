import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/SearchWidgets/SearchEC.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:janam/provider/docIdProvider.dart';
import 'package:janam/provider/pregDocId.dart';
import 'package:provider/provider.dart';

class Pregnancy extends StatefulWidget {
  const Pregnancy({Key? key}) : super(key: key);

  @override
  _PregnancyState createState() => _PregnancyState();
}

class _PregnancyState extends State<Pregnancy> {
  int a = 0;
  int test = 1;
  int result = 1;
  int jsy = 1;
  int blood = 1;
  int gravida = 1;
  int facility = 1;
  int rpr = 1;
  int hiv = 1;

  List<String> testList = const ["Positive", "Negative", "Test not done"];

  List<String> resultList = const ["Positive", "Negative"];

  List<bool> historybool = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> history = const [
    "Tuberculosis (TB)",
    "Diabetes mellitus (DM)",
    "Hypertension",
    "Heart disease",
    "Epilepsy",
    "Sexually Transmitted disease",
    "HIV",
    "Hepatitis B",
    "Asthma",
    "Other"
  ];

  List<String> bloodgrp = const [
    "A +ve",
    "A -ve",
    "B +ve",
    "B -ve",
    "AB +ve",
    "AB -ve",
    "O +ve",
    "O -ve",
    "Not done"
  ];

  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  List<String> facilityList = const [
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
  ];

  List<bool> gcompbool = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> gcomp = const [
    "Convulsions",
    "APH",
    "PIH",
    "Repeated abortions",
    "Stillbirth",
    "Congenital anomaly",
    "Cesarean section",
    "Blood transfusion",
    "Twin pregnancy",
    "Obstructed labour",
    "PPH",
    "Any other"
  ];

  List<String> yesno = const ["Yes", "No"];

  List<String> gpreg = const ["Live birth", "Stillbirth", "Abortion"];

  TextEditingController dob = TextEditingController();
  TextEditingController lmdDate = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final datePicked = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(datePicked);
    dob.text = formatted;
  }

  @override
  Widget build(BuildContext context) {
    a = 0;
    return SafeArea(
        child: Scaffold(
      backgroundColor: white,
          resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            topic("Pregnancy", "Select member"),
            const EcSearch(),
            context.watch<DocID>().doc == ""
                ? const SizedBox()
                : Cont(
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Text(
                              Provider.of<DocID>(context, listen: false).name,
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                            Text(
                              ", Female, " +
                                  (2021 -
                                          (int.parse(Provider.of<DocID>(context,
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
                                  Provider.of<DocID>(context, listen: false)
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
                      flex: 3,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Date of tracking",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          controller: dob,
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
                                firstDate: DateTime(1960, 1),
                                lastDate: DateTime(2022, 12),
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DateTimePickerLocale.en_us,
                                looping: true,
                              );
                              final DateFormat formatter =
                              DateFormat('yyyy-MM-dd');
                              final String formatted =
                              formatter.format(datePicked!);
                              setState(() {
                                dob.text = formatted;
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
            Cont(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Last menstrual period (LMP)",
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          controller: lmdDate,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
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
                                firstDate: DateTime(1960, 1),
                                lastDate: DateTime(2022, 12),
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DateTimePickerLocale.en_us,
                                looping: true,
                              );
                              final DateFormat formatter =
                              DateFormat('yyyy-MM-dd');
                              final String formatted =
                              formatter.format(datePicked!);
                              setState(() {
                                lmdDate.text = formatted;
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
                height: 50,
                color: colors[(a++) % 4]),
            radioContainer(
              name: "Pregnancy test conducted?",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                test = int.parse(val.toString());
              }),
              selectedButton: test,
              fun: (val){
                setState(() {
                  test = val;
                });
              },
            ),
            radioContainer(
              name: "Pregnancy test result",
              num: 2,
              item: resultList,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                result = int.parse(val.toString());
              }),
              selectedButton: result,
              fun: (val){
                setState(() {
                  result = val;
                });
              },
            ),
            result == 1
                ? Column(
                    children: [
                      radioContainer(
                        name: "JSY beneficiary",
                        num: 2,
                        item: yesno,
                        height: 120,
                        a: (a++) % 4,
                        press: (val) => setState(() {
                          jsy = int.parse(val.toString());
                        }),
                        selectedButton: jsy,
                        fun: (val){
                          setState(() {
                            jsy = val;
                          });
                        },
                      ),
                      CheckBoxCont(
                        name: "Past history of illness",
                        item: history,
                        height: 700,
                        a: (a++) % 4,
                        boolean: historybool,

                      ),
                      radioContainer(
                        name: "Blood grouping",
                        num: 9,
                        item: bloodgrp,
                        height: 500,
                        a: (a++) % 4,
                        press: (val) => setState(() {
                          blood = int.parse(val.toString());
                        }),
                        selectedButton: blood,
                        fun: (val){
                          setState(() {
                            blood = val;
                          });
                        },
                      ),
                      context.watch<DocID>().G > 0
                          ? Column(
                              children: [
                                CheckBoxCont(
                                  name:
                                      "If Gravida 2 \n\nComplications in previous pregnancy",
                                  item: gcomp,
                                  height: 848,
                                  a: (a++) % 4,
                                  boolean: gcompbool,
                                ),
                                radioContainer(
                                  name:
                                      "If Gravida 2\n\nOutcome of last pregnancy",
                                  num: 3,
                                  item: gpreg,
                                  height: 200,
                                  a: (a++) % 4,
                                  press: (val) => setState(() {
                                    gravida = int.parse(val.toString());
                                  }),
                                  selectedButton: gravida,
                                  fun: (val){
                                    setState(() {
                                      gravida = val;
                                    });
                                  },
                                ),
                              ],
                            )
                          : const SizedBox(),
                      radioContainer(
                        name: "Expected facility for delivery",
                        num: 10,
                        item: facilityList,
                        height: 600,
                        a: (a++) % 4,
                        press: (val) => setState(() {
                          facility = int.parse(val.toString());
                        }),
                        selectedButton: facility,
                        fun: (val){
                          setState(() {
                            facility = val;
                          });
                        },
                      ),
                      radioContainer(
                        name: "VDRL / RPR Test",
                        num: 3,
                        item: testList,
                        height: 180,
                        a: (a++) % 4,
                        press: (val) => setState(() {
                          rpr = int.parse(val.toString());
                        }),
                        selectedButton: rpr,
                        fun: (val){
                          setState(() {
                            rpr = val;
                          });
                        },
                      ),
                      radioContainer(
                        name: "HIV",
                        num: 3,
                        item: testList,
                        height: 180,
                        a: (a++) % 4,
                        press: (val) => setState(() {
                          hiv = int.parse(val.toString());
                        }),
                        selectedButton: hiv,
                        fun: (val){
                          setState(() {
                            hiv = val;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: incDec(
                          color: colors[(a++) % 4],
                          name: "Current weight (kg)",
                          tec: weight,
                          fun: (val){
                      Provider.of<PregDocID>(context, listen: false).setWeight(weight.text);
                      },
                          count: Provider.of<PregDocID>(context, listen: false)
                              .weight,
                          height: 60,
                          add: () {
                            Provider.of<PregDocID>(context, listen: false)
                                .incWeight();

                            weight.text = Provider.of<PregDocID>(context, listen: false).weight.toString();
                            setState(() {});
                          },
                          sub: () {
                            Provider.of<PregDocID>(context, listen: false)
                                .decWeight();

                            weight.text = Provider.of<PregDocID>(context, listen: false).weight.toString();
                            setState(() {});
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: incDec(
                          color: colors[(a++) % 4],
                          name: "Height (cm)",
                          tec: height,
                          fun: (val){
                            Provider.of<PregDocID>(context, listen: false).setHeight(height.text);
                          },
                          count: Provider.of<PregDocID>(context, listen: false)
                              .height,
                          height: 60,
                          add: () {
                            Provider.of<PregDocID>(context, listen: false)
                                .incHeight();
                            height.text = Provider.of<PregDocID>(context, listen: false).height.toString();
                            setState(() {});
                          },
                          sub: () {
                            Provider.of<PregDocID>(context, listen: false)
                                .decHeight();
                            height.text = Provider.of<PregDocID>(context, listen: false).height.toString();
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
                onTap: () async {
                  if (result == 1) {
                    List<String> m = [];

                    for (int i = 0; i < gcomp.length; i++) {
                      if (gcompbool[i]) {
                        m.add(gcomp[i]);
                      }
                    }

                    List<String> k = [];

                    for (int i = 0; i < history.length; i++) {
                      if (historybool[i]) {
                        k.add(history[i]);
                      }
                    }

                    Map<String, dynamic> data = {
                      "JSY": yesno[jsy - 1],
                      "History": k,
                      "Blood": bloodgrp[blood - 1],
                      "Complications G": m,
                      "Outcome G": gpreg[gravida - 1],
                      "Facility": facilityList[facility - 1],
                      "VDLR": testList[rpr - 1],
                      "HIV": testList[hiv - 1],
                    };
                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context, listen: false).phone)
                        .collection("Pregnant")
                        .doc(Provider.of<DocID>(context, listen: false).doc)
                        .collection("Details")
                        .doc(dob.text)
                        .set(data)
                        .whenComplete(() => Navigator.pop(context));
                  }
                  if (result == 2) {
                    DocumentSnapshot<Map<String, dynamic>> ds =
                        await FirebaseFirestore.instance
                            .collection("Details")
                            .doc(Provider.of<Details>(context, listen: false)
                                .phone)
                            .collection("Pregnant")
                            .doc(Provider.of<DocID>(context, listen: false).doc)
                            .get();
                    if (ds.exists) {
                      await FirebaseFirestore.instance
                          .collection("Details")
                          .doc(Provider.of<Details>(context, listen: false)
                              .phone)
                          .collection("Pregnant")
                          .doc(Provider.of<DocID>(context, listen: false).doc)
                          .delete();
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
                    }
                  }
                },
                child: Button("Register")),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ));
  }
}
