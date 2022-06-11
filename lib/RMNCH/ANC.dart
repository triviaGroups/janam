import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/SearchWidgets/SearchPregnancy.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:janam/provider/villageProvider.dart';
import 'package:provider/provider.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/pregDocId.dart';

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

  TextEditingController dob = TextEditingController();
  TextEditingController fttDose = TextEditingController();
  TextEditingController sttDose = TextEditingController();

  List<String> yesno = const ["Yes", "No"];

  List<String> typeList = const [
    "District hospital",
    "Other Govt. hospital",
    "Accredited private hospital",
    "Other private hospital",
    "Home",
    "Sub direct hospital",
    "Medical college hospital",
    "Sub centre",
    "PHC",
    "CHC"
  ];

  List<String> prev = const [
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
  ];

  List<bool> prevbool = [
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
    false,
    false
  ];

  TextEditingController weight = TextEditingController();
  TextEditingController hae = TextEditingController();
  TextEditingController folic = TextEditingController();
  TextEditingController iron = TextEditingController();

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
            topic("Antenatal Care", "Select member"),
            const PregSearch(),
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
                  ],
                ),
                height: 40,
                color: colors[(a++) % 4]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                  color: colors[(a++) % 4],
                  name: "Current weight (kg)",
                  tec: weight,
                  fun: (val){
                    Provider.of<PregDocID>(context, listen: false).setWeight(weight.text);
                  },
                  count: Provider.of<PregDocID>(context, listen: false).weight,
                  height: 60,
                  add: () {
                    Provider.of<PregDocID>(context, listen: false).incWeight();
                    weight.text = Provider.of<PregDocID>(context, listen: false).weight.toString();
                    setState(() {});
                  },
                  sub: () {
                    Provider.of<PregDocID>(context, listen: false).decWeight();
                    weight.text = Provider.of<PregDocID>(context, listen: false).weight.toString();
                    setState(() {});
                  }),
            ),
            Container(
              height: 69,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: colors[(a++) % 4],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(1, 2),
                    ),
                  ]),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
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
                                  padding: const EdgeInsets.only(
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
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: const Offset(1, 2),
                                  ),
                                ],
                              ),
                              child: Transform.translate(
                                  offset: const Offset(0, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Provider.of<VillageProvider>(context,
                                              listen: false)
                                          .incSys();
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: black,
                                      size: 16,
                                    ),
                                  )),
                            )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  color: Colors.transparent,
                                  child: Text(
                                    Provider.of<VillageProvider>(context,
                                            listen: false)
                                        .sys
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: black),
                                  ),
                                )),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: const Offset(1, 2),
                                  ),
                                ],
                              ),
                              child: Transform.translate(
                                  offset: const Offset(0, -4),
                                  child: GestureDetector(
                                    onTap: () {
                                      Provider.of<VillageProvider>(context,
                                              listen: false)
                                          .decSys();
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.minimize,
                                      color: black,
                                      size: 16,
                                    ),
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
                                  padding: const EdgeInsets.only(
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
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: const Offset(1, 2),
                                  ),
                                ],
                              ),
                              child: Transform.translate(
                                  offset: const Offset(0, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Provider.of<VillageProvider>(context,
                                              listen: false)
                                          .incDis();
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: black,
                                      size: 16,
                                    ),
                                  )),
                            )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  color: Colors.transparent,
                                  child: Text(
                                    Provider.of<VillageProvider>(context,
                                            listen: false)
                                        .dia
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: black),
                                  ),
                                )),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: const Offset(1, 2),
                                  ),
                                ],
                              ),
                              child: Transform.translate(
                                  offset: const Offset(0, -4),
                                  child: GestureDetector(
                                    onTap: () {
                                      Provider.of<VillageProvider>(context,
                                              listen: false)
                                          .decDis();
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.minimize,
                                      color: black,
                                      size: 16,
                                    ),
                                  )),
                            )),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "Haemoglobin",
                tec: hae,
                fun: (val){
                  Provider.of<PregDocID>(context, listen: false).setHae(hae.text);
                },
                count: Provider.of<PregDocID>(context, listen: false).hae,
                height: 60,
                add: () {
                  Provider.of<PregDocID>(context, listen: false).incHae();
                  hae.text = Provider.of<PregDocID>(context, listen: false).hae.toString();
                  setState(() {});
                },
                sub: () {
                  Provider.of<PregDocID>(context, listen: false).decHae();
                  hae.text = Provider.of<PregDocID>(context, listen: false).hae.toString();
                  setState(() {});
                },
              ),
            ),
            radioContainer(
              name: "Urine test",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                urine = int.parse(val.toString());
              }),
              selectedButton: urine,
              fun: (val){
                setState(() {
                  urine = val;
                });
              },
            ),
            radioContainer(
              name: "Blood test",
              num: 2,
              item: yesno,
              height: 120,
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
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          controller: fttDose,
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
                                initialDate: DateTime(1994),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2022),
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DateTimePickerLocale.en_us,
                                looping: true,
                              );
                              final DateFormat formatter =
                                  DateFormat('yyyy-MM-dd');
                              final String formatted =
                                  formatter.format(datePicked!);
                              setState(() {
                                fttDose.text = formatted;
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
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Date of TT -\n2nd Dose",
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
                          controller: sttDose,
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
                                initialDate: DateTime(1994),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2022),
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DateTimePickerLocale.en_us,
                                looping: true,
                              );
                              final DateFormat formatter =
                                  DateFormat('yyyy-MM-dd');
                              final String formatted =
                                  formatter.format(datePicked!);
                              setState(() {
                                sttDose.text = formatted;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "No. of folic acid tablets given",
                tec: folic,
                fun: (val){
                  Provider.of<PregDocID>(context, listen: false).setFolic(folic.text);
                },
                count: Provider.of<PregDocID>(context, listen: false).folic,
                height: 80,
                add: () {
                  Provider.of<PregDocID>(context, listen: false).incFolic();
                  folic.text = Provider.of<PregDocID>(context, listen: false).folic.toString();
                  setState(() {});
                },
                sub: () {
                  Provider.of<PregDocID>(context, listen: false).decFolic();
                  folic.text = Provider.of<PregDocID>(context, listen: false).folic.toString();
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "No. of iron folic acid tablets given",
                tec: iron,
                fun: (val){
                  Provider.of<PregDocID>(context, listen: false).setIron(iron.text);
                },
                count: Provider.of<PregDocID>(context, listen: false).iron,
                height: 80,
                add: () {
                  Provider.of<PregDocID>(context, listen: false).incIron();
                  iron.text = Provider.of<PregDocID>(context, listen: false).iron.toString();
                  setState(() {});
                },
                sub: () {
                  Provider.of<PregDocID>(context, listen: false).decIron();
                  iron.text = Provider.of<PregDocID>(context, listen: false).iron.toString();
                  setState(() {});
                },
              ),
            ),
            radioContainer(
              name: "High-risk symptoms",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                risk = int.parse(val.toString());
              }),
              selectedButton: risk,
              fun: (val){
                setState(() {
                  risk = val;
                });
              },
            ),
            CheckBoxCont(
              name: "Antenatal Risk Factors",
              item: prev,
              height: 968,
              a: (a++) % 4,
              boolean: prevbool,
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
              child: Container(
                height: 200,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Image.asset(
                  "assets/images/risk.png",
                  fit: BoxFit.contain,
                ),
              ),
              height: 200,
              color: white,
            ),
            radioContainer(
              name: "Need for referral",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                referral = int.parse(val.toString());
              }),
              selectedButton: referral,
              fun: (val){
                setState(() {
                  referral = val;
                });
              },
            ),
            radioContainer(
              name: "Type of referral facility",
              num: 10,
              item: typeList,
              height: 650,
              a: (a++) % 4,
              press: (val) => setState(() {
                type = int.parse(val.toString());
              }),
              selectedButton: type,
              fun: (val){
                setState(() {
                  type = val;
                });
              },
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
                onTap: () async {
                  List<String> m = [];

                  for (int i = 0; i < prev.length; i++) {
                    if (prevbool[i]) {
                      m.add(prev[i]);
                    }
                  }

                  Map<String, dynamic> data = {
                    "Visit": dob.text,
                    "Weight":
                        Provider.of<PregDocID>(context, listen: false).weight,
                    "Sys": Provider.of<VillageProvider>(context, listen: false)
                        .sys,
                    "Dia": Provider.of<VillageProvider>(context, listen: false)
                        .dia,
                    "Haemoglobin":
                        Provider.of<PregDocID>(context, listen: false).hae,
                    "Urine test": yesno[urine - 1],
                    "Blood test": yesno[blood - 1],
                    "Folic":
                        Provider.of<PregDocID>(context, listen: false).folic,
                    "Iron": Provider.of<PregDocID>(context, listen: false).iron,
                    "Risk": yesno[risk - 1],
                    "Antenatal risk": m,
                    "Need": yesno[referral - 1],
                    "Type": typeList[type - 1],
                  };

                  await FirebaseFirestore.instance
                      .collection("Details")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection("Pregnant")
                      .doc(Provider.of<PregDocID>(context, listen: false).doc)
                      .collection("ANC")
                      .doc(dob.text)
                      .set(data);

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
