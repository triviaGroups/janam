import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class incDec extends StatefulWidget {
  final Color color;
  final String name;
  final int count;
  final double height;
  final Function() add;
  final Function() sub;
  final Function(String val) fun;
  final TextEditingController tec;
  const incDec({Key? key, required this.color, required this.name, required this.count, required this.height, required this.add, required this.sub, required this.tec, required this.fun}) : super(key: key);

  @override
  _incDecState createState() => _incDecState();
}

class _incDecState extends State<incDec> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(1, 2),
            ),
          ]),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(top: 8,bottom: 8,right: 8),
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
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Transform.translate(
                            offset: const Offset(0, 0),
                            child: GestureDetector(
                              onTap: widget.add,
                              child: const Icon(
                                Icons.add,
                                color: black,
                                size: 16,
                              ),
                            )),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                        child: TextFormField(
                          controller: widget.tec,
                          onChanged: widget.fun,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: black),
                          ),
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: black),
                        ),
                      )),
                  Expanded(
                      child: Container(
                        padding:const  EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Transform.translate(
                            offset: const Offset(0, -4),
                            child: GestureDetector(
                              onTap: widget.sub,
                              child: const Icon(
                                Icons.minimize,
                                color: black,
                                size: 16,
                              ),
                            )),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
