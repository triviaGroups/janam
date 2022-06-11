import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class StockReg extends StatefulWidget {
  const StockReg({Key? key}) : super(key: key);

  @override
  _StockRegState createState() => _StockRegState();
}

class _StockRegState extends State<StockReg> {
  int a = 0;
  int f = 1;
  List<String> list = ["Incoming","Issue"];
  String selected = "";
  List<String> stockList = ["Folic acid",
    "T. Albandazole",
    "T. Calcium",
    "T. IFA",
    "WIFS",
    "Syp. Amoxyline",
    "Pentavalent",
    "TT",
    "BCG",
    "IPV","Hep B",
    "DPT",
    "Syr. IFA",
    "T. Paracetamol",
    "ORS Vitamin A",
    "T. Zinc Sulphate",
    "Inj. Iron Sucrose",
    "OPV",
    "Napkins",];

  TextEditingController initial =  TextEditingController();
  TextEditingController num =  TextEditingController();
  TextEditingController dateEntry =  TextEditingController();
  TextEditingController finale =  TextEditingController();

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
                topic("Stock", ""),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 16),
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    isExpanded: true,
                    hint: Text(
                      "Select Stock",
                      style: GoogleFonts.poppins(fontSize: 14, color: white),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: white,
                    ),
                    iconSize: 30,
                    buttonHeight: 52,
                    buttonDecoration: BoxDecoration(
                      color: heading,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      color: purple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    items: stockList
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ))
                        .toList(),

                    onChanged: (value) {
                      setState(() {
                        selected = value.toString();
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selected = value.toString();
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
                              "Initial Balance",
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
                              controller: initial,
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
                  name: "Type of stock entry",
                  num: 2,
                  item: list,
                  height: 120,
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
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "No. of stock",
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
                              controller: num,
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
                              decoration:const  InputDecoration(
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
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1960,1),
                                    lastDate: DateTime(2022,12),
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
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Final Balance",
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
                              controller: finale,
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
                  onTap: () async{
                    Map<String, dynamic> data = {
                      "Stock" : selected,
                      "initial" : initial.text,
                      "type" : list[f-1],
                      "DOE" : dateEntry.text,
                      "Number" : num.text,
                      "Final" : finale.text
                    };
                    await FirebaseFirestore.instance
                        .collection("Stock")
                        .doc(Provider.of<Details>(context, listen: false)
                        .phone).collection(selected).doc(dateEntry.text)
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
