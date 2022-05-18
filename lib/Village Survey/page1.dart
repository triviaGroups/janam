import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class vpage1 extends StatefulWidget {
  const vpage1({Key? key}) : super(key: key);

  @override
  _vpage1State createState() => _vpage1State();
}

class _vpage1State extends State<vpage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
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
                          Text(
                            "Village Survey",
                            style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: purple),
                          ),
                          Text(
                            "Add new household",
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: purple),
                          )
                        ],
                      ),
                    )),
                Expanded(child: Container()),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56,vertical: 16),
                  child: Container(
                    height: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
