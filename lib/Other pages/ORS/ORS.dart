import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Other%20pages/ORS/ORSpro.dart';
import 'package:janam/Other%20pages/search_common.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class ORS extends StatefulWidget {
  const ORS({Key? key}) : super(key: key);

  @override
  _ORSState createState() => _ORSState();
}

class _ORSState extends State<ORS> {
  int a = 0;

  TextEditingController name = TextEditingController();
  TextEditingController ors = TextEditingController();
  TextEditingController iron = TextEditingController();
  TextEditingController a1 = TextEditingController();
  TextEditingController a2 = TextEditingController();

  TextEditingController height =  TextEditingController();
  TextEditingController weight =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    a = 0;
    return SafeArea(
        child: Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            topic("ORS", "Select member"),
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
                          "Name of child",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "Height",
                tec: height,
                fun: (val){
                Provider.of<orspro>(context,listen: false).setHeight(height.text);
              },
                count: Provider.of<orspro>(context,listen: false).height,
                height: 60,
                add: (){
                  Provider.of<orspro>(context,listen: false).incHeight();
                  height.text = Provider.of<orspro>(context,listen: false).height.toString();
                  setState(() {

                  });
                },
                sub: (){
                  Provider.of<orspro>(context,listen: false).decHeight();
                  height.text = Provider.of<orspro>(context,listen: false).height.toString();
                  setState(() {

                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                tec: weight,
                name: "Weight (kg)",
                fun: (val){
                  Provider.of<orspro>(context,listen: false).setWeight(weight.text);
                },
                count: Provider.of<orspro>(context,listen: false).weight,
                height: 60,
                add: (){
                  Provider.of<orspro>(context,listen: false).incWeight();
                  weight.text = Provider.of<orspro>(context,listen: false).weight.toString();
                  setState(() {

                  });
                },
                sub: (){
                  Provider.of<orspro>(context,listen: false).decWeight();
                  weight.text = Provider.of<orspro>(context,listen: false).weight.toString();
                  setState(() {

                  });
                },
              ),
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
                          "ORS",
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
                          controller: ors,
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
                          "Iron syrup",
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
                          controller: iron,
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
                          "Albendazole - 1",
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
                          controller: a1,
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
                          "Albendazole - 2",
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
                          controller: a2,
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
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
                onTap: () async {
                  Map<String, dynamic> data = {
                    "Name": Provider.of<orspro>(context,listen: false).name,
                    "Height":
                        Provider.of<orspro>(context, listen: false).height,
                    "Weight":
                        Provider.of<orspro>(context, listen: false).weight,
                    "ORS": ors.text,
                    "Iron": iron.text,
                    "Alb - 1": a1.text,
                    "Alb - 2": a2.text,
                  };
                  var now = DateTime.now();
                  var formatter = DateFormat('yyyy-MM-dd');
                  String formattedDate = formatter.format(now);
                  await FirebaseFirestore.instance
                      .collection("ORS")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection(formattedDate.toString())
                      .doc(Provider.of<orspro>(context,listen: false).name)
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
