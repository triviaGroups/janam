import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/singleBoxShape.dart';
import 'package:janam/Widgets/subBoxShape.dart';
import 'package:janam/Widgets/subBoxShape2.dart';
import 'package:janam/Widgets/subVillageBoxShape.dart';

import '../List/villageList.dart';
import '../constants/color_constants.dart';
import 'nameTextfield.dart';

class ListOfVillage extends StatelessWidget {

  final String villageNumber;

  const ListOfVillage({super.key, required this.villageNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        subVillageBoxShape(context, orange, "$villageNumber-Details",
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
                  "List Of ASHA's",
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
              // constraints: BoxConstraints(
              //   maxHeight: double.infinity,
              // ),
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
                            itemCount: vil.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 1),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NameTextField(vil[index].name);
                            }),
                      )),
                  Expanded(
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              villageCount++;
                              String temp = "Village $villageCount -Name";
                              vil.add(villageDetailsDataList(name: temp));
                              vilWid.add(ListOfVillage(villageNumber: 'Village$villageCount',));
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 30,
                            ),
                          ))),
                ],
              ),
            )
          ]),
        ),
        // plusBoxShape(
        //     context, purple, "List of ASHA's", "ASHA Name", ash.length, () {
        //   ashaCount++;
        //   String temp = "ASHA $ashaCount -Name";
        //   ash.add(ashaDetailsDataList(name: temp));
        // }, ash),

        subBoxShape(context, "Asha 1 - Details", "ASHA name", "Mobile no",
            "Village name"),

        // plusBoxShape(
        //     context, purple, "List of AWC's", "AWC Name", awc.length, () {
        //   awcCount++;
        //   String temp = "AWC $awcCount -Name";
        //   awc.add(awcDetailsDataList(name: temp));
        // }, awc),

        subBoxShapeT(context,"AWC1 - Details","AWW name","Mobile No","No. Of. children","Village Name"),
        subBoxShapeT(context,"AWC1 - Details","AWW name","Mobile No","No. Of. children","Village Name"),

        // plusBoxShape(
        //     context, purple, "List of Government School", "Name", gwc.length, () {
        //   govtCount++;
        //   String temp = "Govt School$govtCount -Name";
        //   gwc.add(govtSchoolsDetailsDataList(name: temp));
        // }, gwc),

        subBoxShape(context, "Goverment School1 - Details", "Head of the school", "Mobile no",
            "No.of Children"),

        subBoxShape(context, "Goverment School1 - Details", "Head of the school", "Mobile no",
            "No.of Children"),

        // plusBoxShape(
        //     context, purple, "List of private School", "Private School  Name", pwc.length, () {
        //   pvtCount++;
        //   String temp = "School $pvtCount -Name";
        //   pwc.add(privateSchoolsDetailsDataList(name: temp));
        // }, pwc),

        subBoxShape(context, "Private School1 - Details", "Head of the school", "Mobile no",
            "No.of Children"),

        subBoxShape(context, "Private School1 - Details", "Head of the school", "Mobile no",
            "No.of Children"),

        singleBoxShape(context, "ICE Lined refrigerators", "No. of. ILR's"),

        singleBoxShape(context, "Freezer", "No. of. freezers"),
      ],
    );
  }
}
