import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/multisearch.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';


class NIPI extends StatefulWidget {
  const NIPI({Key? key}) : super(key: key);

  @override
  _NIPIState createState() => _NIPIState();
}

class _NIPIState extends State<NIPI> {
  int a = 0;
  int children_participated = 0;
  int awc_name = 0;

  TextEditingController dateNIPI = new TextEditingController();

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
                topic("NIPI", "Select child"),
                SearchMulti(
                  num: children_participated-1,
                ),
                radioContainer(
                  name: "Children participated",
                  num: 3,
                  item: const ["Raj, 4 years","Raj, 4 years","Raj, 4 years"],
                  height: 160,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    children_participated = int.parse(val.toString());
                    print("$children_participated");
                  }),
                  selectedButton: children_participated,
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
                              "Date of administration",
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
                              controller: dateNIPI,
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
                                    dateNIPI.text = formatted;
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
                  name: "AWC name",
                  num: 3,
                  item: const ["AWC 1","AWC 2","AWC 3"],
                  height: 160,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    awc_name = int.parse(val.toString());
                    print("$awc_name");
                  }),
                  selectedButton: awc_name,
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
