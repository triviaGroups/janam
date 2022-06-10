import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Login/villageWidget.dart';
import 'package:janam/Village%20Survey/page3.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class vPage2 extends StatefulWidget {
  final String docId;
  final String VillageName;
  final String Address;
  const vPage2(
      {Key? key,
      required this.docId,
      required this.VillageName,
      required this.Address})
      : super(key: key);

  @override
  _vPage2State createState() => _vPage2State();
}

class _vPage2State extends State<vPage2> {
  int a = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a = 0;
  }

  int count = 0;

  bool isSwitched = true;
  bool isSwitchedHead = true;
  int currentIndex = 0;

  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void toggleSwitchHead(bool value) {
    if (isSwitchedHead == false) {
      setState(() {
        isSwitchedHead = true;
        a = 0;
      });
    } else {
      setState(() {
        isSwitchedHead = true;
        a = 0;
      });
    }
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        a = 0;
      });
    } else {
      setState(() {
        isSwitched = false;
        a = 0;
      });
    }
  }

  String _headDob = '';
  String _spouseDob = '';
  String _marraigeDate = '';

  List<String> head = ["", "", "", "", "", "", "", "", ""];
  List<String> spouse = ["", "", "", "", "", "", "", "", ""];

  TextEditingController headdob =  TextEditingController();
  TextEditingController spousedob = TextEditingController();
  TextEditingController marriagedate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    a = 0;
    return SafeArea(
        child: Scaffold(
            backgroundColor: white,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                child: Column(children: [
              const SizedBox(
                height: 16,
              ),
              topic("Village survey", "Add new family"),
              const SizedBox(
                height: 8,
              ),

              SwitchMethodHead("Head of the household"),
              isSwitchedHead
                  ? Cont(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        head[0] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Name",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date of Birth",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: black),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          controller: headdob,
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            hintText: "YYYY-MM-DD",
                                            errorMaxLines: 1,
                                            hintStyle: GoogleFonts.poppins(
                                                fontSize: 14, color: txt),
                                          ),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14, color: black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                        onTap: () async {
                                          var datePicked = await DatePicker
                                              .showSimpleDatePicker(
                                            context,
                                            initialDate: DateTime(1994),
                                            firstDate: DateTime(1960),
                                            lastDate: DateTime(2022),
                                            dateFormat: "dd-MMMM-yyyy",
                                            locale: DateTimePickerLocale.en_us,
                                            looping: true,
                                          );
                                          final DateFormat formatter =
                                              DateFormat('yyyy-MM-dd');
                                          final String formatted =
                                              formatter.format(datePicked!);
                                          setState(() {
                                            _headDob = formatted;
                                            headdob.text = _headDob;
                                          });
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  "Date Picked $formatted"));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        child: const Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.black87,
                                          size: 25,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Aadhaar Number",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        head[2] = val;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(12),
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Aadhaar Number",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.poppins(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone Number",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        head[3] = val;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Phone Number",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.poppins(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        head[4] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Gender",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Education",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        head[5] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Education",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Occupation",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        head[6] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Occupation",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Family Income",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        head[7] = val;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Family Income per annum",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Disability Status",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        head[8] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Yes/No",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 92 * 10,
                      color: c1)
                  : Container(),
                  const SizedBox(
                height: 20,
              ),
              SwitchMethod("Details of Spouse"),
                  const SizedBox(
                height: 20,
              ),
              isSwitched
                  ? Cont(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date of marriage",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: black),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          controller: marriagedate,
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            hintText: "YYYY-MM-DD",
                                            errorMaxLines: 1,
                                            hintStyle: GoogleFonts.poppins(
                                                fontSize: 14, color: txt),
                                          ),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14, color: black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                        onTap: () async {
                                          var datePicked = await DatePicker
                                              .showSimpleDatePicker(
                                            context,
                                            initialDate: DateTime(1994),
                                            firstDate: DateTime(1960),
                                            lastDate: DateTime(2022),
                                            dateFormat: "dd-MMMM-yyyy",
                                            locale: DateTimePickerLocale.en_us,
                                            looping: true,
                                          );
                                          final DateFormat formatter =
                                              DateFormat('yyyy-MM-dd');
                                          final String formatted =
                                              formatter.format(datePicked!);
                                          setState(() {
                                            _marraigeDate = formatted;
                                            marriagedate.text = _marraigeDate;
                                          });
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  "Date Picked $formatted"));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        child: const Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.black87,
                                          size: 25,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        spouse[1] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Name",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date of Birth",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: black),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          controller: spousedob,
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            hintText: "YYYY-MM-DD",
                                            errorMaxLines: 1,
                                            hintStyle: GoogleFonts.poppins(
                                                fontSize: 14, color: txt),
                                          ),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14, color: black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                        onTap: () async {
                                          var datePicked = await DatePicker
                                              .showSimpleDatePicker(
                                            context,
                                            initialDate: DateTime(1994),
                                            firstDate: DateTime(1960),
                                            lastDate: DateTime(2022),
                                            dateFormat: "dd-MMMM-yyyy",
                                            locale: DateTimePickerLocale.en_us,
                                            looping: true,
                                          );
                                          final DateFormat formatter =
                                              DateFormat('yyyy-MM-dd');
                                          final String formatted =
                                              formatter.format(datePicked!);
                                          setState(() {
                                            _spouseDob = formatted;
                                            spousedob.text = _spouseDob;
                                          });
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  "Date Picked $formatted"));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        child: const Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.black87,
                                          size: 25,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Aadhaar Number",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        spouse[3] = val;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(12),
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Aadhaar Number",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.poppins(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone Number",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        spouse[4] = val;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Phone Number",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.poppins(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        spouse[5] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Gender",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Education",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        spouse[6] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Education",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Occupation",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        spouse[7] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Occupation",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Disability Status",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        spouse[8] = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Yes/No",
                                      errorMaxLines: 1,
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14, color: txt),
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 92 * 10,
                      color: c2)
                  : Container(),
                  const SizedBox(
                height: 24,
              ),
              GestureDetector(
                  onTap: () async {
                    setState(() {
                      head[1] = headdob.text;
                    });
                    setState(() {
                      spouse[0] = marriagedate.text;
                      spouse[2] = spousedob.text;
                    });

                    bool ok = true;

                    for(int i=0;i<head.length;i++){
                      if(head[i] == ""){
                        ok = false;
                      }
                    }

                    for(int i=0;i<spouse.length;i++){
                      if(spouse[i] == ""){
                        ok = false;
                      }
                    }

                   if(ok){
                     DocumentReference docRef = FirebaseFirestore.instance
                         .collection("Village Details")
                         .doc(widget.VillageName)
                         .collection("Family")
                         .doc(widget.docId)
                         .collection("Household")
                         .doc();

                     DocumentSnapshot docSnap = await docRef.get();
                     var doc = docSnap.reference.id;

                     Map<String, dynamic> data = {
                       "isHead": isSwitchedHead,
                       "isSpouse": isSwitched,
                       "head": head,
                       "spouse": spouse,
                       "docId": doc,
                     };

                     Map<String,dynamic> m1 = {
                       "Name" : head[0],
                       "DOB" : head[1],
                       "Village" : widget.VillageName,
                       "Gender" : "Male",
                       "docId" : doc,
                       "Address" : widget.Address,
                     };

                     Map<String,dynamic> m2 = {
                       "Name" : spouse[1],
                       "DOB" : spouse[2],
                       "Village" : widget.VillageName,
                       "Gender" : "Female",
                       "docId" : doc,
                       "Address" : widget.Address,
                     };

                     await FirebaseFirestore.instance
                         .collection("Village Members")
                         .doc(Provider.of<Details>(context, listen: false).phone)
                         .collection("Members")
                         .doc()
                         .set(m1).whenComplete(() async{
                       await FirebaseFirestore.instance
                           .collection("Village Members")
                           .doc(Provider.of<Details>(context, listen: false).phone)
                           .collection("Members")
                           .doc()
                           .set(m2);
                     });

                     await FirebaseFirestore.instance
                         .collection("Village Details")
                         .doc(widget.VillageName)
                         .collection("Family")
                         .doc(widget.docId)
                         .collection("Household")
                         .doc(doc)
                         .set(data);

                     Navigator.pushReplacement(
                         context,
                         MaterialPageRoute(
                             builder: (context) => vPage3(
                               docId: widget.docId,
                               VillageName: widget.VillageName,
                               head: head,
                               spouse: spouse,
                               Address: widget.Address,
                               familyId: doc,
                             )));
                   }
                   else{
                     ScaffoldMessenger.of(context)
                         .showSnackBar(SnackBar(
                       backgroundColor: Colors.black,
                       duration: const Duration(seconds: 2),
                       content: Text(
                         "No field should be left empty",
                         style: GoogleFonts.poppins(fontSize: 18),
                       ),
                     ));
                   }

                  },
                  child: Button("Save")),
                  const SizedBox(
                height: 24,
              ),
            ]))));
  }

  Padding SwitchMethod(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600, color: black),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              width: 35,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Transform.scale(
                    scale: 2,
                    child: Switch(
                      onChanged: toggleSwitch,
                      value: isSwitched,
                      activeColor: white,
                      activeTrackColor: Colors.blue,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding SwitchMethodHead(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.w600, color: black),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              width: 35,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Transform.scale(
                    scale: 2,
                    child: Switch(
                      onChanged: toggleSwitchHead,
                      value: isSwitchedHead,
                      activeColor: white,
                      activeTrackColor: Colors.blue,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
