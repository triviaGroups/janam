import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 155,
              width: MediaQuery.of(context).size.width,
              color: purple,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello,",style: GoogleFonts.inter(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: orange
                            ),),
                            Text("Revathy!",style: GoogleFonts.inter(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: white
                            ),)
                          ],
                        ),
                      )),
                  Expanded(child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
