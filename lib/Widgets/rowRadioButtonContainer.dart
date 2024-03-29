import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/constants/color_constants.dart';

class rowRadioBtnContainer extends StatefulWidget {
  final Color color;
  final String name;
  final List<String> item;
  final int num;
  final double height;
  final List<int> val;
  final List<String> dates;
  const rowRadioBtnContainer(
      {Key? key,
      required this.color,
      required this.name,
      required this.item,
      required this.num,
      required this.height, required this.val, required this.dates,})
      : super(key: key);

  @override
  _rowRadioBtnContainerState createState() => _rowRadioBtnContainerState();
}

class _rowRadioBtnContainerState extends State<rowRadioBtnContainer> {

  @override
  Widget build(BuildContext context) {
    return Cont(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                widget.name,
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w600, color: black),
              ),
            ),
          ),
          for (int i = 0; i < widget.num; i++)
            rowRadio(index: widget.item[i],d : i,val: widget.val,dates: widget.dates,)
        ],
      ),
      height: widget.height,
      color: widget.color,
    );
  }
}

class rowRadio extends StatefulWidget {
  final String index;
  final List<int> val;
  final int d;
  final List<String> dates;
  const rowRadio({Key? key, required this.index, required this.val, required this.dates, required this.d}) : super(key: key);

  @override
  _rowRadioState createState() => _rowRadioState();
}

class _rowRadioState extends State<rowRadio> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                widget.index,
                style: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w400, color: black),
              ),
            ),
          ),
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    color: _value == 0 ? hTxt : white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Expanded(
                        child: Radio(
                            activeColor: white,
                            value: 0,
                            groupValue: _value,
                            onChanged: (ind) {
                              setState(() {
                                _value = ind as int;
                                widget.val[widget.d] = _value;
                              });
                            })),
                    Expanded(
                      child: Text(
                        'Yes',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: _value != 0 ? hTxt : white,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    color: _value == 1 ? hTxt : white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Expanded(
                        child: Radio(
                            activeColor: white,
                            value: 1,
                            groupValue: _value,
                            onChanged: (ind) {
                              setState(() {
                                _value = ind as int;
                                widget.val[widget.d] = _value;
                              });
                            })),
                    Expanded(
                      child: Text(
                        'No',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: _value != 1 ? hTxt : white,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  onChanged: (val) {
                    widget.dates[widget.d] = val;
                  },
                  decoration: InputDecoration(
                    hintText: widget.dates[widget.d],
                    contentPadding: const EdgeInsets.only(left: 10, right: 10),
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14, color: black, fontWeight: FontWeight.w600),
                  ),
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: black, fontWeight: FontWeight.w600),
                ),
              )),
        ],
      ),
    );
  }
}

