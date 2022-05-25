import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/pvtBoxShapeCont.dart';
import 'package:janam/Widgets/subBoxShape.dart';

import '../List/ashaList.dart';
import '../constants/color_constants.dart';


class pvtBoxShape extends StatelessWidget {

  final String pvtNumber;
  final int index;
  final int part;

  const pvtBoxShape({super.key, required this.pvtNumber, required this.index, required this.part});

  @override
  Widget build(BuildContext context) {
    return pvtBoxShapeCont(title: "$pvtNumber School-Details", string1:"Head of the school", string2: "Mobile no", string3: "No.of.Children", index: index, part: part);

  }
}