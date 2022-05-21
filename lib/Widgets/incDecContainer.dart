import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class incDec extends StatefulWidget {
  final Color color;
  final String name;
  final String count;
  final double height;
  const incDec({Key? key, required this.color, required this.name, required this.count, required this.height}) : super(key: key);

  @override
  _incDecState createState() => _incDecState();
}

class _incDecState extends State<incDec> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(1, 2),
            ),
          ]),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
                color: Colors.transparent,
                child: Text(
                  widget.name,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: black),
                ),
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Transform.translate(
                            offset: Offset(0, 0),
                            child: const Icon(
                              Icons.add,
                              color: black,
                              size: 16,
                            )),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: Text(
                          widget.count,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      )),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Transform.translate(
                            offset: Offset(0, -4),
                            child: const Icon(
                              Icons.minimize,
                              color: black,
                              size: 16,
                            )),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
