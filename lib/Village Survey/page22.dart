import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class vPage22 extends StatefulWidget {
  final int pageCount;
  final String villageName;
  final String docId;
  const vPage22(
      {Key? key,
      required this.pageCount,
      required this.docId,
      required this.villageName})
      : super(key: key);

  @override
  _vPage22State createState() => _vPage22State();
}

class _vPage22State extends State<vPage22> {
  int a = 0;

  bool isSwitched = true;
  bool isSwitchedHead = true;
  int currentIndex = 0;


  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    /// Attach a listener which will update the state and refresh the page index
    controller.addListener(() {
      // if (controller.page.round() != currentIndex) {
      //   setState(() {
      //     currentIndex = controller.page.round();
      //   });
      //}
    });
  }

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


  TextEditingController headdob = new TextEditingController();
  TextEditingController spousedob = new TextEditingController();
  TextEditingController marriagedate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    a = 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: PageView.builder(
            itemCount: widget.pageCount,
            controller: controller,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    topic("Village survey", "Add new family"),
                    const SizedBox(
                      height: 24,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              head[0] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  hintText: "Date of Birth",
                                                  errorMaxLines: 1,
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          color: txt),
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
                                                var datePicked =
                                                    await DatePicker
                                                        .showSimpleDatePicker(
                                                  context,
                                                  initialDate: DateTime(1994),
                                                  firstDate: DateTime(1960),
                                                  lastDate: DateTime(2022),
                                                  dateFormat: "dd-MMMM-yyyy",
                                                  locale: DateTimePickerLocale
                                                      .en_us,
                                                  looping: true,
                                                );
                                                final DateFormat formatter =
                                                    DateFormat('yyyy-MM-dd');
                                                final String formatted =
                                                    formatter
                                                        .format(datePicked!);
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
                                              child: Icon(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Aadhar Number",
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
                                          onChanged: (val) {
                                            setState(() {
                                              head[2] = val;
                                            });
                                          },
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                12),
                                          ],
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            hintText: "Aadhar Number",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              head[3] = val;
                                            });
                                          },
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                10),
                                          ],
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              head[4] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              head[5] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              head[6] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              head[7] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            hintText: "Family Income",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              head[8] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                            color: colors[(a++) % 4])
                        : Container(),
                    SizedBox(
                      height: 20,
                    ),
                    SwitchMethod("Details of Spouse"),
                    SizedBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  hintText: "Date of marriage",
                                                  errorMaxLines: 1,
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          color: txt),
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
                                                var datePicked =
                                                    await DatePicker
                                                        .showSimpleDatePicker(
                                                  context,
                                                  initialDate: DateTime(1994),
                                                  firstDate: DateTime(1960),
                                                  lastDate: DateTime(2022),
                                                  dateFormat: "dd-MMMM-yyyy",
                                                  locale: DateTimePickerLocale
                                                      .en_us,
                                                  looping: true,
                                                );
                                                final DateFormat formatter =
                                                    DateFormat('yyyy-MM-dd');
                                                final String formatted =
                                                    formatter
                                                        .format(datePicked!);
                                                setState(() {
                                                  _marraigeDate = formatted;
                                                  marriagedate.text =
                                                      _marraigeDate;
                                                });
                                                final snackBar = SnackBar(
                                                    content: Text(
                                                        "Date Picked $formatted"));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                              child: Icon(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              spouse[1] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  hintText: "Date of Birth",
                                                  errorMaxLines: 1,
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          color: txt),
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
                                                var datePicked =
                                                    await DatePicker
                                                        .showSimpleDatePicker(
                                                  context,
                                                  initialDate: DateTime(1994),
                                                  firstDate: DateTime(1960),
                                                  lastDate: DateTime(2022),
                                                  dateFormat: "dd-MMMM-yyyy",
                                                  locale: DateTimePickerLocale
                                                      .en_us,
                                                  looping: true,
                                                );
                                                final DateFormat formatter =
                                                    DateFormat('yyyy-MM-dd');
                                                final String formatted =
                                                    formatter
                                                        .format(datePicked!);
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
                                              child: Icon(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Aadhar Number",
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
                                          onChanged: (val) {
                                            setState(() {
                                              spouse[3] = val;
                                            });
                                          },
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                12),
                                          ],
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            hintText: "Aadhar Number",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              spouse[4] = val;
                                            });
                                          },
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                10),
                                          ],
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              spouse[5] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              spouse[6] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              spouse[7] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextFormField(
                                          onChanged: (val) {
                                            setState(() {
                                              spouse[8] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 10, right: 10),
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
                            color: colors[(a++) % 4])
                        : Container(),
                    SizedBox(
                      height: 24,
                    ),
                    index == widget.pageCount - 1
                        ? GestureDetector(
                            onTap: () async {
                              setState(() {
                                head[1] = headdob.text;
                              });
                              print(head);
                              setState(() {
                                spouse[0] = marriagedate.text;
                                spouse[2] = spousedob.text;
                              });
                              print("Spouse");
                              print(spouse);

                              DocumentReference doc_ref =
                                  await FirebaseFirestore.instance
                                      .collection("Village Details")
                                      .doc(widget.villageName)
                                      .collection("Family")
                                      .doc(widget.docId)
                                      .collection("Household")
                                      .doc();

                              DocumentSnapshot docSnap = await doc_ref.get();
                              var doc = docSnap.reference.id;

                              Map<String, dynamic> data = {
                                "isHead": isSwitchedHead,
                                "isSpouse": isSwitched,
                                "head": head,
                                "spouse": spouse,
                                "docId": doc,
                              };

                              await FirebaseFirestore.instance
                                  .collection("Village Details")
                                  .doc(widget.villageName)
                                  .collection("Family")
                                  .doc(widget.docId)
                                  .collection("Household")
                                  .doc(doc)
                                  .set(data)
                                  .whenComplete(() {
                                _headDob = '';
                                _spouseDob = '';
                                _marraigeDate = '';

                                head = ["", "", "", "", "", "", "", "", ""];
                                spouse = ["", "", "", "", "", "", "", "", ""];


                                headdob.clear();
                                spousedob.clear();
                                marriagedate.clear();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeSub(
                                          number: Provider.of<Details>(context,
                                                  listen: false)
                                              .phone)),
                                  (Route<dynamic> route) => false,
                                );
                              });
                            },
                            child: Button("Save"))
                        : GestureDetector(
                            onTap: () async {
                              setState(() {
                                head[1] = headdob.text;
                              });
                              print(head);
                              setState(() {
                                spouse[0] = marriagedate.text;
                                spouse[2] = spousedob.text;
                              });
                              print("Spouse");
                              print(spouse);

                              DocumentReference doc_ref =
                                  await FirebaseFirestore.instance
                                      .collection("Village Details")
                                      .doc(widget.villageName)
                                      .collection("Family")
                                      .doc(widget.docId)
                                      .collection("Household")
                                      .doc();

                              DocumentSnapshot docSnap = await doc_ref.get();
                              var doc = docSnap.reference.id;

                              Map<String, dynamic> data = {
                                "isHead": isSwitchedHead,
                                "isSpouse": isSwitched,
                                "head": head,
                                "spouse": spouse,
                                "docId": doc,
                              };

                              await FirebaseFirestore.instance
                                  .collection("Village Details")
                                  .doc(widget.villageName)
                                  .collection("Family")
                                  .doc(widget.docId)
                                  .collection("Household")
                                  .doc(doc)
                                  .set(data)
                                  .whenComplete(() {
                                _headDob = '';
                                _spouseDob = '';
                               _marraigeDate = '';

                                 head = ["", "", "", "", "", "", "", "", ""];
                                 spouse = ["", "", "", "", "", "", "", "", ""];

                                 headdob.clear();
                                 spousedob.clear();
                                 marriagedate.clear();

                              });
                              controller.nextPage(
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.easeIn);
                            },
                            child: Button("Next")),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
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
