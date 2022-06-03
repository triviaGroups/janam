import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Other%20pages/TC/Tcpro.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class TempChart extends StatefulWidget {
  const TempChart({Key? key}) : super(key: key);

  @override
  _TempChartState createState() => _TempChartState();
}

class _TempChartState extends State<TempChart> {
  int a = 0;
  int ILR = 0;
  int ILRsun = 0;
  int ILRlocked = 0;
  int ILRdefrost = 0;
  int ILRsocket = 0;
  int food = 0;
  int vaccine = 0;
  int rotated = 0;
  int door = 0;
  int frozen = 0;
  int expiry = 0;

  List<String> yn = const ["Yes","No"];

  TextEditingController dateCharting = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final datePicked = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter. format(datePicked);
    dateCharting.text = formatted;
  }

  TextEditingController name = new TextEditingController();
  TextEditingController num = new TextEditingController();

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
                topic("Temperature chart", "Enter freezer"),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Name of ILR",
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
                              controller:  name,
                              decoration: InputDecoration(
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
                              "Date of visit",
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
                              controller: dateCharting,
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10, right: 10,bottom: 5),
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
                  name: "Is the ILR level?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    ILR = int.parse(val.toString());
                    print("$ILR");
                  }),
                  selectedButton: ILR,
                ),
                radioContainer(
                  name: "Is the ILR, away from sun?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    ILRsun = int.parse(val.toString());
                    print("$ILRsun");
                  }),
                  selectedButton: ILRsun,
                ),
                radioContainer(
                  name: "Is the ILR, locked?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    ILRlocked = int.parse(val.toString());
                    print("$ILRlocked");
                  }),
                  selectedButton: ILRlocked,
                ),
                radioContainer(
                  name: "Is the ILR, defrosted periodically?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    ILRdefrost = int.parse(val.toString());
                    print("$ILRdefrost");
                  }),
                  selectedButton: ILRdefrost,
                ),
                radioContainer(
                  name: "Is the ILR, plugged to socket permanently",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    ILRsocket = int.parse(val.toString());
                    print("$ILRsocket");
                  }),
                  selectedButton: ILRsocket,
                ),
                radioContainer(
                  name: "Is the ILR, used for food or drinks?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    food = int.parse(val.toString());
                    print("$food");
                  }),
                  selectedButton: food,
                ),
                radioContainer(
                  name: "Are the vaccines, stacked neatly?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    vaccine = int.parse(val.toString());
                    print("$vaccine");
                  }),
                  selectedButton: vaccine,
                ),
                radioContainer(
                  name: "Are the vaccines, rotated?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    rotated = int.parse(val.toString());
                    print("$rotated");
                  }),
                  selectedButton: rotated,
                ),
                radioContainer(
                  name: "Are the vaccines, kept in the door?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    door = int.parse(val.toString());
                    print("$door");
                  }),
                  selectedButton: door,
                ),
                radioContainer(
                  name: "Are the vaccines, frozen?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    frozen = int.parse(val.toString());
                    print("$frozen");
                  }),
                  selectedButton: frozen,
                ),
                radioContainer(
                  name: "Are the vaccines, date expired?",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    expiry = int.parse(val.toString());
                    print("$expiry");
                  }),
                  selectedButton: expiry,
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
                              "No. of ice packs prepared this month?",
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
                              controller:  num,
                              decoration: InputDecoration(
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
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colors[(a++)%4],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(1, 2),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Temp. in deep freezer - 8.00 am",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
                                color: Colors.transparent,
                                child: Text(
                                  "ILR",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: black),
                                ),
                              )),
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          Provider.of<tcpro>(context,listen: false).incI8();
                                          setState(() {

                                          });
                                        },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, 0),

                                              child: const Icon(
                                                Icons.add,
                                                color: black,
                                                size: 16,
                                              ),
                                            )),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text(
                                          context.watch<tcpro>().I8.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: black),
                                        ),
                                      )),
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          Provider.of<tcpro>(context,listen: false).decI8();
                                          setState(() {

                                          });
                                        },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, -4),

                                              child: const Icon(
                                                Icons.minimize,
                                                color: black,
                                                size: 16,
                                              ),
                                            )),
                                      )),
                                ],
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
                                color: Colors.transparent,
                                child: Text(
                                  "Deep freezer",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: black),
                                ),
                              )),
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          Provider.of<tcpro>(context,listen: false).incD8();
                                          setState(() {

                                          });
                                        },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, 0),

                                              child: const Icon(
                                                Icons.add,
                                                color: black,
                                                size: 16,
                                              ),
                                            )),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text(
                                          context.watch<tcpro>().D8.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: black),
                                        ),
                                      )),
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          Provider.of<tcpro>(context,listen: false).decD8();
                                          setState(() {

                                          });
                                        },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, -4),

                                              child: const Icon(
                                                Icons.minimize,
                                                color: black,
                                                size: 16,
                                              ),
                                            )),
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colors[(a++)%4],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(1, 2),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Temp. in deep freezer - 2.00 pm",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
                                color: Colors.transparent,
                                child: Text(
                                  "ILR",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: black),
                                ),
                              )),
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          Provider.of<tcpro>(context,listen: false).incI2();
                                          setState(() {

                                          });
                                        },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, 0),

                                              child: const Icon(
                                                Icons.add,
                                                color: black,
                                                size: 16,
                                              ),
                                            )),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text(
                                          context.watch<tcpro>().I2.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: black),
                                        ),
                                      )),
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          Provider.of<tcpro>(context,listen: false).decI2();
                                          setState(() {

                                          });
                                        },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, -4),

                                              child: const Icon(
                                                Icons.minimize,
                                                color: black,
                                                size: 16,
                                              ),
                                            )),
                                      )),
                                ],
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
                                color: Colors.transparent,
                                child: Text(
                                  "Deep freezer",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: black),
                                ),
                              )),
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          Provider.of<tcpro>(context,listen: false).incD2();
                                          setState(() {

                                          });
                                        },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, 0),

                                              child: const Icon(
                                                Icons.add,
                                                color: black,
                                                size: 16,
                                              ),
                                            )),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text(
                                          context.watch<tcpro>().D2.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: black),
                                        ),
                                      )),
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          Provider.of<tcpro>(context,listen: false).decD2();
                                          setState(() {

                                          });
                                        },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Transform.translate(
                                            offset: Offset(0, -4),
                                              child: const Icon(
                                                Icons.minimize,
                                                color: black,
                                                size: 16,
                                              ),
                                            )),
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () async{
                    Map<String, dynamic> data = {
                      "Name" : name.text,
                      "Date" : dateCharting.text,
                      "Level" : yn[ILR-1],
                      "Away from sun" : yn[ILRsun-1],
                      "Locked" : yn[ILRlocked-1],
                      "Defrosted" : yn[ILRdefrost-1],
                      "Plugged" : yn[ILRsocket-1],
                      "Food or drinks" : yn[food-1],
                      "Stacked" : yn[vaccine-1],
                      "Rotated" : yn[rotated-1],
                      "Door" : yn[door-1],
                      "Frozen" : yn[frozen-1],
                      "Expire" : yn[expiry-1],
                    };

                    await FirebaseFirestore.instance
                        .collection("Temperature Chart")
                        .doc(Provider.of<Details>(context, listen: false)
                        .phone).collection(dateCharting.text).doc(name.text)
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
                  child: Button("Save"),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ));
  }
}
