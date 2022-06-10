import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:janam/provider/villageProvider.dart';
import 'package:provider/provider.dart';

class vPage3 extends StatefulWidget {
  final String Address;
  final String docId;
  final String VillageName;
  final List<String> head;
  final List<String> spouse;
  final String familyId;
  const vPage3(
      {Key? key,
      required this.docId,
      required this.VillageName,
      required this.head,
      required this.spouse,
      required this.Address,
      required this.familyId})
      : super(key: key);

  @override
  _vPage3State createState() => _vPage3State();
}

class _vPage3State extends State<vPage3> {
  int a = 0;

  List<String> religion = ["Hindu", "Christian", "Muslim", "Sikh", "Others"];
  List<String> casteList = ["Scheduled Caste", "Scheduled Tribe", "Others"];
  List<String> ecoList = ["APL", "BPL", "Don't know"];
  List<String> yesno = ["Yes", "No"];
  List<String> houseType = ["Kutcha", "Pucca"];
  List<String> wasteDis = ["Panchayat", "Municipality"];

  List<List<String>> children = [];

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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/male.png"),
                                      fit: BoxFit.cover),
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
                                        widget.head[0],
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: black),
                                      ),
                                      Text(
                                        (2021 -
                                                    (int.parse(widget.head[1]
                                                        .substring(0, 4))))
                                                .toString() +
                                            " Years",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/female.png"),
                                    fit: BoxFit.cover,
                                  ),
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
                                        widget.spouse[1],
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: black),
                                      ),
                                      Text(
                                        (2021 -
                                                    (int.parse(widget.spouse[2]
                                                        .substring(0, 4))))
                                                .toString() +
                                            " Years",
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
                              widget.Address + ", Tamilnadu, India.",
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
              item: religion,
              height: 300,
              a: (a++) % 4,
              press: (val) => setState(() {
                reli = int.parse(val.toString());
              }),
              selectedButton: reli,
            ),
            radioContainer(
              name: "Caste",
              num: 3,
              item: casteList,
              height: 200,
              a: (a++) % 4,
              press: (val) => setState(() {
                caste = int.parse(val.toString());
              }),
              selectedButton: caste,
            ),
            radioContainer(
              name: "Economic Status",
              num: 3,
              item: ecoList,
              height: 200,
              a: (a++) % 4,
              press: (val) => setState(() {
                eco = int.parse(val.toString());
              }),
              selectedButton: eco,
            ),
            radioContainer(
              name: "Electricity",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                elec = int.parse(val.toString());
              }),
              selectedButton: elec,
            ),
            radioContainer(
              name: "House Type",
              num: 2,
              item: houseType,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                house = int.parse(val.toString());
              }),
              selectedButton: house,
            ),
            radioContainer(
              name: "Toilet facility",
              num: 2,
              item: yesno,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                toilet = int.parse(val.toString());
              }),
              selectedButton: toilet,
            ),
            radioContainer(
              name: "Waste disposal",
              num: 2,
              item: wasteDis,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                waste = int.parse(val.toString());
              }),
              selectedButton: waste,
            ),
            Cont(
                child: Column(
                  children: [
                    incDec(
                      color: colors[(a++) % 4],
                      name: "G - No. of times pregnant",
                      count:
                          Provider.of<VillageProvider>(context, listen: false)
                              .G,
                      height: 60,
                      add: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .incG();
                        setState(() {});
                      },
                      sub: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .decG();
                        setState(() {});
                      },
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "P - No. of times delivered",
                      count:
                          Provider.of<VillageProvider>(context, listen: false)
                              .P,
                      height: 60,
                      add: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .incP();
                        setState(() {});
                      },
                      sub: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .decP();
                        setState(() {});
                      },
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "L - No. of living children",
                      count:
                          Provider.of<VillageProvider>(context, listen: false)
                              .L1,
                      height: 60,
                      add: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .incL1();
                        setState(() {});
                      },
                      sub: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .decL1();
                        setState(() {});
                      },
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "L - No. of male children",
                      count:
                          Provider.of<VillageProvider>(context, listen: false)
                              .L2,
                      height: 60,
                      add: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .incL2();
                        setState(() {});
                      },
                      sub: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .decL2();
                        setState(() {});
                      },
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "L - No. of female children",
                      count:
                          Provider.of<VillageProvider>(context, listen: false)
                              .L3,
                      height: 60,
                      add: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .incL3();
                        setState(() {});
                      },
                      sub: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .decL3();
                        setState(() {});
                      },
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "A- No. of abortions",
                      count:
                          Provider.of<VillageProvider>(context, listen: false)
                              .A1,
                      height: 60,
                      add: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .incA1();
                        setState(() {});
                      },
                      sub: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .decA1();
                        setState(() {});
                      },
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "A- No. of spontaneous abortions",
                      count:
                          Provider.of<VillageProvider>(context, listen: false)
                              .A2,
                      height: 60,
                      add: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .incA2();
                        setState(() {});
                      },
                      sub: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .decA2();
                        setState(() {});
                      },
                    ),
                    incDec(
                      color: colors[(a++) % 4],
                      name: "A- No. of medical termination (MTP)",
                      count:
                          Provider.of<VillageProvider>(context, listen: false)
                              .A3,
                      height: 60,
                      add: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .incA3();
                        setState(() {});
                      },
                      sub: () {
                        Provider.of<VillageProvider>(context, listen: false)
                            .decA3();
                        setState(() {});
                      },
                    ),
                  ],
                ),
                height: 610,
                color: white),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Details of Living Children",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                  Text(
                    "(swipe if more than 1 living children to register details)",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            Provider.of<VillageProvider>(context, listen: false).L1 > 0
                ? Container(
                    height: 300,
                    alignment: Alignment.center,
                    child: PageView.builder(
                        itemCount:
                            Provider.of<VillageProvider>(context, listen: false)
                                .L1,
                        itemBuilder: (context, index) {
                          List<String> mn = ["", "", ""];
                          children.add(mn);
                          return Cont(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Text(
                                        "Details of ${index + 1} Child",
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
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          padding:
                                              const EdgeInsets.only(top: 16),
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
                                          margin: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 6,
                                              right: 4),
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              children[index][0] = val;
                                            },
                                            decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              border: InputBorder.none,
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontSize: 14, color: black),
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
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          padding:
                                              const EdgeInsets.only(top: 16),
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
                                          margin: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 6,
                                              right: 4),
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              children[index][1] = val;
                                            },
                                            decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              border: InputBorder.none,
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontSize: 14, color: black),
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
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          padding:
                                              const EdgeInsets.only(top: 16),
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
                                          margin: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 6,
                                              right: 4),
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              children[index][2] = val;
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Male or Female",
                                              hintStyle: GoogleFonts.poppins(
                                                  fontSize: 14, color: txt),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 10, right: 10),
                                              border: InputBorder.none,
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontSize: 14, color: black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                              height: 250,
                              color: colors[2]);
                        }),
                  )
                : const SizedBox(),
            radioContainer(
              name: "Is the couple fertile?",
              num: 2,
              item: yesno,
              height: 120,
              a: 3,
              press: (val) => setState(() {
                fertile = int.parse(val.toString());
              }),
              selectedButton: fertile,
            ),
            GestureDetector(
                onTap: () async {
                  if (reli == 0 ||
                      caste == 0 ||
                      eco == 0 ||
                      elec == 0 ||
                      house == 0 ||
                      toilet == 0 ||
                      caste == 0 ||
                      waste == 0 ||
                      fertile == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.black,
                      duration: const Duration(seconds: 2),
                      content: Text(
                        "Make sure you selected everything!",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ));
                  } else {
                    children.length =
                        Provider.of<VillageProvider>(context, listen: false).L1;

                    Map<String, dynamic> data = {
                      "Religion": religion[reli - 1],
                      "Caste": casteList[caste - 1],
                      "EcoStatus": ecoList[eco - 1],
                      "Electricity": yesno[elec - 1],
                      "House": houseType[house - 1],
                      "Toilet": yesno[toilet - 1],
                      "Waste": wasteDis[waste - 1],
                      "Fertile": yesno[fertile - 1],
                      "G": Provider.of<VillageProvider>(context, listen: false)
                          .G,
                      "P": Provider.of<VillageProvider>(context, listen: false)
                          .P,
                      "L1": Provider.of<VillageProvider>(context, listen: false)
                          .L1,
                      "L2": Provider.of<VillageProvider>(context, listen: false)
                          .L2,
                      "L3": Provider.of<VillageProvider>(context, listen: false)
                          .L3,
                      "A1": Provider.of<VillageProvider>(context, listen: false)
                          .A1,
                      "A2": Provider.of<VillageProvider>(context, listen: false)
                          .A2,
                      "A3": Provider.of<VillageProvider>(context, listen: false)
                          .A3,
                    };

                    await FirebaseFirestore.instance
                        .collection("Village Details")
                        .doc(widget.VillageName)
                        .collection("Family")
                        .doc(widget.docId)
                        .collection("Household")
                        .doc(widget.familyId)
                        .update(data)
                        .whenComplete(() async {
                      for (int i = 0; i < children.length; i++) {
                        DocumentReference doc_ref = FirebaseFirestore.instance
                            .collection("Village Details")
                            .doc(widget.VillageName)
                            .collection("Family")
                            .doc(widget.docId)
                            .collection("Household")
                            .doc(widget.familyId)
                            .collection("Children")
                            .doc();

                        DocumentSnapshot docSnap = await doc_ref.get();
                        var doc = docSnap.reference.id;

                        List<String> j = children[i];
                        Map<String, dynamic> h = {
                          "Name": j[0],
                          "DOB": j[1],
                          "Gender": j[2],
                          "ChildId": doc,
                          "docID": widget.docId,
                          "Address": widget.Address,
                          "Village": widget.VillageName,
                        };

                        await FirebaseFirestore.instance
                            .collection("Village Details")
                            .doc(widget.VillageName)
                            .collection("Family")
                            .doc(widget.docId)
                            .collection("Household")
                            .doc(widget.familyId)
                            .collection("Children")
                            .doc(doc)
                            .set(h)
                            .whenComplete(() async {
                          await FirebaseFirestore.instance
                              .collection("Village Members")
                              .doc(Provider.of<Details>(context, listen: false)
                                  .phone)
                              .collection("Members")
                              .doc()
                              .set(h)
                              .whenComplete(() async {
                            int k = int.parse(j[1].substring(0, 4));
                            if ((2022 - k) < 5) {
                              await FirebaseFirestore.instance
                                  .collection("Village Children")
                                  .doc(Provider.of<Details>(context,
                                          listen: false)
                                      .phone)
                                  .collection("Children")
                                  .doc()
                                  .set(h);
                            }
                          });
                        });
                      }
                    });

                    if (fertile == 1) {
                      Map<String, dynamic> detail = {
                        "Name": widget.spouse[1],
                        "DOB": widget.spouse[2],
                        "Village Name": widget.VillageName,
                        "Address": widget.Address + ", Tamilnadu, India.",
                        "DocId": widget.docId,
                        "FamilyId": widget.familyId,
                        "G":
                            Provider.of<VillageProvider>(context, listen: false)
                                .G,
                        "P":
                            Provider.of<VillageProvider>(context, listen: false)
                                .P,
                        "L1":
                            Provider.of<VillageProvider>(context, listen: false)
                                .L1,
                        "L2":
                            Provider.of<VillageProvider>(context, listen: false)
                                .L2,
                        "L3":
                            Provider.of<VillageProvider>(context, listen: false)
                                .L3,
                        "A1":
                            Provider.of<VillageProvider>(context, listen: false)
                                .A1,
                        "A2":
                            Provider.of<VillageProvider>(context, listen: false)
                                .A2,
                        "A3":
                            Provider.of<VillageProvider>(context, listen: false)
                                .A3,
                      };

                      await FirebaseFirestore.instance
                          .collection("Details")
                          .doc(Provider.of<Details>(context, listen: false)
                              .phone)
                          .collection("Eligible Couples")
                          .doc(widget.docId)
                          .set(detail);

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
                  }
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
