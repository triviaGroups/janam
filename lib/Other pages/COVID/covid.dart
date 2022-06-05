import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Other%20pages/ORS/ORSpro.dart';
import 'package:janam/Other%20pages/search_common.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class Covid extends StatefulWidget {
  const Covid({Key? key}) : super(key: key);

  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  int a = 0;
  int testResult = 0;
  int dischargeReason = 0;

  List<String> symp = const [
    "Fever",
    "Running nose",
    "Cough",
    "Headache",
    "Sore throat",
    "Loss of smell",
    "Loss of taste",
    "Shortness of breath"
  ];

  List<bool> sympbool = [false,false,false,false,false,false,false,false];

  List<String> r =  const ["Positive","Negative"];
  List<String> reason = const ["Negative results","Quarantine completion","Dead"];

  TextEditingController name =  TextEditingController();
  TextEditingController addr =  TextEditingController();
  TextEditingController dob =  TextEditingController();

  TextEditingController testDate =  TextEditingController();
  TextEditingController resultDate =  TextEditingController();

  TextEditingController source =  TextEditingController();
  TextEditingController place =  TextEditingController();

  TextEditingController admDate =  TextEditingController();
  TextEditingController disDate =  TextEditingController();

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
                topic("COVID 19", "Select member"),
                searchCommon(),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Name of member",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              context.watch<orspro>().name,
                              style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 40,
                    color: colors[(a++) % 4]),
                CheckBoxCont(
                  name: "Symptoms",
                  item: symp,
                  height: 540,
                  a: (a++) % 4,
                  boolean: sympbool,
                ),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Test given date",style: GoogleFonts.poppins(
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
                              controller: testDate,
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
                    height: 60,
                    color: colors[(a++) % 4]),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Result date",
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
                              controller: resultDate,
                              decoration:const  InputDecoration(
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
                radioContainer(
                  name: "Test result",
                  num: 2,
                  item: r,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    testResult = int.parse(val.toString());
                  }),
                  selectedButton: testResult,
                ),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Source of contact",
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
                              controller: source,
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
                    height: 60,
                    color: colors[(a++) % 4]),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Place of treatment",
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
                              controller: place,
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
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Admission date",
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
                              controller: admDate,
                              decoration:const  InputDecoration(
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
                    height: 60,
                    color: colors[(a++) % 4]),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Discharge date",
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
                              controller: disDate,
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
                radioContainer(
                  name: "Reason for discharge",
                  num: 3,
                  item: reason,
                  height: 180,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    dischargeReason = int.parse(val.toString());
                  }),
                  selectedButton: dischargeReason,
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () async{
                    List<String> mn = [];

                    for(int i=0;i<symp.length;i++){
                      if(sympbool[i]){
                        mn.add(symp[i]);
                      }
                    }

                    Map<String, dynamic> data = {
                      "Name" : Provider.of<orspro>(context,listen: false).name,
                      "Address" : addr.text,
                      "DOB" : dob.text,
                      "Symptoms" : mn,
                      "Test date" : testDate.text,
                      "Result date" : resultDate.text,
                      "Admission date" : admDate.text,
                      "Discharge date" : disDate.text,
                      "Test result" : r[testResult],
                      "Source" : source.text,
                      "Place" : place.text,
                      "Reason" : reason[dischargeReason],
                    };
                    await FirebaseFirestore.instance
                        .collection("Covid")
                        .doc(Provider.of<Details>(context, listen: false)
                        .phone).collection(resultDate.text).doc(Provider.of<orspro>(context,listen: false).name)
                        .set(data);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeSub(
                              number:
                              Provider.of<Details>(context, listen: false)
                                  .phone,
                            )));

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
