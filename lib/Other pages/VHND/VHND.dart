import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Other%20pages/VHND/VHNDpro.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/multisearch.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:provider/provider.dart';


class VHND extends StatefulWidget {
  const VHND({Key? key}) : super(key: key);

  @override
  _VHNDState createState() => _VHNDState();
}

class _VHNDState extends State<VHND> {
  int a = 0;
  int name = 0;
  int place = 0;
  int attendee = 0;
  int conducted = 0;

  List<String> placeList = const ["PHC","SC","Others"];

  TextEditingController dateVHND = new TextEditingController();
  TextEditingController topicc = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final datePicked = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter. format(datePicked);
    dateVHND.text = formatted;
  }

  @override
  Widget build(BuildContext context) {
    a = 0;
    return SafeArea(
        child: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                topic("VHND", ""),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Date of VHND",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              controller: dateVHND,
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10, right: 10,bottom: 5),
                                border: InputBorder.none,
                              ),
                              style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 40,
                    color: colors[(a++) % 4]),
                radioContainer(
                  name: "Name of village",
                  num: Provider.of<vhndpro>(context,listen: false).village.length,
                  item: Provider.of<vhndpro>(context,listen: false).village,
                  height: Provider.of<vhndpro>(context,listen: false).village.length * 80,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    name = int.parse(val.toString());
                    print("$name");
                  }),
                  selectedButton: name,

                ),
                radioContainer(
                  name: "Place of VHND",
                  num: 3,
                  item: placeList,
                  height: 180,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    place = int.parse(val.toString());
                    print("$place");
                  }),
                  selectedButton: place,
                ),
                place == 3 ? Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "If others,\nspecify",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                                border: InputBorder.none,
                              ),
                              style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 60,
                    color: colors[(a++) % 4]) : SizedBox(),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Topic of meeting",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              controller: topicc,
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                                border: InputBorder.none,
                              ),
                              style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 40,
                    color: colors[(a++) % 4]),
                name == 0 ? SizedBox() : Column(
                  children: [
                    SearchMulti(
                      num: name-1,
                    ),
                    radioContainer(
                      name: "Attendee name",
                      num: 3,
                      item: const ["Ramya, 22 years", "Sita, 28 years", "Kamala, 32 years"],
                      height: 180,
                      a: (a++) % 4,
                      press: (val) => setState(() {
                        attendee = int.parse(val.toString());
                        print("$attendee");
                      }),
                      selectedButton: attendee,
                    ),
                  ],
                ),
                radioContainer(
                  name: "Conducted by",num: 2,
                  item: const ["Dr. Manoj, MO, PHC - 1", "Ms. Amala, AWC - 3"],
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    conducted = int.parse(val.toString());
                    print("$conducted");
                  }),
                  selectedButton: conducted,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "No. of IFA tablets given in VHNDs",
                    count: Provider.of<vhndpro>(context,listen: false).given,
                    height: 60,
                    add: (){
                      Provider.of<vhndpro>(context,listen: false).incGiven();
                      setState(() {

                      });
                    },
                    sub: (){
                      Provider.of<vhndpro>(context,listen: false).decGiven();
                      setState(() {

                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "No. of IFA tablets issued by AWW",
                    count: Provider.of<vhndpro>(context,listen: false).issued,
                    height: 60,
                    add: (){
                      Provider.of<vhndpro>(context,listen: false).incIssue();
                      setState(() {

                      });
                    },
                    sub: (){
                      Provider.of<vhndpro>(context,listen: false).decIssue();
                      setState(() {

                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: (){

                  },
                    child: Button("Save")),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ));
  }
}
