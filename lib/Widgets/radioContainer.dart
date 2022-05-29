import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radiobutton.dart';
import 'package:janam/constants/color_constants.dart';

class radioContainer extends StatefulWidget {
  final int a;
  final int num;
  final String name;
  final List<String> item;
  final double height;
  final ValueChanged<int?> press;
  final int selectedButton;
  const radioContainer({Key? key, required this.a, required this.name, required this.item, required this.height, required this.num, required this.press, required this.selectedButton}) : super(key: key);

  @override
  _radioContainerState createState() => _radioContainerState();
}

class _radioContainerState extends State<radioContainer> {
  @override
  Widget build(BuildContext context) {
    return Cont(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    widget.name,
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                )),
             Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: RadioButton(
                    num: widget.num,
                    items: widget.item,
                    press: widget.press,
                    selectedButton: widget.selectedButton,
                  ),
                )),
          ],
        ),
        height: widget.height,
        color: colors[widget.a]);
  }
}
