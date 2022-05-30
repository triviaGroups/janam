import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Village%20Survey/page2.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/dropdown.dart';
import 'package:janam/Widgets/heading.dart';
import 'package:janam/Widgets/search.dart';
import 'package:janam/Widgets/textbox.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class vpage1 extends StatefulWidget {
  const vpage1({Key? key}) : super(key: key);

  @override
  _vpage1State createState() => _vpage1State();
}

class _vpage1State extends State<vpage1> {

  String check_value = "Add new houseHold";

  final List<String> villageList = [
    "Village 1",
    "Village 2",
  ];

  final List<String> householdList = [
    "Add new houseHold",
    "Add new Family",
  ];

  TextEditingController villageName = new TextEditingController();
  TextEditingController plotNo = new TextEditingController();
  TextEditingController streetName = new TextEditingController();
  TextEditingController areaName = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            topic("Village survey","Add new household"),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Heading("Select Village"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                    child:
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),),
                      isExpanded: true,
                      hint: Text(
                        "Village Name",
                        style: GoogleFonts.poppins(fontSize: 14,color: white),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: white,
                      ),
                      iconSize: 30,
                      buttonHeight: 52,
                      buttonDecoration: BoxDecoration(
                        color: heading,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      items: villageList
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ))
                          .toList(),
                      validator: (value) {

                      },
                      onChanged: (value) {

                      },
                      onSaved: (value) {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Heading("Add New"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                    child:
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),),
                      isExpanded: true,
                      hint: Text(
                        "Add new household",
                        style: GoogleFonts.poppins(fontSize: 14,color: white),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: white,
                      ),
                      iconSize: 30,
                      buttonHeight: 52,
                      buttonDecoration: BoxDecoration(
                        color: heading,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      items: householdList
                          .map((householdList) =>
                          DropdownMenuItem<String>(
                            value: householdList,
                            child: Text(
                              householdList,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ))
                          .toList(),
                      validator: (value) {

                      },
                      onChanged: (value) {
                        setState((){
                          check_value = value.toString();
                          print(check_value);
                        });
                      },
                      onSaved: (val) {

                      },
                    ),
                  ),
                ],
              ),
            ),
            check_value == "Add new houseHold"?Column(
              children: [
                Heading("Add new household"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: heading
                    ),
                    child: TextFormField(
                      controller: villageName,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16, right: 10),
                        hintText: "Village Name",
                        border: InputBorder.none,
                        errorMaxLines: 1,
                        hintStyle: GoogleFonts.inter(fontSize: 14, color: white),
                      ),
                      style: GoogleFonts.inter(fontSize: 14, color: black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: heading
                    ),
                    child: TextFormField(
                      controller: plotNo,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16, right: 10),
                        hintText: "Plot No",
                        border: InputBorder.none,
                        errorMaxLines: 1,
                        hintStyle: GoogleFonts.inter(fontSize: 14, color: white),
                      ),
                      style: GoogleFonts.inter(fontSize: 14, color: black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: heading
                    ),
                    child: TextFormField(
                      controller: streetName,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16, right: 10),
                        hintText: "Street Name",
                        border: InputBorder.none,
                        errorMaxLines: 1,
                        hintStyle: GoogleFonts.inter(fontSize: 14, color: white),
                      ),
                      style: GoogleFonts.inter(fontSize: 14, color: black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: heading
                    ),
                    child: TextFormField(
                      controller: areaName,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16, right: 10),
                        hintText: "Area Name",
                        border: InputBorder.none,
                        errorMaxLines: 1,
                        hintStyle: GoogleFonts.inter(fontSize: 14, color: white),
                      ),
                      style: GoogleFonts.inter(fontSize: 14, color: black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: heading
                    ),
                    child: TextFormField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16, right: 10),
                        hintText: "Phone Number",
                        border: InputBorder.none,
                        errorMaxLines: 1,
                        hintStyle: GoogleFonts.inter(fontSize: 14, color: white),
                      ),
                      style: GoogleFonts.inter(fontSize: 14, color: black),
                    ),
                  ),
                ),
              ],
            ) : Column(),
            SizedBox(height: 15,),
            check_value != "Add new houseHold"? Column(
              children: [
                Heading("Select Household"),
                SizedBox(height: 15,),
                searchWidget(),
                const SizedBox(
                  height: 16,
                ),
              ],
            ): Column(),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> vPage2()));
              },
                child: Button("Next")),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ));
  }
}
