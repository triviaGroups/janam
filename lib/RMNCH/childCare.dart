import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/rowRadioButtonContainer.dart';
import 'package:janam/Widgets/search.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class ChildCare extends StatefulWidget {
  const ChildCare({Key? key}) : super(key: key);

  @override
  _ChildCareState createState() => _ChildCareState();
}

class _ChildCareState extends State<ChildCare> {

  int a = 0;
  int aefi = 0;

  TextEditingController dateOfVisit = new TextEditingController();
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
            topic("Child care", "Select member"),
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
                        "Date of Visit",
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
                        controller: dateOfVisit,
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
                              dateOfVisit.text = formatted;
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
            rowRadioBtnContainer(
                color: colors[(a++) % 4],
                name: "6th week dose",
                item: const ["OPV-1","DPT-1","Hep B-1","PV-1","Rota-1","IPV-1","PCV-1"],
                num: 7,
                height: 700),
            rowRadioBtnContainer(
                color: colors[(a++) % 4],
                name: "10th week dose",
                item: const ["OPV-2","DPT-2","Hep B-2","PV-2","Rota-2"],
                num: 5,
                height: 500),
            rowRadioBtnContainer(
                color: colors[(a++) % 4],
                name: "14th week dose",
                item: const ["OPV-3","DPT-3","Hep B-3","PV-3","IPV-2","PCV-2"],
                num: 6,
                height: 600),
            radioContainer(
              name: "Adverse event following immunization (AEFI)",
              num: 2,
              item: const ["Yes", "No"],
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                aefi = int.parse(val.toString());
                print("$aefi");
              }),
              selectedButton: aefi,
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
