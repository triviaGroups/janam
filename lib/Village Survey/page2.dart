import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        a=0;
      });
    } else {
      setState(() {
        isSwitched = false;
        a=0;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a=0;
  }

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
            SwitchMethod("Head of the household"),
            Cont(
                child: Column(
                  children: [
                    textfield("Name", "Name"),
                    textfield("Date of birth", "Date of birth"),
                    textfield("Aadhaar No.", "Aadhaar No."),
                    textfield("Phone number", "Phone number"),
                    textfield("Gender", "Gender"),
                    textfield("Education", "Education"),
                    textfield("Occupation", "Occupation"),
                    textfield("Family Income", "Family income"),
                    textfield("Disability Status", "Yes/No"),
                  ],
                ),
                height: 90 * 10,
                color: colors[(a++) % 4]),

            SwitchMethod("Details of Spouse"),
            Cont(
                child: Column(
                  children: [
                    textfield("Date of marriage", "Date of marriage"),
                    textfield("Name", "Name"),
                    textfield("Date of birth", "Date of birth"),
                    textfield("Aadhaar No.", "Aadhaar No."),
                    textfield("Phone number", "Phone number"),
                    textfield("Gender", "Gender"),
                    textfield("Education", "Education"),
                    textfield("Occupation", "Occupation"),
                    textfield("Disability Status", "Yes/No"),
                  ],
                ),
                height: 90 * 10,
                color: colors[(a++) % 4]),
            GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> vPage3()));
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black),
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
