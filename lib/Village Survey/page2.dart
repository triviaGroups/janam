import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Village%20Survey/page3.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class vPage2 extends StatefulWidget {
  const vPage2({Key? key}) : super(key: key);

  @override
  _vPage2State createState() => _vPage2State();
}

class _vPage2State extends State<vPage2> {

  int a = 0;
  bool isSwitched = true;
  bool isSwitchedHead = true;


  void toggleSwitchHead(bool value) {
    if (isSwitchedHead == false) {
      setState(() {
        isSwitchedHead = true;
        a = 0;
      });
    } else {
      setState(() {
        isSwitchedHead = false;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a = 0;
  }

  String _headDob = '';
  String _spouseDob = '';
  String _marraigeDate = '';

  TextEditingController headdob = new TextEditingController();
  TextEditingController spousedob = new TextEditingController();
  TextEditingController marriagedate = new TextEditingController();

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
            topic("Village survey", "Add new household"),
            const SizedBox(
              height: 8,
            ),
            Cont(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Total number of families in the household ",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: black),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: white,
                      ),
                      child: TextFormField(
                        onChanged: (val) {},
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 10),
                            border: InputBorder.none),
                        style: GoogleFonts.inter(fontSize: 14, color: black),
                      ),
                    ))
                  ],
                ),
                height: 48,
                color: colors[(a++) % 4]),
            SwitchMethodHead("Head of the household"),
            isSwitchedHead ? Cont(
                child: Column(
                  children: [
                    textfield("Name", "Name"),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date of Birth",
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
                                    controller: headdob,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Date of Birth",
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
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                  onTap: () async {
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
                                      _headDob = formatted;
                                      headdob.text = _headDob;
                                    });
                                    final snackBar = SnackBar(
                                        content:
                                            Text("Date Picked $formatted"));
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
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aadhar Number",
                            style: GoogleFonts.inter(
                                fontSize: 16, fontWeight: FontWeight.w600, color: black),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              onChanged: (val) {},
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(12),
                              ],
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10, right: 10),
                                hintText: "Aadhar Number",
                                errorMaxLines: 1,
                                hintStyle: GoogleFonts.inter(fontSize: 14, color: txt),
                              ),
                              style: GoogleFonts.inter(fontSize: 14, color: black),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone Number",
                            style: GoogleFonts.inter(
                                fontSize: 16, fontWeight: FontWeight.w600, color: black),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              onChanged: (val) {},
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10, right: 10),
                                hintText: "Phone Number",
                                errorMaxLines: 1,
                                hintStyle: GoogleFonts.inter(fontSize: 14, color: txt),
                              ),
                              style: GoogleFonts.inter(fontSize: 14, color: black),
                            ),
                          )
                        ],
                      ),
                    ),
                    textfield("Gender", "Gender"),
                    textfield("Education", "Education"),
                    textfield("Occupation", "Occupation"),
                    textfield("Family Income", "Family income"),
                    textfield("Disability Status", "Yes/No"),
                  ],
                ),
                height: 90 * 10,
                color: colors[(a++) % 4]) : Container(),
            SizedBox(height: 20,),
            SwitchMethod("Details of Spouse"),
            SizedBox(height: 20,),
            isSwitched ? Cont(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date of marriage",
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
                                    controller: marriagedate,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Date of marriage",
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
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                  onTap: () async {
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
                                      _marraigeDate = formatted;
                                      marriagedate.text = _marraigeDate;
                                    });
                                    final snackBar = SnackBar(
                                        content:
                                        Text("Date Picked $formatted"));
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
                    textfield("Name", "Name"),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date of Birth",
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
                                    controller: spousedob,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      hintText: "Date of Birth",
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
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                  onTap: () async {
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
                                      _spouseDob = formatted;
                                      spousedob.text = _spouseDob;
                                    });
                                    final snackBar = SnackBar(
                                        content:
                                        Text("Date Picked $formatted"));
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
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aadhar Number",
                            style: GoogleFonts.inter(
                                fontSize: 16, fontWeight: FontWeight.w600, color: black),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              onChanged: (val) {},
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(12),
                              ],
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10, right: 10),
                                hintText: "Aadhar Number",
                                errorMaxLines: 1,
                                hintStyle: GoogleFonts.inter(fontSize: 14, color: txt),
                              ),
                              style: GoogleFonts.inter(fontSize: 14, color: black),
                            ),
                          )
                        ],
                      ),
                    ),
                    textfield("Phone number", "Phone number"),
                    textfield("Gender", "Gender"),
                    textfield("Education", "Education"),
                    textfield("Occupation", "Occupation"),
                    textfield("Disability Status", "Yes/No"),
                  ],
                ),
                height: 90 * 10,
                color: colors[(a++) % 4]) : Container(),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => vPage3()));
                },
                child: Button("Next")),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ));
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

  Padding textfield(String text, String htext) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.w600, color: black),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              onChanged: (val) {},
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                hintText: htext,
                errorMaxLines: 1,
                hintStyle: GoogleFonts.inter(fontSize: 14, color: txt),
              ),
              style: GoogleFonts.inter(fontSize: 14, color: black),
            ),
          )
        ],
      ),
    );
  }
}
