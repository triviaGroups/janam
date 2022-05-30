import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/search.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class EligibleCouple extends StatefulWidget {
  const EligibleCouple({Key? key}) : super(key: key);

  @override
  _EligibleCoupleState createState() => _EligibleCoupleState();
}

class _EligibleCoupleState extends State<EligibleCouple> {
  int a = 0;
  int method = 0;
  int ster = 0;
  int tempster = 0;
  int test = 0;
  int result = 0;
  int reason = 0;
  int newmode = 0;

  TextEditingController dateTracking = new TextEditingController();
  TextEditingController dateSerializ = new TextEditingController();
  TextEditingController dateSupply = new TextEditingController();
  TextEditingController dateInjection = new TextEditingController();
  TextEditingController timeInjection = new TextEditingController();
  TextEditingController dateDiscontinue = new TextEditingController();
  TextEditingController dateInsertion = new TextEditingController();
  TextEditingController dateAbortion = new TextEditingController();

  TimeOfDay time = TimeOfDay(hour: 10, minute: 45);
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
            topic("Eligible Couple", ""),
            searchWidget(),
            Cont(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\nAddress",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: black),
                    ),
                    Text(
                      "Plot No. 00, Street Name, Area Name,City, State - Pincode",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: txt),
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ],
                ),
                height: 120,
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
                          "Date of Tracking",
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
                          controller: dateTracking,
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
                                dateTracking.text = formatted;
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
                          "LMP",
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
                          onChanged: (val) {},
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
            radioContainer(
              name: "Method of contraception used",
              num: 4,
              item: const [
                "Permanent",
                "Temporary",
                "Currently pregnant",
                "Not using any"
              ],
              height: 240,
              a: (a++) % 4,
              press: (val) => setState(() {
                method = int.parse(val.toString());
                print("$method");
              }),
              selectedButton: method,
            ),
            radioContainer(
              name: "If permanent sterlization, \n\nType of sterlization",
              num: 2,
              item: const ["Vasectomy", "Tubectomy"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                ster = int.parse(val.toString());
                print("$ster");
              }),
              selectedButton: ster,
            ),
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
                          "Date of sterlization",
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
                          controller: dateSerializ,
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
                                dateSerializ.text = formatted;
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
                          "Reason of sterlization",
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
                          onChanged: (val) {},
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
            radioContainer(
              name: "If temporary sterlization, \n\nMethod used",
              num: 4,
              item: const ["Condoms", "OCPs", "Injections", "Devices"],
              height: 240,
              a: (a++) % 4,
              press: (val) => setState(() {
                tempster = int.parse(val.toString());
                print("$tempster");
              }),
              selectedButton: tempster,
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
                          "Number of condoms distributed",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
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
                          onChanged: (val) {},
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
                          "Name of OCP",
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
                          onChanged: (val) {},
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
                          "Date of supply",
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
                          controller: dateSupply,
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
                                dateSupply.text = formatted;
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: incDec(
                color: colors[(a++) % 4],
                name: "Body weight (kg)",
                count: "60",
                height: 60,
              ),
            ),
            Container(
              height: 69,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: colors[(a++) % 4],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(1, 2),
                    ),
                  ]),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    color: Colors.transparent,
                    child: Text(
                      "BP",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: black),
                    ),
                  )),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, right: 8),
                                  color: Colors.transparent,
                                  child: Text(
                                    "Sys",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: black),
                                  ),
                                )),
                            Expanded(
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
                                  )),
                            )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  color: Colors.transparent,
                                  child: Text(
                                    "120",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: black),
                                  ),
                                )),
                            Expanded(
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
                                  )),
                            )),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, right: 8),
                                  color: Colors.transparent,
                                  child: Text(
                                    "Dia",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: black),
                                  ),
                                )),
                            Expanded(
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
                                  )),
                            )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  color: Colors.transparent,
                                  child: Text(
                                    "80",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: black),
                                  ),
                                )),
                            Expanded(
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
                                  )),
                            )),
                          ],
                        ),
                      )),
                ],
              ),
            ),
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
                          "Date of Injection",
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
                          controller: dateInjection,
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
                                dateInjection.text = formatted;
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
                          "Place of injection",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
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
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                hintText: "Intromuscular",
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
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                hintText: "Subcutaneous",
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
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Time of Injection",
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
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          controller: timeInjection,
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.only(left: 10, right: 10,bottom: 7),
                            border: InputBorder.none,
                          ),
                          style:
                          GoogleFonts.poppins(fontSize: 14, color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async{
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),

                          ).then((value){
                            setState((){
                              time = value!;
                            });
                          });
                          setState((){
                            String crtTime = time.format(context).toString();
                            timeInjection.text = crtTime;
                            print(crtTime);
                          });

                          final snackBar = SnackBar(
                              content:
                              Text("Time Picked ${timeInjection.text}"));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                        },
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.watch_later_outlined,color: Colors.black87,size: 30,)),
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
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Date of insertion",
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
                          controller: dateInsertion,
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
                                dateInsertion.text = formatted;
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
                          "Place of insertion",
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
                                  onChanged: (val) {},
                                  decoration: InputDecoration(
                                      hintText: "DH",
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
                                  onChanged: (val) {},
                                  decoration: InputDecoration(
                                      hintText: "PHC",
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
                                  onChanged: (val) {},
                                  decoration: InputDecoration(
                                      hintText: "Others",
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
                height: 140,
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
                          "Type of IUCD insertion",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
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
                          onChanged: (val) {},
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
            radioContainer(
              name: "If pregnant \n\nPregnancy test conducted?",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                test = int.parse(val.toString());
                print("$test");
              }),
              selectedButton: test,
            ),
            radioContainer(
              name: "Pregnancy test result",
              num: 2,
              item: const ["Positive", "Negative"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                result = int.parse(val.toString());
                print("$result");
              }),
              selectedButton: result,
            ),
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
                          "Date of discontinuation",
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
                          controller: dateDiscontinue,
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
                                dateDiscontinue.text = formatted;
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
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Date of abortion",
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
                          controller: dateAbortion,
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
                                dateAbortion.text = formatted;
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
            radioContainer(
              name: "Reason for discontinuing",
              num: 3,
              item: const [
                "Planning child",
                "Menopause",
                "New mode of contraception"
              ],
              height: 200,
              a: (a++) % 4,
              press: (val) => setState(() {
                reason = int.parse(val.toString());
                print("$reason");
              }),
              selectedButton: reason,
            ),
            radioContainer(
              name: "If new mode of contraception, \nNew method",
              num: 5,
              item: const [
                "OCPs",
                "Injections",
                "Sterlizations",
                "Devices",
                "Condoms"
              ],
              height: 300,
              a: (a++) % 4,
              press: (val) => setState(() {
                newmode = int.parse(val.toString());
                print("$newmode");
              }),
              selectedButton: newmode,
            ),
            const SizedBox(
              height: 32,
            ),
            Button("Save"),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ));
  }
}

