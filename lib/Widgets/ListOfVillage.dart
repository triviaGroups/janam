import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/govtBoxShape.dart';
import 'package:janam/Widgets/pvtBoxShape.dart';
import 'package:janam/Widgets/singleBoxShape.dart';
import 'package:janam/Widgets/subVillageBoxShape.dart';
import 'package:janam/provider/nurseProvider.dart';
import 'package:provider/provider.dart';

import '../List/ashaList.dart';
import '../List/ashaWidgetList.dart';
import '../List/awcList.dart';
import '../List/awcWidgetList.dart';
import '../List/govtSchhols.dart';
import '../List/govtSchoolwidgetList.dart';
import '../List/privateSchools.dart';
import '../List/pvtSchoolWidgetList.dart';
import '../List/villageWidgetList.dart';
import '../constants/color_constants.dart';
import 'ashaBoxShape.dart';
import 'awcBoxShape.dart';


class ListOfVillage extends StatefulWidget {

  final String villageNumber;
  final int ind;
  const ListOfVillage({super.key, required this.villageNumber, required this.ind});

  @override
  State<ListOfVillage> createState() => _ListOfVillageState();
}

class _ListOfVillageState extends State<ListOfVillage> {

  List<ListOfVillage> lsv = villageWidget();
  List<ashaBoxShape> asv = ashaWidget();
  List<awcBoxShape> awv = awcWidget();
  List<govtBoxShape> gsv = gwcWidget();
  List<pvtBoxShape> psv = pvcWidget();

  List<ashaDetailsDataList> ash = ashaDetailsList();
  List<awcDetailsDataList> awc = awcDetailsList();
  List<govtSchoolsDetailsDataList> gwc = govtDetailsList();
  List<privateSchoolsDetailsDataList> pwc = pvtDetailsList();

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
  var tecn = new TextEditingController();
  var tecm = new TextEditingController();
  var tecc = new TextEditingController();
  var tecp = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        subVillageBoxShape(clr: orange,topic: "${widget.villageNumber}-Details",string1:"Village name",string2: "Population",index:widget.ind, ),

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
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 2.5),
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
                                        hintText: ash[index].name,
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    onChanged: (val){

                                    },
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
                              ashaCount++;
                              String temp = "ASHA $ashaCount -Name";
                              ash.add(ashaDetailsDataList(name: temp));
                              asv.add(ashaBoxShape(ashaNumber: "ASHA$ashaCount",index: ashaCount-1,part: widget.ind,));
                              Provider.of<NurseDetails>(context,listen: false).set_asha_count(widget.ind,ash.length);
                              setState(() {

                              });
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
              return ashaBoxShape(ashaNumber: "ASHA "+(index+1).toString(),index: index,part: widget.ind,);
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
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 2.5),
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
                                        hintText: awc[index].name,
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    onChanged: (val){

                                    },
                                    onEditingComplete: (){

                                    },
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
                              awcCount++;
                              String temp = "AWC $awcCount -Details";
                              awc.add(awcDetailsDataList(name: temp));
                              awv.add(awcBoxShape(awcNumber: "AWC$awcCount",index: awcCount-1,part: widget.ind,));
                              Provider.of<NurseDetails>(context,listen: false).set_awc_count(widget.ind,awc.length);
                              setState(() {

                              });
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
              return awcBoxShape(awcNumber: "AWC "+(index+1).toString(),index: index,part: widget.ind,);
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
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 2.5),
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
                                        hintText: gwc[index].name,
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    onChanged: (val){

                                    },
                                    onEditingComplete: (){

                                    },
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
                              govtCount++;
                              String temp = "Goverment School$govtCount -Details";
                              gwc.add(govtSchoolsDetailsDataList(name: temp));
                              gsv.add(govtBoxShape(govtNumber: "Goverment School$govtCount - Details",index: govtCount-1,part: widget.ind,));
                              Provider.of<NurseDetails>(context,listen: false).set_gvt_count(widget.ind,gwc.length);
                              setState(() {

                              });
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
              return govtBoxShape(govtNumber: "Goverment School "+(index+1).toString()+ "- Details",index: index,part: widget.ind,);
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
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 2.5),
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
                                        hintText: pwc[index].name,
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    onChanged: (val){

                                    },
                                    onEditingComplete: (){

                                    },
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
                              pvtCount++;
                              String temp = "Private School$pvtCount -Details";
                              pwc.add(privateSchoolsDetailsDataList(name: temp));
                              psv.add(pvtBoxShape(pvtNumber: "Private School$pvtCount",part: widget.ind,index: pvtCount-1,));
                              Provider.of<NurseDetails>(context,listen: false).set_pvt_count(widget.ind,pwc.length);
                              setState(() {

                              });
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
              return pvtBoxShape(pvtNumber: "Private School "+(index+1).toString()+" - Details",index: index,part: widget.ind,);
            }),

        singleBoxShape(title: "ICE Lined refrigerators", string1: "No. of. ILR's", fun: (val){
          Provider.of<NurseDetails>(context,listen: false).add_ilr(val, widget.ind);
        }),
        singleBoxShape(title: "Freezer", string1: "No. of. freezers", fun: (val){
          Provider.of<NurseDetails>(context,listen: false).add_freezer(val, widget.ind);
        }),
      ],
    );
  }

}
