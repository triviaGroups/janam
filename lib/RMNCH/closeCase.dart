import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/SearchWidgets/search.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';


class CloseCase extends StatefulWidget {
  const CloseCase({Key? key}) : super(key: key);

  @override
  _CloseCaseState createState() => _CloseCaseState();
}

class _CloseCaseState extends State<CloseCase> {
  int a = 0;
  int close = 0;
  int reason = 0;
  int place = 0;
  int cause = 0;
  int death = 0;
  int dc = 0;

  TextEditingController dateMaternal =  TextEditingController();
  TextEditingController dateInfant =  TextEditingController();
  TextEditingController dateAbortion =  TextEditingController();
  TextEditingController dateDC =  TextEditingController();

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
                topic("Closing the case", "Select member"),
                searchWidget(),
                Cont(
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Harine",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Text(
                                  ", Female, 23 years",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: txt),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                            )),
                      ],
                    ),
                    height: 150,
                    color: colors[(a++) % 4]),
                radioContainer(
                  name: "Would you like to close the case",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    close = int.parse(val.toString());
                  }),
                  selectedButton: close,
                ),
                radioContainer(
                  name: "Reason for closure",
                  num: 5,
                  item: const ["Completed","Migration","Maternal death","Infant death","Abortion"],
                  height: 320,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    reason = int.parse(val.toString());
                  }),
                  selectedButton: reason,
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
                              "Probable cause of maternal death",
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
                  name: "Place of maternal death",
                  num: 3,
                  item: const ["Home","Hospital","In transit"],
                  height: 200,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    place = int.parse(val.toString());
                  }),
                  selectedButton: place,
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
                            "Date of maternal death",
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
                            controller: dateMaternal,
                            decoration: const InputDecoration(
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
                                  dateMaternal.text = formatted;
                                });
                                final snackBar = SnackBar(
                                    content:
                                    Text("Date Picked $formatted"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: const Icon(Icons.calendar_today_outlined,color: Colors.black87,size: 24,)),
                        ),
                      )
                    ],
                  ),
                  height: 40,
                  color: colors[(a++) % 4]),
                radioContainer(
                  name: "Probable cause of infant death",
                  num: 6,
                  item: const ["Asphyxia","Low birth weight","High fever","Diarrhoea","Pneumonia","Others"],
                  height: 360,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    cause = int.parse(val.toString());
                  }),
                  selectedButton: cause,
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
                              "If others,",style: GoogleFonts.poppins(
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
                  name: "Place of infant death",
                  num: 3,
                  item: const ["Home","Hospital","In transit"],
                  height: 200,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    death= int.parse(val.toString());
                  }),
                  selectedButton: death,
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
                            "Date of infant death",
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
                            controller: dateInfant,
                            decoration: const InputDecoration(
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
                                  dateInfant.text = formatted;
                                });
                                final snackBar = SnackBar(
                                    content:
                                    Text("Date Picked $formatted"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: const Icon(Icons.calendar_today_outlined,color: Colors.black87,size: 24,)),
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
                              decoration: const InputDecoration(
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
                                child: const Icon(Icons.calendar_today_outlined,color: Colors.black87,size: 24,)),
                          ),
                        )
                      ],
                    ),
                    height: 40,
                    color: colors[(a++) % 4]),
                radioContainer(
                  name: "Was dilation and curettage (D&C) done?",
                  num: 2,
                  item: const ["Yes","No"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    dc = int.parse(val.toString());
                  }),
                  selectedButton: dc,
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
                              "Place of D&C",style: GoogleFonts.poppins(
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
                          "Date of D&C",
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
                          controller: dateDC,
                          decoration: const InputDecoration(
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
                                dateDC.text = formatted;
                              });
                              final snackBar = SnackBar(
                                  content:
                                  Text("Date Picked $formatted"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const Icon(Icons.calendar_today_outlined,color: Colors.black87,size: 24,)),
                      ),
                    )
                  ],
                ),
                height: 40,
                color: colors[(a++) % 4]),
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
