import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/search.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class PostnatalCare extends StatefulWidget {
  const PostnatalCare({Key? key}) : super(key: key);

  @override
  _PostnatalCareState createState() => _PostnatalCareState();
}

class _PostnatalCareState extends State<PostnatalCare> {
  int a = 0;
  int method = 0;

  TextEditingController dateVisit = new TextEditingController();
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
                topic("Postnatal Care", "Select member"),
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
                            "Date of visit",
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
                            controller: dateVisit,
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
                                  dateVisit.text = formatted;
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
                    name: "No. of IFA tablets given",
                    count: 0,
                    height: 60,
                    add: (){},
                    sub: (){},
                  ),
                ),
                radioContainer(
                  name: "Method of contraception",
                  num: 2,
                  item: const ["Sterlization", "Nil"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    method = int.parse(val.toString());
                    print("$method");
                  }),
                  selectedButton: method,
                ),
                CheckBoxCont(
                  name: "Mother danger signs",
                  item: const [
                    "Bleeding",
                    "Fever",
                    "Foul smelling discharge",
                    "Abdominal cramps",
                    "Painful breast or cracked nipples",
                    "Mental disturbance","Facial or hand swelling",
                    "Headaches","Convulsions","Painful calf muscles"
                      ],
                  height: 760,
                  a: (a++) % 4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "Weight of the child",
                    count: 0,
                    height: 60,
                    add: (){},
                    sub: (){},
                  ),
                ),

                CheckBoxCont(
                  name: "Infant danger signs",
                  item: const [
                    "Difficult breathing",
                    "Skin lesions",
                    "Yellow skin",
                    "Convulsion",
                    "Poor sucking, feeding",
                    "Lethargy or unconsciousness",
                    "Pur or bleeding",
                    "red or swollen eyes with pus",
                  ],
                  height: 600,
                  a: (a++) % 4,
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
                              "Referral facility for mother",
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
                              "Referral facility for infant",
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
                              "Name of the child",
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
