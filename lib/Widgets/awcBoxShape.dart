import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/subBoxShape2.dart';

import '../List/ashaList.dart';
import '../constants/color_constants.dart';
import 'nameTextfield.dart';

class awcBoxShape extends StatelessWidget {

  final String awcNumber;

  const awcBoxShape({super.key, required this.awcNumber});

  @override
  Widget build(BuildContext context) {
    return subBoxShapeT(context, "$awcNumber - Details", "AWC name", "Mobile no","No.of.Children",
        "Village name");
  }
}