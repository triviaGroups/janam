import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/subBoxShape.dart';

import '../List/ashaList.dart';
import '../constants/color_constants.dart';
import 'nameTextfield.dart';

class govtBoxShape extends StatelessWidget {

  final String govtNumber;

  const govtBoxShape({super.key, required this.govtNumber});

  @override
  Widget build(BuildContext context) {
    return subBoxShape(context, "$govtNumber School-Details", "Head of the school", "Mobile no",
        "No.of.Children");
  }
}