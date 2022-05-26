import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/List/villageWidgetList.dart';
import 'package:janam/Widgets/button.dart';

import '../List/ashaList.dart';
import '../List/awcList.dart';
import '../List/govtSchhols.dart';
import '../List/privateSchools.dart';
import '../constants/color_constants.dart';

class village extends StatefulWidget {
  final int villagecount;
  final List<String> villageName;
  const village(
      {Key? key, required this.villagecount, required this.villageName})
      : super(key: key);

  @override
  _villageState createState() => _villageState();
}

class _villageState extends State<village> {
  List<village> lsv = villageWidget();

  List<ashaDetailsDataList> ash = ashaDetailsList();
  List<awcDetailsDataList> awc = awcDetailsList();
  List<govtSchoolsDetailsDataList> gwc = govtDetailsList();
  List<privateSchoolsDetailsDataList> pwc = pvtDetailsList();

  List<int> ashaCount = [];
  List<int> awcCount = [];
  List<int> govtCount = [];
  List<int> pvtCount = [];

  String village_name = "";
  String pop = "";

  List<List<String>> asha_details = [];
  List<List<String>> awc_details = [];
  List<List<String>> gvt_details = [];
  List<List<String>> pvt_details = [];

  String ilr = "";
  String freezer = "";

  @override
  void initState() {
    ash = ashaDetailsList();
    awc = awcDetailsList();
    gwc = govtDetailsList();
    pwc = pvtDetailsList();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < widget.villagecount; i++) {
        ashaCount.add(0);
        awcCount.add(0);
        govtCount.add(0);
        pvtCount.add(0);
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: PageView.builder(
            itemCount: widget.villagecount,
            controller: controller,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.previousPage(
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade100,
                              ),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.grey.shade600,
                                size: 25,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 35,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text(
                                widget.villageName[index] + " -  Details",
                                softWrap: false,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: hTxt),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: 126,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.1, color: Colors.black38),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "Village ${index + 1}-Details",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              // constraints: BoxConstraints(
                              //   maxHeight: double.infinity,
                              // ),
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 32),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Village Name",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: purple),
                                          ),
                                        )),
                                        Expanded(
                                          child: Container(
                                              margin: EdgeInsets.only(top: 16),
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0.5,
                                                    vertical: 2.5),
                                                child: Container(
                                                  //color: Colors.red,
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 116,
                                                  child: TextFormField(
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            "Village name",
                                                        hintStyle:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                    onChanged: (val) {
                                                      village_name = widget
                                                          .villageName[index];
                                                    },
                                                    onEditingComplete: () {},
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 32, vertical: 12),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Population",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: purple),
                                          ),
                                        )),
                                        Expanded(
                                          child: Container(
                                              margin: EdgeInsets.only(top: 16),
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                child: Container(
                                                  //color: Colors.red,
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 116,
                                                  child: TextFormField(
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            "Enter population",
                                                        hintStyle:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                    onChanged: (val) {
                                                      setState(() {
                                                        pop = val;
                                                      });
                                                    },
                                                    onEditingComplete: () {},
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: 126,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.1, color: Colors.black38),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "List of ASHA's",
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  maxLines: 3,
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "ASHA Name",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: purple),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(top: 15),
                                        child: ListView.builder(
                                            itemCount: ashaCount[index],
                                            shrinkWrap: true,
                                            padding: EdgeInsets.only(bottom: 1),
                                            physics: ClampingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                child: Container(
                                                  //color: Colors.red,
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 116,
                                                  child: TextFormField(
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            ash[index].name,
                                                        hintStyle:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                    onChanged: (val) {},
                                                  ),
                                                ),
                                              );
                                            }),
                                      )),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: GestureDetector(
                                            onTap: () {
                                              List<String> mn = ["", ""];
                                              asha_details.add(mn);
                                              ashaCount[index]++;
                                              String temp =
                                                  "ASHA ${ashaCount[index]} -Name";
                                              ash.add(ashaDetailsDataList(
                                                  name: temp));
                                              setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                          ))),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: ashaCount[index],
                            padding: EdgeInsets.only(bottom: 1),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, ashaind) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                height: 183,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.1, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "ASHA " +
                                            (ashaind + 1).toString() +
                                            " - Details",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 140,
                                    // constraints: BoxConstraints(
                                    //   maxHeight: double.infinity,
                                    // ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Name",
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Enter name",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            asha_details[
                                                                    ashaind]
                                                                [0] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Mobile number",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Enter mobile",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            asha_details[
                                                                    ashaind]
                                                                [1] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Village name",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment:
                                                      Alignment.topCenter,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                              );
                            }),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: 126,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.1, color: Colors.black38),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "List of AWC's",
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  maxLines: 3,
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "AWC Name",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: purple),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(top: 15),
                                        child: ListView.builder(
                                            itemCount: awcCount[index],
                                            shrinkWrap: true,
                                            padding: EdgeInsets.only(bottom: 1),
                                            physics: ClampingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0.5,
                                                    vertical: 2.5),
                                                child: Container(
                                                  //color: Colors.red,
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 116,
                                                  child: TextFormField(
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            awc[index].name,
                                                        hintStyle:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                    onChanged: (val) {},
                                                    onEditingComplete: () {},
                                                  ),
                                                ),
                                              );
                                            }),
                                      )),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: GestureDetector(
                                            onTap: () {
                                              awcCount[index]++;
                                              List<String> mn = ["", "", ""];
                                              awc_details.add(mn);
                                              String temp =
                                                  "AWC ${awcCount[index]} -Details";
                                              awc.add(awcDetailsDataList(
                                                  name: temp));

                                              setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                          ))),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: awcCount[index],
                            padding: EdgeInsets.only(bottom: 1),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, awcind) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                height: 235,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.1, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "AWC " +
                                            (awcind + 1).toString() +
                                            " - Details",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 190,
                                    // constraints: BoxConstraints(
                                    //   maxHeight: double.infinity,
                                    // ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "AWC name",
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Enter name",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            awc_details[awcind]
                                                                [0] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Mobile number",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Mobile number",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            awc_details[awcind]
                                                                [1] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "No. of children",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "No. of children",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          awc_details[awcind]
                                                              [2] = val;
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Village Name",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  //child: NameTextField("Village Name"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                              );
                            }),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: 126,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.1, color: Colors.black38),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "List of Goverment Schools",
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  maxLines: 3,
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Name",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: purple),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(top: 15),
                                        child: ListView.builder(
                                            itemCount: govtCount[index],
                                            shrinkWrap: true,
                                            padding: EdgeInsets.only(bottom: 1),
                                            physics: ClampingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0.5,
                                                    vertical: 2.5),
                                                child: Container(
                                                  //color: Colors.red,
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 116,
                                                  child: TextFormField(
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            gwc[index].name,
                                                        hintStyle:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                    onChanged: (val) {},
                                                    onEditingComplete: () {},
                                                  ),
                                                ),
                                              );
                                            }),
                                      )),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: GestureDetector(
                                            onTap: () {
                                              govtCount[index]++;
                                              List<String> mn = ["", "", ""];
                                              gvt_details.add(mn);
                                              String temp =
                                                  "Goverment School${govtCount[index]} -Details";
                                              gwc.add(
                                                  govtSchoolsDetailsDataList(
                                                      name: temp));

                                              setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                          ))),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: govtCount[index],
                            padding: EdgeInsets.only(bottom: 1),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, gvtind) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                height: 183,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.1, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Goverment School " +
                                            (gvtind + 1).toString() +
                                            "- Details",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 140,
                                    // constraints: BoxConstraints(
                                    //   maxHeight: double.infinity,
                                    // ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Head of the school",
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Enter name",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            gvt_details[gvtind]
                                                                [0] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Mobile Number",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Mobile number",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            gvt_details[gvtind]
                                                                [1] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "No. of children",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "No. of childreh",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            gvt_details[gvtind]
                                                                [2] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                              );
                            }),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: 126,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.1, color: Colors.black38),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "List of Private Schools",
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  maxLines: 3,
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Name",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: purple),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(top: 15),
                                        child: ListView.builder(
                                            itemCount: pvtCount[index],
                                            shrinkWrap: true,
                                            padding: EdgeInsets.only(bottom: 1),
                                            physics: ClampingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0.5,
                                                    vertical: 2.5),
                                                child: Container(
                                                  //color: Colors.red,
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 116,
                                                  child: TextFormField(
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            pwc[index].name,
                                                        hintStyle:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                    onChanged: (val) {},
                                                    onEditingComplete: () {},
                                                  ),
                                                ),
                                              );
                                            }),
                                      )),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: GestureDetector(
                                            onTap: () {
                                              pvtCount[index]++;
                                              List<String> mn = ["", "", ""];
                                              pvt_details.add(mn);
                                              String temp =
                                                  "Private School${pvtCount[index]} -Details";
                                              pwc.add(
                                                  privateSchoolsDetailsDataList(
                                                      name: temp));

                                              setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                          ))),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: pvtCount[index],
                            padding: EdgeInsets.only(bottom: 1),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, pvtind) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                height: 183,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.1, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Private School " +
                                            (pvtind + 1).toString() +
                                            " - Details",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 140,
                                    // constraints: BoxConstraints(
                                    //   maxHeight: double.infinity,
                                    // ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Head of the schoolf",
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Enter name",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            pvt_details[pvtind]
                                                                [0] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Mobile number",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "Mobile number",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            pvt_details[pvtind]
                                                                [1] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "No. of children",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5,
                                                            vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 25,
                                                      width: 116,
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "No. of children",
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            pvt_details[pvtind]
                                                                [2] = val;
                                                          });
                                                        },
                                                        onEditingComplete:
                                                            () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                              );
                            }),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: 99,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.1, color: Colors.black38),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "ICE Lined refrigerators",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 32),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "No. of. ILR's",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: purple),
                                          ),
                                        )),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 0.5,
                                                  vertical: 2.5),
                                              child: Container(
                                                //color: Colors.red,
                                                alignment: Alignment.center,
                                                height: 25,
                                                width: 116,
                                                child: TextFormField(
                                                  style: GoogleFonts.inter(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Number",
                                                      hintStyle:
                                                          GoogleFonts.inter(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                  onChanged: (val) {
                                                    setState(() {
                                                      ilr = val;
                                                    });
                                                  },
                                                  onEditingComplete: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: 99,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.1, color: Colors.black38),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "Freezer",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 32),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "No. of. freezers",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: purple),
                                          ),
                                        )),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 0.5,
                                                  vertical: 2.5),
                                              child: Container(
                                                //color: Colors.red,
                                                alignment: Alignment.center,
                                                height: 25,
                                                width: 116,
                                                child: TextFormField(
                                                  style: GoogleFonts.inter(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Number",
                                                      hintStyle:
                                                          GoogleFonts.inter(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                  onChanged: (val) {
                                                    setState(() {
                                                      freezer = val;
                                                    });
                                                  },
                                                  onEditingComplete: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    index == widget.villagecount - 1
                        ? GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeSub()));
                            },
                            child: Button("Save"))
                        : GestureDetector(
                            onTap: () {
                              Map<String, dynamic> data = {
                                "Name": village_name,
                                "Population": pop,
                                "Ilr": ilr,
                                "Freezer": freezer,
                              };

                              FirebaseFirestore.instance
                                  .collection("Nurse Details")
                                  .doc("Number")
                                  .collection("Villages")
                                  .doc(village_name)
                                  .set(data)
                                  .whenComplete(() {
                                for (int i = 0; i < asha_details.length; i++) {
                                  List<String> mn = asha_details[i];
                                  Map<String, dynamic> asha_data = {
                                    "Asha_name": mn[0],
                                    "Mobile_number": mn[1],
                                  };
                                  FirebaseFirestore.instance
                                      .collection("Nurse_Details")
                                      .doc("Number")
                                      .collection("Villages")
                                      .doc(village_name)
                                      .collection("Asha_Details")
                                      .doc(mn[0])
                                      .set(asha_data)
                                      .whenComplete(() {
                                    for (int i = 0;
                                        i < awc_details.length;
                                        i++) {
                                      List<String> mna = awc_details[i];
                                      Map<String, dynamic> awc_data = {
                                        "Awc_name": mna[0],
                                        "Mobile_number": mna[1],
                                        "No_of_childres": mna[2],
                                      };
                                      FirebaseFirestore.instance
                                          .collection("Nurse_Details")
                                          .doc("Number")
                                          .collection("Villages")
                                          .doc(village_name)
                                          .collection("Awc_Details")
                                          .doc(mna[0])
                                          .set(awc_data);
                                    }
                                  }).whenComplete(() {
                                    for (int i = 0;
                                        i < gvt_details.length;
                                        i++) {
                                      List<String> mng = gvt_details[i];
                                      Map<String, dynamic> gvt_data = {
                                        "Gvt_name": mng[0],
                                        "Mobile_number": mng[1],
                                        "No_of_children": mng[2],
                                      };
                                      FirebaseFirestore.instance
                                          .collection("Nurse_Details")
                                          .doc("Number")
                                          .collection("Villages")
                                          .doc(village_name)
                                          .collection("Gvt_Details")
                                          .doc(mng[0])
                                          .set(gvt_data)
                                          .whenComplete(() {
                                        for (int i = 0;
                                            i < pvt_details.length;
                                            i++) {
                                          List<String> mnp = pvt_details[i];
                                          Map<String, dynamic> pvt_data = {
                                            "Pvt_name": mnp[0],
                                            "Mobile_number": mnp[1],
                                            "No_of_childres": mnp[2],
                                          };
                                          FirebaseFirestore.instance
                                              .collection("Nurse_Details")
                                              .doc("Number")
                                              .collection("Villages")
                                              .doc(village_name)
                                              .collection("Pvt_Details")
                                              .doc(mn[0])
                                              .set(pvt_data);
                                        }
                                      });
                                    }
                                  });
                                }
                              });
                              Map<String, dynamic> asha = {};
                              Map<String, dynamic> awc = {};
                              Map<String, dynamic> gvt = {};
                              Map<String, dynamic> pvt = {};

                              controller.nextPage(
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.easeIn);
                            },
                            child: Button("Next")),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
