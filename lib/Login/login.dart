import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: purple,
                    ),
                  )),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Let’s help you meet up your tasks.",
                        style: GoogleFonts.inter(
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
                        style: GoogleFonts.inter(
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
                  style:  GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: purple),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: purple)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: double.infinity,
                child: TextField(
                  style:  GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: purple),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "PIN",
                      hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: purple)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
              decoration: BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.circular(8)),
              height: 60,
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
                      style: GoogleFonts.inter(
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
          ]),
        ),
      ),
    );
  }
}
