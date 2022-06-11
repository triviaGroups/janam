import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/constants/color_constants.dart';

class CheckBoxCont extends StatefulWidget {
  final int a;
  final String name;
  final List<String> item;
  final double height;
  final List<bool> boolean;
  const CheckBoxCont(
      {Key? key,
      required this.a,
      required this.name,
      required this.item,
      required this.height, required this.boolean,})
      : super(key: key);

  @override
  _CheckBoxContState createState() => _CheckBoxContState();
}

class _CheckBoxContState extends State<CheckBoxCont> {

 @override
  Widget build(BuildContext context) {
    return Cont(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                child: ListView.builder(
                  itemCount: widget.item.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        if(widget.boolean[index]){
                          widget.boolean[index] = false;
                        }
                        else{
                          widget.boolean[index] = true;
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: white,
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: white,
                            activeColor:hTxt,
                            value: widget.boolean[index],
                            onChanged: (value) {
                              setState(() {
                                widget.boolean[index] = value!;
                              });
                            },
                          ),
                          Container(
                            width:150,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text(widget.item[index],
                                textAlign: TextAlign.start,
                                softWrap: true,
                                maxLines: 2,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: hTxt,
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                }))),
          ],
        ),
        height: widget.height,
        color: colors[widget.a]);
  }
}
