import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Other%20pages/ORS/ORSpro.dart';
import 'package:janam/Other%20pages/search_common.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class IDSP extends StatefulWidget {
  const IDSP({Key? key}) : super(key: key);

  @override
  _IDSPState createState() => _IDSPState();
}

class _IDSPState extends State<IDSP> {
  int a = 0;
  int fever = 1;
  int f = 1;
  int l = 1;
  int cough = 1;

  List<String> feverList = const [
    "Only fever",
    "With rash",
    "With bleeding",
    "With daze"
  ];

  List<String> loose =  const [
    "With dehydration",
    "Without dehydration",
    "With blood in stool"
  ];

  List<String> yn = const ["Yes", "No"];
  List<String> c = const ["< 3 weeks","> 3 weeks"];

  TextEditingController name =  TextEditingController();
  TextEditingController jaundice =  TextEditingController();
  TextEditingController paralysis =  TextEditingController();
  TextEditingController symptoms =  TextEditingController();

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
            topic("Integrated Disease Surveillance Program", "Enter member"),
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
            radioContainer(
              name: "Fever < 7 days",
              num: 4,
              item: feverList,
              height: 260,
              a: (a++) % 4,
              press: (val) => setState(() {
                f = int.parse(val.toString());
              }),
              selectedButton: f,
              fun: (val){
                setState(() {
                  f = val;
                });
              },
            ),
            radioContainer(
              name: "Fever > 7 days",
              num: 2,
              item: yn,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                fever = int.parse(val.toString());
              }),
              selectedButton: fever,
              fun: (val){
                setState(() {
                  fever = val;
                });
              },
            ),
            radioContainer(
              name: "Cough with or without fever",
              num: 2,
              item: c,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                cough = int.parse(val.toString());
              }),
              selectedButton: cough,
              fun: (val){
                setState(() {
                  cough = val;
                });
              },
            ),
            radioContainer(
              name: "Loose watery stools of less than 2 weeks",
              num: 2,
              item: loose,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                l = int.parse(val.toString());
              }),
              selectedButton: l,
              fun: (val){
                setState(() {
                  l = val;
                });
              },
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
                          "Jaundice cases of less than 4 weeks - Cause",
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
                          controller: jaundice,
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
                height: 80,
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
                          "Acute flaccid paralysis cases in less than 15 years old",
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
                          controller: paralysis,
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
                height: 100,
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
                          "Unusual symptoms leading to death or hospitalization",
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
                          controller: symptoms,
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
                height: 100,
                color: colors[(a++) % 4]),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: () async{
                Map<String, dynamic> data = {
                  "Name" : Provider.of<orspro>(context,listen: false).name,
                  "Fever" : feverList[f-1],
                  "> 7" : yn[fever-1],
                  "Cough" : c[cough],
                  "Loose stool" : loose[l],
                  "Jaundice" : jaundice.text,
                  "Paralysis" : paralysis.text,
                  "Symptoms" : symptoms.text
                };
                var now = DateTime.now();
                var formatter =  DateFormat('yyyy-MM-dd');
                String formattedDate = formatter.format(now);
                await FirebaseFirestore.instance
                    .collection("IDSP")
                    .doc(Provider.of<Details>(context, listen: false)
                    .phone).collection(formattedDate.toString()).doc(Provider.of<orspro>(context,listen: false).name)
                    .set(data);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(
                  backgroundColor: Colors.black,
                  duration: const Duration(seconds: 2),
                  content: Text(
                    "The details are registered successfully!",
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ));
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
