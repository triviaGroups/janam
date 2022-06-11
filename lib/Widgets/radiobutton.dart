import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';


class RadioButton extends StatefulWidget {
  final int num;
  final List<String> items;
  final ValueChanged<int?> press;
  final int selectedButton;
  final Function(int k) fun;
  const RadioButton({Key? key, required this.num, required this.items, required this.press, required this.selectedButton, required this.fun,})
      : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        for (int i = 1; i <= widget.num; i++)
          Expanded(
            child: GestureDetector(
              onTap: () => widget.fun(i),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8,left: 6,right: 4),
                decoration: BoxDecoration(
                    color: widget.selectedButton == i ? hTxt : white,
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  title: Transform.translate(
                    offset: const Offset(-32, -2),
                    child: Text(widget.items[i - 1],
                        textAlign: TextAlign.start,
                        softWrap: true,
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: widget.selectedButton != i ? hTxt : white,
                        )),
                  ),
                  leading: Container(
                    alignment: Alignment.centerLeft,
                    width: 10,
                    child: Radio(
                      value: i,
                      groupValue: widget.selectedButton,
                      activeColor: white,
                      onChanged: widget.press,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
