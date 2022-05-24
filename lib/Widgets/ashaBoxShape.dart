import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/subBoxShape.dart';

import '../List/ashaList.dart';
import '../constants/color_constants.dart';
import 'nameTextfield.dart';

class ashaBoxShape extends StatelessWidget {

  final String ashaNumber;

  const ashaBoxShape({super.key, required this.ashaNumber});

  @override
  Widget build(BuildContext context) {
    return subBoxShape(context, "$ashaNumber - Details", "ASHA name", "Mobile no",
        "Village name");
  }
}