import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Other%20pages/VHND/VHNDpro.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Other%20pages/VHND/multisearch.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class VHND extends StatefulWidget {
  const VHND({Key? key}) : super(key: key);

  @override
  _VHNDState createState() => _VHNDState();
}

class _VHNDState extends State<VHND> {
  int a = 0;
  int name = 0;
  int place = 0;
  int attendee = 0;
  int conducted = 0;

  List<String> placeList = const ["PHC", "SC", "Others"];
  List<String> conduct = const ["ANM","Nurse","AWW","ASHA","Teacher","Medical Officer"];

  TextEditingController dateVHND = TextEditingController();
  TextEditingController topicc = TextEditingController();
  TextEditingController other = TextEditingController();



  TextEditingController given =  TextEditingController();
  TextEditingController issued =  TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final datePicked = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(datePicked);
    dateVHND.text = formatted;
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
            topic("VHND", ""),
            Cont(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Date of VHND",
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
                          controller: dateVHND,
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
              name: "Name of village",
              num: Provider.of<vhndpro>(context, listen: false).village.length,
              item: Provider.of<vhndpro>(context, listen: false).village,
              height:
                  Provider.of<vhndpro>(context, listen: false).village.length *
                      60,
              a: (a++) % 4,
              press: (val) => setState(() {
                name = int.parse(val.toString());
              }),
              selectedButton: name,
              fun: (val){
                setState(() {
                  name = val;
                });
              },
            ),
            radioContainer(
              name: "Place of VHND",
              num: 3,
              item: placeList,
              height: 180,
              a: (a++) % 4,
              press: (val) => setState(() {
                place = int.parse(val.toString());
              }),
              selectedButton: place,
              fun: (val){
                setState(() {
                  place = val;
                });
              },
            ),
            place == 3
                ? Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "If others,\nspecify",
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
                              controller: other,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 10, right: 10),
                                border: InputBorder.none,
                              ),
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 60,
                    color: colors[(a++) % 4])
                : const SizedBox(),
            Cont(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Topic of meeting",
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
                          controller: topicc,
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
            name == 0
                ? const SizedBox()
                : Column(
                    children: [
                      SearchMulti(
                        num: name - 1,
                      ),
                      context.watch<vhndpro>().selected.isEmpty
                          ? const SizedBox()
                          : Cont(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        "Attendee name",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: black),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            margin: const EdgeInsets.only(
                                                right: 16,
                                                left: 4,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                              context
                                                  .watch<vhndpro>()
                                                  .selected[index],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: black),
                                            ),
                                          );
                                        },
                                        itemCount: Provider.of<vhndpro>(context,
                                                listen: false)
                                            .selected
                                            .length,
                                      )),
                                ],
                              ),
                              height:
                                  Provider.of<vhndpro>(context, listen: false)
                                          .selected
                                          .length *
                                      40,
                              color: colors[(a++) % 4]),
                    ],
                  ),
            radioContainer(
              name: "Conducted by",
              num: 2,
              item: conduct,
              height: 120,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "No. of IFA tablets given in VHNDs",
                tec: given,
                fun: (val){
                  Provider.of<vhndpro>(context, listen: false).setGiven(given.text);
                },
                count: Provider.of<vhndpro>(context, listen: false).given,
                height: 60,
                add: () {
                  Provider.of<vhndpro>(context, listen: false).incGiven();
                  given.text = Provider.of<vhndpro>(context, listen: false).given.toString();
                  setState(() {});
                },
                sub: () {
                  Provider.of<vhndpro>(context, listen: false).decGiven();
                  given.text = Provider.of<vhndpro>(context, listen: false).given.toString();
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "No. of IFA tablets issued by AWW",
                tec: issued,
                count: Provider.of<vhndpro>(context, listen: false).issued,
                fun: (val){
                  Provider.of<vhndpro>(context, listen: false).setIssued(issued.text);
                },
                height: 60,
                add: () {
                  Provider.of<vhndpro>(context, listen: false).incIssue();
                  issued.text = Provider.of<vhndpro>(context, listen: false).issued.toString();
                  setState(() {});
                },
                sub: () {
                  Provider.of<vhndpro>(context, listen: false).decIssue();
                  issued.text = Provider.of<vhndpro>(context, listen: false).issued.toString();
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
                onTap: () async {
                  Map<String, dynamic> data = {
                    "Date": dateVHND.text,
                    "Village Name": Provider.of<vhndpro>(context, listen: false)
                        .village[name - 1],
                    "Place": placeList[place - 1],
                    "Topic": topicc.text,
                    "Attendee":
                        Provider.of<vhndpro>(context, listen: false).selected,
                    "Conducted": conduct[conducted - 1],
                    "Tablets given":
                        Provider.of<vhndpro>(context, listen: false).given,
                    "Tablets issued":
                        Provider.of<vhndpro>(context, listen: false).issued,
                  };

                  await FirebaseFirestore.instance
                      .collection("VHND")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection(Provider.of<vhndpro>(context, listen: false)
                          .village[name - 1])
                      .doc(dateVHND.text)
                      .set(data)
                      .whenComplete(() async {
                    if (place == 3) {
                      Map<String, dynamic> d = {"Others": other.text};
                      await FirebaseFirestore.instance
                          .collection("VHND")
                          .doc(Provider.of<Details>(context, listen: false)
                              .phone)
                          .collection(
                              Provider.of<vhndpro>(context, listen: false)
                                  .village[name - 1])
                          .doc(dateVHND.text)
                          .update(d);
                    }
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
                                      .phone,
                                )));
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
