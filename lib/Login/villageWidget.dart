import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/List/villageWidgetList.dart';
import 'package:janam/Widgets/button.dart';
import '../List/ashaList.dart';
import '../List/awcList.dart';
import '../List/govtSchools.dart';
import '../List/privateSchools.dart';
import '../constants/color_constants.dart';

class village extends StatefulWidget {
  final int villagecount;
  final List<String> villageName;
  final String number;
  const village(
      {Key? key,
      required this.villagecount,
      required this.villageName,
      required this.number})
      : super(key: key);

  @override
  _villageState createState() => _villageState();
}

class _villageState extends State<village> {
  List<village> lsv = villageWidget();

  List<ashaDetailsDataList> ash = ashaDetailsList();
  List<awcDetailsDataList> awck = awcDetailsList();
  List<govtSchoolsDetailsDataList> gwc = govtDetailsList();
  List<privateSchoolsDetailsDataList> pwc = pvtDetailsList();

  List<int> ashaCount = [];
  List<int> awcCount = [];
  List<int> govtCount = [];
  List<int> pvtCount = [];

  String pop = "";

  List<List<String>> ashaDetails = [];
  List<List<String>> awcDetails = [];
  List<List<String>> gvtDetails = [];
  List<List<String>> pvtDetails = [];

  String ilr = "";
  String freezer = "";

  @override
  void initState() {
    ash = ashaDetailsList();
    awck = awcDetailsList();
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
            physics: const NeverScrollableScrollPhysics(),
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
                            onTap: () {},
                            child: Container(),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                widget.villageName[index] + " -  Details",
                                softWrap: false,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.poppins(
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: 150,
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
                                  "Village ${index + 1} - Details",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 100,
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
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: purple),
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            widget.villageName[index],
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Colors.grey.shade900),
                                          ),
                                        )),
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
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: purple),
                                          ),
                                        )),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            child: TextFormField(
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              maxLines: 1,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    10),
                                              ],
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  hintText: "Enter population",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                              onChanged: (val) {
                                                setState(() {
                                                  pop = val;
                                                });
                                              },
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: ashaCount[index] == 0 || ashaCount[index] == 1
                              ? 126
                              : ashaCount[index] * 60,
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
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "List of ASHA's",
                                        softWrap: false,
                                        maxLines: 3,
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 16),
                                      child: GestureDetector(
                                        onTap: () {
                                          List<String> mn = ["", ""];
                                          ashaDetails.add(mn);
                                          ashaCount[index]++;
                                          String temp =
                                              "ASHA ${ashaCount[index]} -Name";
                                          ash.add(
                                              ashaDetailsDataList(name: temp));
                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Container(
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
                                        margin: const EdgeInsets.only(top: 15),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "ASHA Name",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: purple),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: const EdgeInsets.only(top: 15),
                                        child: ListView.builder(
                                            itemCount: ashaCount[index],
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.only(
                                                bottom: 1),
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemBuilder: (context, ashin) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  ashaDetails[ashin][0]
                                                      .toString(),
                                                  softWrap: true,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color:
                                                          Colors.grey.shade900),
                                                ),
                                              );
                                            }),
                                      )),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: ashaCount[index],
                            padding: const EdgeInsets.only(bottom: 1),
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, ashaind) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
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
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "ASHA " +
                                            (ashaind + 1).toString() +
                                            " - Details",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 140,
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Name",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              25),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            ashaDetails[ashaind]
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Mobile number",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            ashaDetails[ashaind]
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Village name",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  widget.villageName[index],
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color:
                                                          Colors.grey.shade900),
                                                ),
                                              )),
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: awcCount[index] == 0 || awcCount[index] == 1 ? 126 : awcCount[index]*60,
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
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "List of AWC's",
                                        softWrap: false,
                                        maxLines: 3,
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(right: 8),
                                      child: GestureDetector(
                                        onTap: () {
                                          awcCount[index]++;
                                          List<String> mn = ["", "", ""];
                                          awcDetails.add(mn);
                                          String temp =
                                              "AWC ${awcCount[index]} -Details";
                                          awck.add(awcDetailsDataList(
                                              name: temp));

                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      )),
                                ],
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
                                        margin: const EdgeInsets.only(top: 15),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "AWC Name",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: purple),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: const EdgeInsets.only(top: 15),
                                        child: ListView.builder(
                                            itemCount: awcCount[index],
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.only(
                                                bottom: 1),
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemBuilder: (context, awin) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  awcDetails[awin][0]
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color:
                                                          Colors.grey.shade900),
                                                ),
                                              );
                                            }),
                                      )),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: awcCount[index],
                            padding: const EdgeInsets.only(bottom: 1),
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, awcind) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
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
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "AWC " +
                                            (awcind + 1).toString() +
                                            " - Details",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 190,
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "AWC name",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              25),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            awcDetails[awcind]
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Mobile number",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            awcDetails[awcind]
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "No. of children",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              5),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                          awcDetails[awcind]
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Village Name",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 12,
                                                      horizontal: 32),
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    widget.villageName[index],
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color: Colors
                                                            .grey.shade900),
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: govtCount[index] == 0 || govtCount[index] == 1 ? 126 : govtCount[index]*60,
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
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "List of Government Schools",
                                        softWrap: false,
                                        maxLines: 3,
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(right: 8),
                                      child: GestureDetector(
                                        onTap: () {
                                          govtCount[index]++;
                                          List<String> mn = [
                                            "",
                                            "",
                                            "",
                                            ""
                                          ];
                                          gvtDetails.add(mn);
                                          String temp =
                                              "Government School${govtCount[index]} -Details";
                                          gwc.add(
                                              govtSchoolsDetailsDataList(
                                                  name: temp));

                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ))
                                ],
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
                                        margin: const EdgeInsets.only(top: 15),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Name",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: purple),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: const EdgeInsets.only(top: 15),
                                        child: ListView.builder(
                                            itemCount: govtCount[index],
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.only(
                                                bottom: 1),
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemBuilder: (context, gvin) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  gvtDetails[gvin][0]
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color:
                                                          Colors.grey.shade900),
                                                ),
                                              );
                                            }),
                                      )),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: govtCount[index],
                            padding: const EdgeInsets.only(bottom: 1),
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, gvtind) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                height: 300,
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
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Government School " +
                                            (gvtind + 1).toString() +
                                            "- Details",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 260,
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Name of the school",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              30),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            gvtDetails[gvtind]
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Head of the school",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              25),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
                                                                hintText:
                                                                    "Enter head name",
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
                                                            gvtDetails[gvtind]
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Mobile Number",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            gvtDetails[gvtind]
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
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "No. of children",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              5),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            gvtDetails[gvtind]
                                                                [3] = val;
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          height: pvtCount[index] == 0 || pvtCount[index] == 1 ? 126 : pvtCount[index]*60,
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
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "List of Private Schools",
                                        softWrap: false,
                                        maxLines: 3,
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(right: 8),
                                      child: GestureDetector(
                                        onTap: () {
                                          pvtCount[index]++;
                                          List<String> mn = [
                                            "",
                                            "",
                                            "",
                                            ""
                                          ];
                                          pvtDetails.add(mn);
                                          String temp =
                                              "Private School${pvtCount[index]} -Details";
                                          pwc.add(
                                              privateSchoolsDetailsDataList(
                                                  name: temp));

                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ))
                                ],
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
                                        margin: const EdgeInsets.only(top: 15),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Name",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: purple),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: const EdgeInsets.only(top: 15),
                                        child: ListView.builder(
                                            itemCount: pvtCount[index],
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.only(
                                                bottom: 1),
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemBuilder: (context, pvin) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  pvtDetails[pvin][0]
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color:
                                                          Colors.grey.shade900),
                                                ),
                                              );
                                            }),
                                      )),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: pvtCount[index],
                            padding: const EdgeInsets.only(bottom: 1),
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, pvtind) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                height: 300,
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
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Private School " +
                                            (pvtind + 1).toString() +
                                            " - Details",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 260,
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Name of the school",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              30),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            pvtDetails[pvtind]
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 32),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Head of the school",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              25),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
                                                                hintText:
                                                                    "Enter head name",
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
                                                            pvtDetails[pvtind]
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Mobile number",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              10),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            pvtDetails[pvtind]
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
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 12),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "No. of children",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: purple),
                                                ),
                                              )),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0.5,
                                                        vertical: 2.5),
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                                      margin:EdgeInsets.only(right:8),
                                                      child: TextFormField(
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        maxLines: 1,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              5),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                isDense: true,
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
                                                            pvtDetails[pvtind]
                                                                [3] = val;
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
                          margin: const EdgeInsets.symmetric(
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
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "ICE Lined refrigerators",
                                  style: GoogleFonts.poppins(
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
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 32),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "No. of. ILR's",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: purple),
                                          ),
                                        )),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "0",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
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
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "Freezer",
                                  style: GoogleFonts.poppins(
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
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 32),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "No. of. freezers",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: purple),
                                          ),
                                        )),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "0",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
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
                    const SizedBox(
                      height: 24,
                    ),
                    index == widget.villagecount - 1
                        ? GestureDetector(
                            onTap: () {
                              bool one = true;
                              bool two = true;
                              bool three = true;
                              bool four = true;

                              List<String> asha = [];
                              List<String> awc = [];
                              List<String> gvt = [];
                              List<String> pvt = [];

                              for (int i = 0; i < ashaDetails.length; i++) {
                                List<String> mn = ashaDetails[i];
                                for (int j = 0; j < mn.length; j++) {
                                  if (mn[j].isEmpty || mn[j] == "") {
                                    one = false;
                                  }
                                }
                                asha.add(mn[0]);
                              }

                              for (int i = 0; i < awcDetails.length; i++) {
                                List<String> mn = awcDetails[i];
                                for (int j = 0; j < mn.length; j++) {
                                  if (mn[j].isEmpty || mn[j] == "") {
                                    two = false;
                                  }
                                }
                                awc.add(mn[0]);
                              }

                              for (int i = 0; i < gvtDetails.length; i++) {
                                List<String> mn = gvtDetails[i];
                                for (int j = 0; j < mn.length; j++) {
                                  if (mn[j].isEmpty || mn[j] == "") {
                                    three = false;
                                  }
                                }
                                gvt.add(mn[0]);
                              }

                              for (int i = 0; i < pvtDetails.length; i++) {
                                List<String> mn = pvtDetails[i];
                                for (int j = 0; j < mn.length; j++) {
                                  if (mn[j].isEmpty || mn[j] == "") {
                                    four = false;
                                  }
                                }
                                pvt.add(mn[0]);
                              }

                              if (pop.isEmpty || pop == "") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.black,
                                  duration: const Duration(seconds: 2),
                                  content: Text(
                                    "Enter the population",
                                    style: GoogleFonts.poppins(fontSize: 18),
                                  ),
                                ));
                              } else {
                                if (!one) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Check if all the asha details are entered",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (!two) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Check if all the awc details are entered",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (!three) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Check if all the Govt school details are entered",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (!four) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Check if all the Private school details are entered",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (ilr.isEmpty || ilr == "") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Enter the number of ILR",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (freezer.isEmpty || freezer == "") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Enter the number of freezer",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else {
                                  EnterData(asha, awc, gvt, pvt,
                                          widget.villageName[index])
                                      .whenComplete(
                                          () => Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => HomeSub(
                                                        number: widget.number,
                                                      ))));
                                }
                              }
                            },
                            child: Button("Save"))
                        : GestureDetector(
                            onTap: () {
                              bool one = true;
                              bool two = true;
                              bool three = true;
                              bool four = true;

                              List<String> asha = [];
                              List<String> awc = [];
                              List<String> gvt = [];
                              List<String> pvt = [];

                              for (int i = 0; i < ashaDetails.length; i++) {
                                List<String> mn = ashaDetails[i];
                                for (int j = 0; j < mn.length; j++) {
                                  if (mn[j].isEmpty || mn[j] == "") {
                                    one = false;
                                  }
                                }
                                asha.add(mn[0]);
                              }

                              for (int i = 0; i < awcDetails.length; i++) {
                                List<String> mn = awcDetails[i];
                                for (int j = 0; j < mn.length; j++) {
                                  if (mn[j].isEmpty || mn[j] == "") {
                                    two = false;
                                  }
                                }
                                awc.add(mn[0]);
                              }

                              for (int i = 0; i < gvtDetails.length; i++) {
                                List<String> mn = gvtDetails[i];
                                for (int j = 0; j < mn.length; j++) {
                                  if (mn[j].isEmpty || mn[j] == "") {
                                    three = false;
                                  }
                                }
                                gvt.add(mn[0]);
                              }

                              for (int i = 0; i < pvtDetails.length; i++) {
                                List<String> mn = pvtDetails[i];
                                for (int j = 0; j < mn.length; j++) {
                                  if (mn[j].isEmpty || mn[j] == "") {
                                    four = false;
                                  }
                                }
                                pvt.add(mn[0]);
                              }

                              if (pop.isEmpty || pop == "") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.black,
                                  duration: const Duration(seconds: 2),
                                  content: Text(
                                    "Enter the population",
                                    style: GoogleFonts.poppins(fontSize: 18),
                                  ),
                                ));
                              } else {
                                if (!one) {
                                  print(asha);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Check if all the asha details are entered",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (!two) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Check if all the awc details are entered",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (!three) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Check if all the Govt school details are entered",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (!four) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Check if all the Private school details are entered",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (ilr.isEmpty || ilr == "") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Enter the number of ILR",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else if (freezer.isEmpty || freezer == "") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "Enter the number of freezer",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ));
                                } else {
                                  EnterData(asha, awc, gvt, pvt,
                                          widget.villageName[index])
                                      .whenComplete(() => controller.nextPage(
                                          duration: Duration(milliseconds: 10),
                                          curve: Curves.easeIn));
                                }
                              }
                            },
                            child: Button("Next")),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Future<void> EnterData(List<String> asha, List<String> awc, List<String> gvt,
      List<String> pvt, String villageName) async {
    Map<String, dynamic> data = {
      "Name": villageName,
      "Population": pop,
      "Ilr": ilr,
      "Freezer": freezer,
      "Asha": asha,
      "Awc": awc,
      "Gvt": gvt,
      "Pvt": pvt,
    };

    FirebaseFirestore.instance
        .collection("Details")
        .doc(widget.number)
        .collection("village")
        .doc(villageName)
        .set(data)
        .whenComplete(() {
          for (int i = 0; i < ashaDetails.length; i++) {
            List<String> mn = ashaDetails[i];
            Map<String, dynamic> ashaData = {
              "Asha_name": mn[0],
              "Mobile_number": mn[1],
            };
            FirebaseFirestore.instance
                .collection("Details")
                .doc(widget.number)
                .collection("village")
                .doc(villageName)
                .collection("Asha")
                .doc(mn[0])
                .set(ashaData)
                .whenComplete(() {
              for (int i = 0; i < awcDetails.length; i++) {
                List<String> mna = awcDetails[i];
                Map<String, dynamic> awcData = {
                  "Awc_name": mna[0],
                  "Mobile_number": mna[1],
                  "No_of_children": mna[2],
                };
                FirebaseFirestore.instance
                    .collection("Details")
                    .doc(widget.number)
                    .collection("village")
                    .doc(villageName)
                    .collection("Awc")
                    .doc(mna[0])
                    .set(awcData);
              }
            }).whenComplete(() {
              for (int i = 0; i < gvtDetails.length; i++) {
                List<String> mng = gvtDetails[i];
                Map<String, dynamic> gvtData = {
                  "Gvt_name": mng[0],
                  "Mobile_number": mng[1],
                  "No_of_children": mng[2],
                };
                FirebaseFirestore.instance
                    .collection("Details")
                    .doc(widget.number)
                    .collection("village")
                    .doc(villageName)
                    .collection("Gvt")
                    .doc(mng[0])
                    .set(gvtData)
                    .whenComplete(() {
                  for (int i = 0; i < pvtDetails.length; i++) {
                    List<String> mnp = pvtDetails[i];
                    Map<String, dynamic> pvtData = {
                      "Pvt_name": mnp[0],
                      "Mobile_number": mnp[1],
                      "No_of_children": mnp[2],
                    };
                    FirebaseFirestore.instance
                        .collection("Details")
                        .doc(widget.number)
                        .collection("village")
                        .doc(villageName)
                        .collection("Pvt")
                        .doc(mn[0])
                        .set(pvtData);
                  }
                });
              }
            });
          }
        })
        .whenComplete(() => FirebaseFirestore.instance
            .collection("Village Details")
            .doc(villageName))
        .whenComplete(() {
          ashaCount = [];
          awcCount = [];
          govtCount = [];
          pvtCount = [];

          villageName = "";
          pop = "";

          ashaDetails = [];
          awcDetails = [];
          gvtDetails = [];
          pvtDetails = [];

          ilr = "";
          freezer = "";
        });
  }
}
