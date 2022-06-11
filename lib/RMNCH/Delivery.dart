import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/RMNCH/postnatal.dart';
import 'package:janam/SearchWidgets/SearchPregnancy.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/rowRadioButtonContainer.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/pregDocId.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  DeliveryState createState() => DeliveryState();
}

class DeliveryState extends State<Delivery> {
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

  TextEditingController dob = TextEditingController();
  TextEditingController dateDelivery = TextEditingController();
  TextEditingController discharge = TextEditingController();
  TextEditingController timeDelivery = TextEditingController();
  TextEditingController timeDischarge = TextEditingController();
  TextEditingController dateJSY = TextEditingController();
  TextEditingController cheque = TextEditingController();

  TimeOfDay time = const TimeOfDay(hour: 10, minute: 45);

  List<String> outcomeList = const ["Livebirth", "Stillbirth"];

  List<String> yesno = const ["Yes", "No"];

  List<String> conduc = const ["Doctor", "Nurse", "Dhai"];

  List<String> typeList = const ["Normal", "Cesarean section", "Assisted"];

  List<String> sintwi = const ["Singleton", "Twins"];

  List<String> gender = const ["Male", "Female", "Indeterminate"];

  List<String> comp = const [
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
    false,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final datePicked = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(datePicked);
    dob.text = formatted;
  }

  List<String> dosedates = ["", "", "", ""];
  List<int> doseint = [1, 1, 1, 1];

  TextEditingController bweight = TextEditingController();

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
            topic("Delivery", "Select member"),
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
                                EdgeInsets.only(left: 10, right: 10, bottom: 5),
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
              item: outcomeList,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                outcome = int.parse(val.toString());
              }),
              selectedButton: outcome,
              fun: (val){
                setState(() {
                  outcome = val;
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
                          "Date of Delivery",
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
                          controller: dateDelivery,
                          onChanged: (val) {
                            dosedates[0] = val;
                            dosedates[1] = val;
                            dosedates[2] = val;
                            dosedates[3] = val;
                          },
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
                                dateDelivery.text = formatted;
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
                          "Time of delivery",
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
                          controller: timeDelivery,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 7),
                            border: InputBorder.none,
                          ),
                          style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            String crtTime = time.format(context).toString();
                            timeDelivery.text = crtTime;
                          });

                          final snackBar = SnackBar(
                              content:
                                  Text("Time Picked ${timeDelivery.text}"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.watch_later_outlined,
                              color: Colors.black87,
                              size: 30,
                            )),
                      ),
                    )
                  ],
                ),
                height: 40,
                color: colors[(a++) % 4]),
            radioContainer(
              name: "Delivery conducted by",
              num: 3,
              item: conduc,
              height: 180,
              a: (a++) % 4,
              press: (val) => setState(() {
                conducted = int.parse(val.toString());
              }),
              selectedButton: conducted,
              fun: (val){
                setState(() {
                  conducted = val;
                });
              },
            ),
            radioContainer(
              name: "Type of delivery",
              num: 3,
              item: typeList,
              height: 180,
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
            CheckBoxCont(
              name: "Complications during delivery",
              item: comp,
              height: 848,
              a: (a++) % 4,
              boolean: gcompbool,
            ),
            radioContainer(
              name: "Corticosteriod injection for delivery",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                injection = int.parse(val.toString());
              }),
              selectedButton: injection,
              fun: (val){
                setState(() {
                  injection = val;
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
                          "Date of discharge",
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
                          controller: discharge,
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
                                discharge.text = formatted;
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
                          "Discharge Time",
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
                          controller: timeDischarge,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 7),
                            border: InputBorder.none,
                          ),
                          style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            String crtTime = time.format(context).toString();
                            timeDischarge.text = crtTime;
                          });

                          final snackBar = SnackBar(
                              content:
                                  Text("Time Picked ${timeDischarge.text}"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.watch_later_outlined,
                              color: Colors.black87,
                              size: 30,
                            )),
                      ),
                    )
                  ],
                ),
                height: 40,
                color: colors[(a++) % 4]),
            radioContainer(
              name: "Singleton or twin pregnancy",
              num: 2,
              item: sintwi,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                preg = int.parse(val.toString());
              }),
              selectedButton: preg,
              fun: (val){
                setState(() {
                  preg = val;
                });
              },
            ),
            radioContainer(
              name: "Sex of the infant",
              num: 3,
              item: gender,
              height: 180,
              a: (a++) % 4,
              press: (val) => setState(() {
                sex = int.parse(val.toString());
              }),
              selectedButton: sex,
              fun: (val){
                setState(() {
                  sex = val;
                });
              },
            ),
            radioContainer(
              name: "Baby cried at birth",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                cried = int.parse(val.toString());
              }),
              selectedButton: cried,
              fun: (val){
                setState(() {
                  cried = val;
                });
              },
            ),
            radioContainer(
              name: "Referred to higher centre for management",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                management = int.parse(val.toString());
              }),
              selectedButton: management,
              fun: (val){
                setState(() {
                  management = val;
                });
              },
            ),
            radioContainer(
              name: "Any defect seen at birth",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                defect = int.parse(val.toString());
              }),
              selectedButton: defect,
              fun: (val){
                setState(() {
                  defect = val;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "Birth weight (gm)",
                tec: bweight,
                fun: (val){
                  Provider.of<PregDocID>(context, listen: false).setWei(bweight.text);
                },
                count: Provider.of<PregDocID>(context, listen: false).bweight,
                height: 60,
                add: () {
                  Provider.of<PregDocID>(context, listen: false).incbWei();
                  bweight.text =  Provider.of<PregDocID>(context, listen: false).bweight.toString();
                  setState(() {});
                },
                sub: () {
                  Provider.of<PregDocID>(context, listen: false).decbWei();
                  bweight.text =  Provider.of<PregDocID>(context, listen: false).bweight.toString();
                  setState(() {});
                },
              ),
            ),
            radioContainer(
              name: "Breastfeeding started in 1 hour of birth",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                feed = int.parse(val.toString());
              }),
              selectedButton: feed,
              fun: (val){
                setState(() {
                  feed = val;
                });
              },
            ),
            rowRadioBtnContainer(
              color: colors[(a++) % 4],
              name: "Birth doses",
              item: const ["OPV-Zero", "BCG", "Hep B", "Vit k"],
              num: 4,
              height: 400,
              val: doseint,
              dates: dosedates,
            ),
            radioContainer(
              name: "JSY payment received",
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
                          "Date of JSY payment received",
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
                          controller: dateJSY,
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
                                dateJSY.text = formatted;
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
                          "JSY payment Cheque - Number",
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
                          controller: cheque,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 7),
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
            GestureDetector(
                onTap: () async {

                  Map<String,dynamic> newBorn = {
                    "DOB" : dateDelivery.text,
                    "Address" : Provider.of<PregDocID>(context, listen: false).address,
                    "docID" : Provider.of<PregDocID>(context, listen: false).doc,
                    "Village Name" : Provider.of<PregDocID>(context, listen: false).village,
                    "Birth dose" : true,
                    "OPV": [yesno[doseint[0] - 1], dosedates[0]],
                    "BCG": [yesno[doseint[1] - 1], dosedates[1]],
                    "HEP": [yesno[doseint[2] - 1], dosedates[2]],
                    "VIT": [yesno[doseint[3] - 1], dosedates[3]],
                  };

                  if(outcome == 1){
                    await FirebaseFirestore.instance
                        .collection("Village Children")
                        .doc(Provider.of<Details>(context, listen: false)
                        .phone)
                        .collection("Children").doc(Provider.of<PregDocID>(context, listen: false).doc).set(newBorn);
                  }



                  List<String> m = [];

                  for (int i = 0; i < comp.length; i++) {
                    if (gcompbool[i]) {
                      m.add(comp[i]);
                    }
                  }

                  for (int i = 0; i < doseint.length; i++) {
                    if (doseint[i] == 2) {
                      dosedates[i] = "";
                    }
                  }

                  Map<String, dynamic> data = {
                    "Visit": dob.text,
                    "Outcome": outcomeList[outcome - 1],
                    "Delivery": dateDelivery.text,
                    "Time": timeDelivery.text,
                    "Conducted": conduc[conducted - 1],
                    "Type": typeList[type - 1],
                    "Complications": m,
                    "Cortico": yesno[injection - 1],
                    "Dis Date": discharge.text,
                    "Dis Time": timeDischarge.text,
                    "SingleTwi": sintwi[preg - 1],
                    "Sex": gender[sex - 1],
                    "Baby cried": yesno[cried - 1],
                    "Management": yesno[management - 1],
                    "Defect": yesno[defect - 1],
                    "Weight":
                        Provider.of<PregDocID>(context, listen: false).bweight,
                    "BreastFeed": yesno[feed - 1],
                    "JSY received": yesno[jsy - 1],
                    "JSY Date": dateJSY.text,
                    "JSY Cheque": cheque.text,
                    "OPV": [yesno[doseint[0] - 1], dosedates[0]],
                    "BCG": [yesno[doseint[1] - 1], dosedates[1]],
                    "HEP": [yesno[doseint[2] - 1], dosedates[2]],
                    "VIT": [yesno[doseint[3] - 1], dosedates[3]],
                  };

                  DocumentSnapshot<
                      Map<String,
                          dynamic>> ds = await FirebaseFirestore.instance
                      .collection("Details")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection("Pregnant")
                      .doc(Provider.of<PregDocID>(context, listen: false).doc)
                      .get();

                  Map<String, dynamic>? pregData = ds.data();

                  QuerySnapshot anc = await FirebaseFirestore.instance
                      .collection("Details")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection("Pregnant")
                      .doc(Provider.of<PregDocID>(context, listen: false).doc)
                      .collection("ANC")
                      .get();

                  anc.docs.forEach((element) async {
                    Map<String, dynamic> qs = {
                      "Visit": element["Visit"],
                      "Weight": element["Weight"],
                      "Sys": element["Sys"],
                      "Dia": element["Dia"],
                      "Haemoglobin": element["Haemoglobin"],
                      "Urine test": element["Urine test"],
                      "Blood test": element["Blood test"],
                      "Folic": element["Folic"],
                      "Iron": element["Iron"],
                      "Risk": element["Risk"],
                      "Antenatal risk": element["Antenatal risk"],
                      "Need": element["Need"],
                      "Type": element["Type"],
                    };
                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context, listen: false).phone)
                        .collection("Post Pregnancy")
                        .doc(Provider.of<PregDocID>(context, listen: false).doc)
                        .collection("ANC")
                        .doc(element.id)
                        .set(qs);
                  });

                  QuerySnapshot det = await FirebaseFirestore.instance
                      .collection("Details")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection("Pregnant")
                      .doc(Provider.of<PregDocID>(context, listen: false).doc)
                      .collection("Details")
                      .get();

                  det.docs.forEach((element) async {
                    Map<String, dynamic> qs = {
                      "JSY": element["JSY"],
                      "History": element["History"],
                      "Blood": element["Blood"],
                      "Complications G": element["Complications G"],
                      "Outcome G": element["Outcome G"],
                      "Facility": element["Facility"],
                      "VDLR": element["VDLR"],
                      "HIV": element["HIV"],
                    };
                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context, listen: false).phone)
                        .collection("Post Pregnancy")
                        .doc(Provider.of<PregDocID>(context, listen: false).doc)
                        .collection("Details")
                        .doc(element.id)
                        .set(qs);
                  });

                  await FirebaseFirestore.instance
                      .collection("Details")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection("Post Pregnancy")
                      .doc(Provider.of<PregDocID>(context, listen: false).doc)
                      .set(pregData!)
                      .whenComplete(() async {
                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context, listen: false).phone)
                        .collection("Pregnant")
                        .doc(Provider.of<PregDocID>(context, listen: false).doc)
                        .delete()
                        .whenComplete(() async {
                      await FirebaseFirestore.instance
                          .collection("Details")
                          .doc(Provider.of<Details>(context, listen: false)
                              .phone)
                          .collection("Pregnant")
                          .doc(Provider.of<PregDocID>(context, listen: false)
                              .doc)
                          .collection("ANC")
                          .get()
                          .then((snapshot) {
                        for (DocumentSnapshot ds in snapshot.docs) {
                          ds.reference.delete();
                        }
                      }).whenComplete(() async{
                        await FirebaseFirestore.instance
                            .collection("Details")
                            .doc(Provider.of<Details>(context, listen: false)
                            .phone)
                            .collection("Pregnant")
                            .doc(Provider.of<PregDocID>(context, listen: false)
                            .doc)
                            .collection("Details")
                            .get()
                            .then((snapshot) {
                          for (DocumentSnapshot ds in snapshot.docs) {
                            ds.reference.delete();
                          }
                        });
                      });
                      if(outcome == 1){
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          backgroundColor: Colors.black,
                          duration: const Duration(seconds: 2),
                          content: Text(
                            "The details are registered successfully!",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ));

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => PostnatalCare(
                              dob: dateDelivery.text,
                              gender: gender[sex - 1],
                            )));
                      }
                      else{
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          backgroundColor: Colors.black,
                          duration: const Duration(seconds: 2),
                          content: Text(
                            "The details are registered successfully!",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ));
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeSub(
                                  number:
                                  Provider.of<Details>(context, listen: false)
                                      .phone)),
                              (Route<dynamic> route) => false,
                        );
                      }
                    });
                  });
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
