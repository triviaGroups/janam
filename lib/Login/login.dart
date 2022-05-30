import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

import '../loading.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _number = new TextEditingController();
  TextEditingController _otp = new TextEditingController();

  late String _verificationcode;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: appBg,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              height: 300,
              width: 368,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage("assets/images/login.png"))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    "Welcome Onboard",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: purple,
                    ),
                  )),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Let’s help you meet up your tasks.",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: purple,
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Enter your phone number and PIN to continue",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: double.infinity,
                child: TextField(
                  controller: _number,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 14, color: purple),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8),
                      border: InputBorder.none,
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: purple)),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 32),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: Colors.white,
            //     ),
            //     margin: EdgeInsets.only(top: 10),
            //     height: 50,
            //     width: double.infinity,
            //     child: TextField(
            //       controller: _otp,
            //       maxLength: 6,
            //       keyboardType: TextInputType.number,
            //       style: GoogleFonts.poppins(
            //           fontWeight: FontWeight.w400, fontSize: 14, color: purple),
            //       decoration: InputDecoration(
            //           contentPadding: EdgeInsets.only(left: 8),
            //           border: InputBorder.none,
            //           hintText: "PIN",
            //           hintStyle: GoogleFonts.poppins(
            //               fontWeight: FontWeight.w400,
            //               fontSize: 14,
            //               color: purple)),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
               // _verifyPhone();
                if(_number.text.length == 10)
                  {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Loading(phone: _number.text)));
                  }else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar( backgroundColor: Colors.black,duration: Duration(seconds: 2),
                        content: Text("Enter Mobile Number",style: GoogleFonts.poppins(fontSize: 18),),
                      ));
                    }
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => nurseDetails()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
                decoration: BoxDecoration(
                    color: purple, borderRadius: BorderRadius.circular(8)),
                height: 50,
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Get started",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 30,
                      )
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
