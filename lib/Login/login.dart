import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';
import '../loading.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController number =  TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBg,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    height: 300,
                    width: 368,
                    decoration:const  BoxDecoration(
                        image:  DecorationImage(
                            image: AssetImage("assets/images/login.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "Welcome Onboard",
                          style: GoogleFonts.poppins(
                         fontSize: 24,
                         fontWeight: FontWeight.w600,
                         color: purple,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Let’s help you meet up your tasks.",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: purple,
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        controller: number,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 8),
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: purple)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (number.text.length == 10) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Loading(phone: number.text)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.black,
                          duration: const Duration(seconds: 2),
                          content: Text(
                            "Enter Mobile Number",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ));
                      }
                    },
                    child: Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
                      decoration: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      alignment: Alignment.center,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Get started",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
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
      ),
    );
  }
}
