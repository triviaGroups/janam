import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:janam/Login/villageWidget.dart';
import 'package:path/path.dart' as Path;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/List/awcList.dart';
import 'package:janam/List/govtSchools.dart';
import 'package:janam/List/privateSchools.dart';
import 'package:janam/List/villageWidgetList.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:janam/provider/nurseProvider.dart';
import 'package:provider/provider.dart';
import '../List/ashaList.dart';
import '../List/villageList.dart';

class nurseDetails extends StatefulWidget {
  final String number;
  const nurseDetails({super.key, required this.number});

  @override
  State<nurseDetails> createState() => _nurseDetailsState();
}

class _nurseDetailsState extends State<nurseDetails> {
  List<village> vilWid = villageWidget();
  List<villageDetailsDataList> vil = villageDetailsList();
  List<ashaDetailsDataList> ash = ashaDetailsList();
  List<awcDetailsDataList> awc = awcDetailsList();
  List<govtSchoolsDetailsDataList> gwc = govtDetailsList();
  List<privateSchoolsDetailsDataList> pwc = pvtDetailsList();

  static int villageCount = 0;

  List<String> villageName = [];
  String name = "";
  String phcn = "";
  String sub = "";

  UploadTask? task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: appBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160,
              width: double.infinity,
              color: purple,
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Text(
                  "Setting your profile",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 24, color: orange),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(top: 30),
                height: 50,
                width: double.infinity,
                child: TextFormField(
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16, color: black),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 8),
                      border: InputBorder.none,
                      hintText: "Full Name",
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: purple)),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(top: 30),
                height: 50,
                width: double.infinity,
                child: TextFormField(
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16, color: black),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 8),
                      border: InputBorder.none,
                      hintText: "Primary Health Center Name",
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: purple)),
                  onChanged: (val) {
                    setState(() {
                      phcn = val;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(top: 30),
                height: 50,
                width: double.infinity,
                child: TextField(
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16, color: black),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 8),
                      border: InputBorder.none,
                      hintText: "Sub Center name",
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: purple)),
                  onChanged: (val) {
                    setState(() {
                      sub = val;
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Upload Photo",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: purple),
                          ),
                          Text(
                            "Take a photo or choose from gallery",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: purple),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await selectFile().whenComplete(() {
                          final file =
                              Provider.of<NurseDetails>(context, listen: false)
                                  .get_file()!;
                          final filename = Path.basename(file.path);
                          final destination = 'files/$filename';
                          task = FirebaseApi.uploadFile(destination, file);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: const FaIcon(
                          FontAwesomeIcons.camera,
                          color: Colors.grey,
                          size: 27,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              width: double.infinity,
              height: villageCount == 0 || villageCount == 1 ? 100 : villageCount* 70,
              decoration: BoxDecoration(
                border: Border.all(width: 0.1, color: Colors.black38),
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
              child: Column(
                  children: [
                Container(
                  width : MediaQuery.of(context).size.width,
                  height: 35,
                  decoration: BoxDecoration(
                    color: purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "List Of Villages",
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
                              villageCount++;
                              villageName.add("");
                              String temp =
                                  "Village ${villageCount + 1} -Name";
                              vil.add(villageDetailsDataList(name: temp));
                              vilWid.add(village(
                                villagecount: villageCount,
                                villageName: villageName,
                                number: widget.number,
                              ));
                              //Provider.of<NurseDetails>(context,listen: false).set_village_count(vil.length);
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
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 35,
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
                                "Village Name",
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
                              width: double.infinity,
                              margin: const EdgeInsets.only(right: 8),
                              child: ListView.builder(
                                  itemCount: villageCount,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 1),
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.5, vertical: 2.5),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: TextFormField(
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(50),
                                          ],
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              isDense: true,
                                              hintText: vil[index].name,
                                              hintStyle: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              )),
                                          onChanged: (val) {
                                            setState(() {
                                              villageName[index] = val;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                            )),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            GestureDetector(
              onTap: () {
                if (name.isEmpty ||
                    name == "" ||
                    phcn.isEmpty ||
                    phcn == "" ||
                    sub.isEmpty ||
                    sub == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.black,
                    duration: const Duration(seconds: 2),
                    content: Text(
                      "No field should be left empty",
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                  ));
                } else {
                  int k = villageName.length;
                  bool mn = true;
                  for (int i = 0; i < k; i++) {
                    if (villageName[i] == "" || villageName.isEmpty) {
                      mn = false;
                    }
                  }
                  if (mn) {
                    Map<String, dynamic> data = {
                      "Name": name,
                      "Villages": villageName,
                      "Phcn": phcn,
                      "sub": sub,
                    };
                    FirebaseFirestore.instance
                        .collection("Details")
                        .doc(widget.number)
                        .set(data);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => village(
                              villagecount: vilWid.length,
                              villageName: villageName,
                              number: widget.number,
                            )));

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.black,
                      duration: const Duration(seconds: 2),
                      content: Text(
                        "Enter the village names for the selected villages",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ));
                  }
                }
              },
              child: Button("Next"),
            ),
          ],
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) {
      return;
    }

    final path = result.files.single.path!;

    Provider.of<NurseDetails>(context, listen: false)
        .add_file(File(path) as File);
  }
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
