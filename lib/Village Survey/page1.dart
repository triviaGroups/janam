import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/SearchWidgets/SearchFamily.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/heading.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class vpage1 extends StatefulWidget {
  const vpage1({Key? key}) : super(key: key);

  @override
  _vpage1State createState() => _vpage1State();
}

class _vpage1State extends State<vpage1> {
  String villagename = "Village name";
  String plot = "";
  String street = "";
  String area = "";
  String phone = "";

  String checkValue = "Add new houseHold";

  List<dynamic> villageList = [];

  final List<String> householdList = [
    "Add new houseHold",
    "Add new Family",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    villageList = Provider.of<Details>(context, listen: false).village;
  }

  TextEditingController villageName = TextEditingController();
  TextEditingController plotNo = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController areaName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

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
            topic("Village survey", "Add new household"),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Heading("Select Village"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      isExpanded: true,
                      hint: Text(
                        "Village Name",
                        style: GoogleFonts.poppins(fontSize: 14, color: white),
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
                          .map((item) => DropdownMenuItem<String>(
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
                      onChanged: (value) {
                        setState(() {
                          villagename = value.toString();
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          villagename = value.toString();
                        });
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      isExpanded: true,
                      hint: Text(
                        "Add new household",
                        style: GoogleFonts.poppins(fontSize: 14, color: white),
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
                          .map((householdList) => DropdownMenuItem<String>(
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
                      onChanged: (value) {
                        setState(() {
                          checkValue = value.toString();
                        });
                      },
                      onSaved: (val) {},
                    ),
                  ),
                ],
              ),
            ),
            checkValue == "Add new houseHold"
                ? Column(
                    children: [
                      Heading("Add new household"),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Container(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left: 16, right: 10),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: heading,
                          ),
                          child: Text(
                            villagename.toString(),
                            style:
                                GoogleFonts.inter(fontSize: 14, color: white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: heading),
                          child: TextFormField(
                            controller: plotNo,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 16, right: 10),
                              hintText: "Plot No",
                              border: InputBorder.none,
                              errorMaxLines: 1,
                              hintStyle:
                                  GoogleFonts.inter(fontSize: 14, color: white),
                            ),
                            style:
                                GoogleFonts.inter(fontSize: 14, color: white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: heading),
                          child: TextFormField(
                            controller: streetName,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 16, right: 10),
                              hintText: "Street Name",
                              border: InputBorder.none,
                              errorMaxLines: 1,
                              hintStyle:
                                  GoogleFonts.inter(fontSize: 14, color: white),
                            ),
                            style:
                                GoogleFonts.inter(fontSize: 14, color: white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: heading),
                          child: TextFormField(
                            controller: areaName,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 16, right: 10),
                              hintText: "Area Name",
                              border: InputBorder.none,
                              errorMaxLines: 1,
                              hintStyle:
                                  GoogleFonts.inter(fontSize: 14, color: white),
                            ),
                            style:
                                GoogleFonts.inter(fontSize: 14, color: white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: heading),
                          child: TextFormField(
                            controller: phoneNumber,
                            inputFormatters: [LengthLimitingTextInputFormatter(10)],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 16, right: 10),
                              hintText: "Phone Number",
                              border: InputBorder.none,
                              errorMaxLines: 1,
                              hintStyle:
                                  GoogleFonts.inter(fontSize: 14, color: white),
                            ),
                            style:
                                GoogleFonts.inter(fontSize: 14, color: white),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(),
            const SizedBox(
              height: 15,
            ),
            checkValue != "Add new houseHold"
                ? Column(
                    children: [
                      Heading("Select Household"),
                      const SizedBox(
                        height: 15,
                      ),
                      FamilySearch(villagename: villagename),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )
                : Column(),
            GestureDetector(
                onTap: () {
                  villagename == "Village name"
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.black,
                            duration: const Duration(seconds: 2),
                            content: Text(
                              "Select village",
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                          ));
                        }
                      : checkValue == "Add new houseHold"
                          ? {
                              if (plotNo.text.isEmpty || streetName.text.isEmpty || areaName.text.isEmpty || phoneNumber.text.isEmpty)
                                {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: const Duration(seconds: 2),
                                    content: Text(
                                      "No field should be left empty",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ))
                                }
                              else
                                {_addhousehold()}
                            }
                          : {};

                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> vPage2()));
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

  void _addhousehold() async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection("Village Details")
        .doc(villagename)
        .collection("Family")
        .doc();

    DocumentSnapshot docSnap = await docRef.get();
    var doc = docSnap.reference.id;

    Map<String, dynamic> data = {
      "Village name": villagename,
      "Plot no": plotNo.text,
      "Street name": streetName.text,
      "Area name": areaName.text,
      "Mobile": phoneNumber.text,
      "Doc id": doc.toString(),
    };

    await FirebaseFirestore.instance
        .collection("Village Details")
        .doc(villagename)
        .collection("Family")
        .doc(doc)
        .set(data)
        .whenComplete(() => Navigator.pop(context));
  }
}
