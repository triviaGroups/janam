import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/subBoxShape2.dart';



class awcBoxShape extends StatelessWidget {

  final String awcNumber;
  final int index;
  final int part;

  const awcBoxShape({super.key, required this.awcNumber, required this.index, required this.part});

  @override
  Widget build(BuildContext context) {
    return subBoxShapeT(
      part: part,
      index: index,
      title: "$awcNumber - Details" ,
      string1: "AWC name",
      string2: "Mobile no" ,
      string3: "No.of.Children" ,
      string4: "Village name" ,
    );

  }
}