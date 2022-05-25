import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/gvtBoxShapeCont.dart';


class govtBoxShape extends StatelessWidget {

  final String govtNumber;
  final int index;
  final int part;

  const govtBoxShape({super.key, required this.govtNumber, required this.index, required this.part});

  @override
  Widget build(BuildContext context) {
    return gvtBoxShapeCont(title:"$govtNumber School-Details", string1: "Head of the school",
        string2: "Mobile no", string3:"No.of.Children", index: index, part: part);
  }
}