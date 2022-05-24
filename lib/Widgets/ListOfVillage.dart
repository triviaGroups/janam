import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/govtBoxShape.dart';
import 'package:janam/Widgets/pvtBoxShape.dart';
import 'package:janam/Widgets/singleBoxShape.dart';
import 'package:janam/Widgets/subBoxShape.dart';
import 'package:janam/Widgets/subBoxShape2.dart';
import 'package:janam/Widgets/subVillageBoxShape.dart';

import '../List/ashaList.dart';
import '../List/ashaWidgetList.dart';
import '../List/awcList.dart';
import '../List/awcWidgetList.dart';
import '../List/govtSchhols.dart';
import '../List/govtSchoolwidgetList.dart';
import '../List/privateSchools.dart';
import '../List/pvtSchoolWidgetList.dart';
import '../List/villageList.dart';
import '../List/villageWidgetList.dart';
import '../constants/color_constants.dart';
import 'ashaBoxShape.dart';
import 'awcBoxShape.dart';
import 'nameTextfield.dart';

class ListOfVillage extends StatefulWidget {

  final String villageNumber;

  const ListOfVillage({super.key, required this.villageNumber});

  @override
  State<ListOfVillage> createState() => _ListOfVillageState();
}

class _ListOfVillageState extends State<ListOfVillage> {

  List<ListOfVillage> lsv = villageWidget();
  List<ashaBoxShape> asv = ashaWidget();
  List<awcBoxShape> awv = awcWidget();
  List<govtBoxShape> gsv = gwcWidget();
  List<pvtBoxShape> psv = pvcWidget();

  List<ashaDetailsDataList> ash = <ashaDetailsDataList>[];
  List<awcDetailsDataList> awc = <awcDetailsDataList>[];
  List<govtSchoolsDetailsDataList> gwc = <govtSchoolsDetailsDataList>[];
  List<privateSchoolsDetailsDataList> pwc = <privateSchoolsDetailsDataList>[];

  static int ashaCount = 1;
  static int awcCount = 1;
  static int govtCount = 1;
  static int pvtCount = 1;

  @override
  void initState() {
    ash = ashaDetailsList();
    asv = ashaWidget();
    awc = awcDetailsList();
    gwc = govtDetailsList();
    pwc = pvtDetailsList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        subVillageBoxShape(context, orange, "${widget.villageNumber}-Details",
            "Village name", "Population"),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: 126,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 0.1, color: Colors.black38),
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
                            itemCount: ash.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 1),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NameTextField(ash[index].name);
                            }),
                      )),
                  Expanded(
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              ashaCount++;
                              String temp = "ASHA $ashaCount -Details";
                              ash.add(ashaDetailsDataList(name: temp));
                              asv.add(ashaBoxShape(ashaNumber: "ASHA$ashaCount"));
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
            itemCount: asv.length,
            padding: EdgeInsets.only(bottom: 1),
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return ashaBoxShape(ashaNumber: "ASHA$ashaCount");
            }),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: 126,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 0.1, color: Colors.black38),
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
                            itemCount: awc.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 1),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NameTextField(awc[index].name);
                            }),
                      )),
                  Expanded(
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              awcCount++;
                              String temp = "AWC $awcCount -Details";
                              awc.add(awcDetailsDataList(name: temp));
                              awv.add(awcBoxShape(awcNumber: "AWC$awcCount"));
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
            itemCount: awc.length,
            padding: EdgeInsets.only(bottom: 1),
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return awcBoxShape(awcNumber: "AWC$awcCount");
            }),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: 126,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 0.1, color: Colors.black38),
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
                            itemCount: gwc.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 1),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NameTextField(gwc[index].name);
                            }),
                      )),
                  Expanded(
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              govtCount++;
                              String temp = "Goverment School$govtCount -Details";
                              gwc.add(govtSchoolsDetailsDataList(name: temp));
                              gsv.add(govtBoxShape(govtNumber: "Goverment School$govtCount - Details"));
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
            itemCount: gwc.length,
            padding: EdgeInsets.only(bottom: 1),
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return govtBoxShape(govtNumber: "Goverment School$govtCount - Details");
            }),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: 126,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 0.1, color: Colors.black38),
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
                            itemCount: pwc.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 1),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NameTextField(pwc[index].name);
                            }),
                      )),
                  Expanded(
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              pvtCount++;
                              String temp = "Private School$pvtCount -Details";
                              pwc.add(privateSchoolsDetailsDataList(name: temp));
                              psv.add(pvtBoxShape(pvtNumber: "Private School$pvtCount"));
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
            itemCount: pwc.length,
            padding: EdgeInsets.only(bottom: 1),
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return pvtBoxShape(pvtNumber: "Private School$pvtCount");
            }),

        singleBoxShape(context, "ICE Lined refrigerators", "No. of. ILR's"),

        singleBoxShape(context, "Freezer", "No. of. freezers"),
      ],
    );
  }

}
