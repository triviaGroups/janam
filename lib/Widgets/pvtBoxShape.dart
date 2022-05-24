import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/subBoxShape.dart';

import '../List/ashaList.dart';
import '../constants/color_constants.dart';
import 'nameTextfield.dart';

class pvtBoxShape extends StatelessWidget {

  final String pvtNumber;

  const pvtBoxShape({super.key, required this.pvtNumber});

  @override
  Widget build(BuildContext context) {
    return subBoxShape(context, "$pvtNumber School-Details", "Head of the school", "Mobile no",
        "No.of.Children");
  }
}