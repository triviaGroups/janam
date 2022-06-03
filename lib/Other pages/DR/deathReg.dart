import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/SearchWidgets/search.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class DeathReg extends StatefulWidget {
  const DeathReg({Key? key}) : super(key: key);

  @override
  _DeathRegState createState() => _DeathRegState();
}

class _DeathRegState extends State<DeathReg> {

  TextEditingController name = new TextEditingController();
  TextEditingController addr = new TextEditingController();
  TextEditingController dob = new TextEditingController();

  TextEditingController dateDeath = new TextEditingController();
  TextEditingController cause1 = new TextEditingController();
  TextEditingController cause2 = new TextEditingController();
  TextEditingController place = new TextEditingController();
  TextEditingController dateEntry = new TextEditingController();

  int a = 0;
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
                topic("Death register", "Enter member"),
                Cont(
                    child: Column(
                      children: [
                        Expanded(child: Row(
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
                              flex: 2,
                              child: Container(

                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  controller: name,
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                  ),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: black),
                                ),
                              ),),
                          ],
                        ),),
                        Expanded(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Address",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  controller: addr,
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                  ),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: black),
                                ),
                              ),),
                          ],
                        ),),
                        Expanded(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Date of birth",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  controller: dob,
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                  ),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: black),
                                ),
                              ),),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () async{
                                      var datePicked =
                                      await DatePicker.showSimpleDatePicker(
                                        context,
                                        initialDate: DateTime(1994),
                                        firstDate: DateTime(1960),
                                        lastDate: DateTime(2022),
                                        dateFormat: "dd-MMMM-yyyy",
                                        locale: DateTimePickerLocale.en_us,
                                        looping: true,
                                      );
                                      final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                      final String formatted = formatter. format(datePicked!);
                                      setState((){
                                        dob.text = formatted;
                                      });
                                      final snackBar = SnackBar(
                                          content:
                                          Text("Date Picked $formatted"));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    child: Icon(Icons.calendar_today_outlined,color: Colors.black87,size: 24,)),
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                    height: 300,
                    color: colors[(a++) % 4]),

                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Date of Death",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              controller: dateDeath,
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10, right: 10,bottom: 5),
                                border: InputBorder.none,
                              ),
                              style:GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () async{
                                  var datePicked =
                                  await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime(1994),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2022),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                  final String formatted = formatter. format(datePicked!);
                                  setState((){
                                    dateDeath.text = formatted;
                                  });
                                  final snackBar = SnackBar(
                                      content:
                                      Text("Date Picked $formatted"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Icon(Icons.calendar_today_outlined,color: Colors.black87,size: 24,)),
                          ),
                        )
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
                              "Cause of death",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(

                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: TextFormField(
                                      controller: cause1,
                                      decoration: InputDecoration(
                                          hintText: "",
                                          contentPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                      ),
                                      style:
                                      GoogleFonts.poppins(fontSize: 14, color: black),
                                    ),
                                  ),),
                                Expanded(child: Container()),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: TextFormField(
                                      controller: cause2,
                                      decoration: InputDecoration(
                                          hintText: "",
                                          contentPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                      ),
                                      style:
                                      GoogleFonts.poppins(fontSize: 14, color: black),
                                    ),
                                  ),),
                              ],
                            )
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
                              "Place of death",
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
                          flex: 4,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Date of Entry",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              controller: dateEntry,
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10, right: 10,bottom: 5),
                                border: InputBorder.none,
                              ),
                              style:GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () async{
                                  var datePicked =
                                  await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime(1994),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2022),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                  final String formatted = formatter. format(datePicked!);
                                  setState((){
                                    dateEntry.text = formatted;
                                  });
                                  final snackBar = SnackBar(
                                      content:
                                      Text("Date Picked $formatted"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Icon(Icons.calendar_today_outlined,color: Colors.black87,size: 24,)),
                          ),
                        )
                      ],
                    ),
                    height: 40,
                    color: colors[(a++) % 4]),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () async{
                    Map<String, dynamic> data = {
                      "Name" : name.text,
                      "Address" : addr.text,
                      "DOB" : dob.text,
                      "DOD" : dateDeath.text,
                      "Cause" : [cause1.text,cause2.text],
                      "Place" : place.text,
                      "DOE" : dateEntry.text,
                    };
                    var now = new DateTime.now();
                    var formatter = new DateFormat('yyyy-MM-dd');
                    String formattedDate = formatter.format(now);
                    await FirebaseFirestore.instance
                        .collection("Death")
                        .doc(Provider.of<Details>(context, listen: false)
                        .phone).collection(dateEntry.text).doc(name.text)
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
