import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home.dart';
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
  List<String> conduct = const ["Dr. Manoj, MO, PHC - 1", "Ms. Amala, AWC - 3"];

  TextEditingController dateVHND = new TextEditingController();
  TextEditingController topicc = new TextEditingController();
  TextEditingController other = new TextEditingController();

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
                          decoration: InputDecoration(
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
                      80,
              a: (a++) % 4,
              press: (val) => setState(() {
                name = int.parse(val.toString());
                print("$name");
              }),
              selectedButton: name,
            ),
            radioContainer(
              name: "Place of VHND",
              num: 3,
              item: placeList,
              height: 180,
              a: (a++) % 4,
              press: (val) => setState(() {
                place = int.parse(val.toString());
                print("$place");
              }),
              selectedButton: place,
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
                              decoration: InputDecoration(
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
                : SizedBox(),
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
            name == 0
                ? SizedBox()
                : Column(
                    children: [
                      SearchMulti(
                        num: name - 1,
                      ),
                      context.watch<vhndpro>().selected.isEmpty ? SizedBox() : Cont(
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
                                        decoration: BoxDecoration(
                                          color: Colors.white
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        margin:
                                        EdgeInsets.only(right: 16, left: 4,top: 4,bottom: 4),
                                        child: Text(
                                          context.watch<vhndpro>()
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
                          height: Provider.of<vhndpro>(context, listen: false)
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
                print("$conducted");
              }),
              selectedButton: conducted,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "No. of IFA tablets given in VHNDs",
                count: Provider.of<vhndpro>(context, listen: false).given,
                height: 60,
                add: () {
                  Provider.of<vhndpro>(context, listen: false).incGiven();
                  setState(() {});
                },
                sub: () {
                  Provider.of<vhndpro>(context, listen: false).decGiven();
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "No. of IFA tablets issued by AWW",
                count: Provider.of<vhndpro>(context, listen: false).issued,
                height: 60,
                add: () {
                  Provider.of<vhndpro>(context, listen: false).incIssue();
                  setState(() {});
                },
                sub: () {
                  Provider.of<vhndpro>(context, listen: false).decIssue();
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
                    "Village name": Provider.of<vhndpro>(context, listen: false)
                        .village[name - 1],
                    "Place": placeList[place-1],
                    "Topic": topicc.text,
                    "Attendee":
                        Provider.of<vhndpro>(context, listen: false).selected,
                    "Conducted": conduct[conducted-1],
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
                      .set(data).whenComplete(() async{
                        if(place == 3){
                          Map<String, dynamic> d = {
                            "Others" : other.text
                          };
                          await FirebaseFirestore.instance
                              .collection("VHND")
                              .doc(Provider.of<Details>(context, listen: false).phone)
                              .collection(Provider.of<vhndpro>(context, listen: false)
                              .village[name - 1])
                              .doc(dateVHND.text).update(d);
                        }
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeSub(number: Provider.of<Details>(context, listen: false).phone,)));
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
