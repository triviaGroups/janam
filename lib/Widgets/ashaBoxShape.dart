import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/subBoxShape.dart';

import '../List/ashaList.dart';
import '../constants/color_constants.dart';

class ashaBoxShape extends StatelessWidget {

  final String ashaNumber;
  final int index;
  final int part;

  const ashaBoxShape({super.key, required this.ashaNumber, required this.index, required this.part});

  @override
  Widget build(BuildContext context) {
    return subBoxShape(
      index: index,
      title: "$ashaNumber - Details",
      string1:"ASHA name" ,
      string2:"Mobile no" ,
      string3: "Village name",
      part: part,
    );
  }
}