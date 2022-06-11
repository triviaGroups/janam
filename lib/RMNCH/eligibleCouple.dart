import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/SearchWidgets/SearchEC.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:janam/provider/docIdProvider.dart';
import 'package:janam/provider/villageProvider.dart';
import 'package:provider/provider.dart';

class EligibleCouple extends StatefulWidget {
  const EligibleCouple({Key? key}) : super(key: key);

  @override
  _EligibleCoupleState createState() => _EligibleCoupleState();
}

class _EligibleCoupleState extends State<EligibleCouple> {
  int a = 0;

  int method = 0;
  int ster = 0;
  int tempster = 0;
  int test = 0;
  int result = 0;
  int reason = 0;
  int poi = 0;
  int newmode = 0;
  int inj = 0;

  String docId = "";

  List<String> methodList = const [
    "Permanent",
    "Temporary",
    "Currently pregnant",
    "Not using any"
  ];

  List<String> newList = const [
    "OCPs",
    "Injections",
    "Sterilizations",
    "Devices",
    "Condoms"
  ];

  List<String> perSterList = const ["Vasectomy", "Tubectomy"];

  List<String> temSterList = const [
    "Condoms",
    "OCPs",
    "Injections",
    "Devices"
  ];

  List<String> placeList = const [
    "DH",
    "PHC",
    "Others"
  ];

  List<String> resultList = const ["Positive", "Negative"];

  List<String> yesno = const ["Yes", "No"];

  List<String> injList = const ["Intramuscular","Subcutaneous"];

  List<String> reasonList = const [
    "Planning child",
    "Menopause",
    "New mode of contraception"
  ];

  TextEditingController bweight = TextEditingController();

  TextEditingController dateTracking =  TextEditingController();
  TextEditingController lmp =  TextEditingController();

  TextEditingController dateSterializ =  TextEditingController();
  TextEditingController reasonSterializ =  TextEditingController();

  TextEditingController condom =  TextEditingController();

  TextEditingController ocp =  TextEditingController();
  TextEditingController dateSupply =  TextEditingController();

  TextEditingController dateInjection =  TextEditingController();
  TextEditingController timeInjection =  TextEditingController();

  TextEditingController dateDiscontinue =  TextEditingController();

  TextEditingController dateInsertion =  TextEditingController();
  TextEditingController icud =  TextEditingController();

  TextEditingController dateAbortion =  TextEditingController();

  TimeOfDay time = const TimeOfDay(hour: 10, minute: 45);
  @override
  Widget build(BuildContext context) {
    a = 0;
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            topic("Eligible Couple", "Track eligible couple"),
            const EcSearch(),
            context.watch<DocID>().doc == ""
                ? const SizedBox()
                : Cont(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: black),
                        ),
                        Text(
                          Provider.of<DocID>(context, listen: false).address,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: txt),
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ],
                    ),
                    height: 100,
                    color: colors[(a++) % 4]),
            Cont(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Date of Tracking",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          controller: dateTracking,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 5),
                            border: InputBorder.none,
                          ),
                          style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () async {
                              var datePicked =
                                  await DatePicker.showSimpleDatePicker(
                                context,
                                initialDate: DateTime(1994),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2022),
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DateTimePickerLocale.en_us,
                                looping: true,
                              );
                              final DateFormat formatter =
                                  DateFormat('yyyy-MM-dd');
                              final String formatted =
                                  formatter.format(datePicked!);
                              setState(() {
                                dateTracking.text = formatted;
                              });
                              final snackBar = SnackBar(
                                  content: Text("Date Picked $formatted"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.black87,
                              size: 24,
                            )),
                      ),
                    )
                  ],
                ),
                height: 40,
                color: colors[(a++) % 4]),
            Cont(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "LMP",
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
                          controller: lmp,
                          onChanged: (val) {},
                          decoration: const InputDecoration(
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
            radioContainer(
              name: "Method of contraception used",
              num: 4,
              item: methodList,
              height: 240,
              a: (a++) % 4,
              press: (val) => setState(() {
                method = int.parse(val.toString());
              }),
              selectedButton: method,
              fun: (val){
                setState(() {
                  method = val;
                });
              },
            ),
            method == 1
                ? Column(
                    children: [
                      radioContainer(
                        name:
                            "If permanent sterilization, \n\nType of sterilization",
                        num: 2,
                        item: perSterList,
                        height: 120,
                        a: (a++) % 4,
                        press: (val) => setState(() {
                          ster = int.parse(val.toString());
                        }),
                        selectedButton: ster,
                        fun: (val){
                          setState(() {
                            ster = val;
                          });
                        },
                      ),
                      Cont(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Text(
                                    "Date of sterilization",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: black),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: TextFormField(
                                    controller: dateSterializ,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 5),
                                      border: InputBorder.none,
                                    ),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: black),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () async {
                                        var datePicked = await DatePicker
                                            .showSimpleDatePicker(
                                          context,
                                          initialDate: DateTime(1994),
                                          firstDate: DateTime(1960),
                                          lastDate: DateTime(2022),
                                          dateFormat: "dd-MMMM-yyyy",
                                          locale: DateTimePickerLocale.en_us,
                                          looping: true,
                                        );
                                        final DateFormat formatter =
                                            DateFormat('yyyy-MM-dd');
                                        final String formatted =
                                            formatter.format(datePicked!);
                                        setState(() {
                                          dateSterializ.text = formatted;
                                        });
                                        final snackBar = SnackBar(
                                            content:
                                                Text("Date Picked $formatted"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child:const  Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.black87,
                                        size: 24,
                                      )),
                                ),
                              )
                            ],
                          ),
                          height: 40,
                          color: colors[(a++) % 4]),
                      Cont(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Text(
                                    "Reason of sterilization",
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
                                    controller: reasonSterializ,
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                    ),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          height: 40,
                          color: colors[(a++) % 4]),
                    ],
                  )
                : method == 2
                    ? Column(
                        children: [
                          radioContainer(
                            name: "If temporary sterilization, \n\nMethod used",
                            num: 4,
                            item: temSterList,
                            height: 240,
                            a: (a++) % 4,
                            press: (val) => setState(() {
                              tempster = int.parse(val.toString());
                            }),
                            selectedButton: tempster,
                            fun: (val){
                              setState(() {
                                tempster = val;
                              });
                            },
                          ),
                          tempster == 1
                              ? Cont(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            "Number of condoms distributed",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: black),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextFormField(
                                            controller: condom,
                                            decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              border: InputBorder.none,
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontSize: 14, color: black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  height: 40,
                                  color: colors[(a++) % 4])
                              : tempster == 2
                                  ? Column(
                                      children: [
                                        Cont(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Text(
                                                      "Name of OCP",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: black),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: TextFormField(
                                                      controller: ocp,
                                                      decoration:
                                                      const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 14,
                                                              color: black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            height: 40,
                                            color: colors[(a++) % 4]),
                                        Cont(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Text(
                                                      "Date of supply",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: black),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: TextFormField(
                                                      controller: dateSupply,
                                                      decoration:
                                                      const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                bottom: 5),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 14,
                                                              color: black),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: GestureDetector(
                                                        onTap: () async {
                                                          var datePicked =
                                                              await DatePicker
                                                                  .showSimpleDatePicker(
                                                            context,
                                                            initialDate:
                                                                DateTime(1994),
                                                            firstDate:
                                                                DateTime(1960),
                                                            lastDate:
                                                                DateTime(2022),
                                                            dateFormat:
                                                                "dd-MMMM-yyyy",
                                                            locale:
                                                                DateTimePickerLocale
                                                                    .en_us,
                                                            looping: true,
                                                          );
                                                          final DateFormat
                                                              formatter =
                                                              DateFormat(
                                                                  'yyyy-MM-dd');
                                                          final String
                                                              formatted =
                                                              formatter.format(
                                                                  datePicked!);
                                                          setState(() {
                                                            dateSupply.text =
                                                                formatted;
                                                          });
                                                          final snackBar = SnackBar(
                                                              content: Text(
                                                                  "Date Picked $formatted"));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color: Colors.black87,
                                                          size: 24,
                                                        )),
                                                  ),
                                                )
                                              ],
                                            ),
                                            height: 40,
                                            color: colors[(a++) % 4]),
                                      ],
                                    )
                                  : tempster == 3
                                      ? Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 24),
                                              child: incDec(
                                                color: colors[(a++) % 4],
                                                name: "Body weight (kg)",
                                                tec: bweight,
                                                fun: (val){
                                                  Provider.of<VillageProvider>(context,listen: false).setWeight(bweight.text);
                                                },
                                                count: Provider.of<VillageProvider>(context,listen: false).weight,
                                                height: 60,
                                                add: () {
                                                  Provider.of<VillageProvider>(context,listen: false).incWeight();
                                                  bweight.text = Provider.of<VillageProvider>(context,listen: false).weight.toString();
                                                  setState(() {

                                                  });
                                                },
                                                sub: () {
                                                  Provider.of<VillageProvider>(context,listen: false).decWeight();
                                                  bweight.text = Provider.of<VillageProvider>(context,listen: false).weight.toString();
                                                  setState(() {

                                                  });
                                                },
                                              ),
                                            ),
                                            Container(
                                              height: 69,
                                              margin: const EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 24),
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: colors[(a++) % 4],
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      blurRadius: 5,
                                                      spreadRadius: 1,
                                                      offset: const Offset(1, 2),
                                                    ),
                                                  ]),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                    padding: const EdgeInsets.only(
                                                        top: 8,
                                                        bottom: 8,
                                                        right: 8),
                                                    color: Colors.transparent,
                                                    child: Text(
                                                      "BP",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: black),
                                                    ),
                                                  )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 8),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              8,
                                                                          bottom:
                                                                              8,
                                                                          right:
                                                                              8),
                                                                  color: Colors
                                                                      .transparent,
                                                                  child: Text(
                                                                    "Sys",
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                )),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          4),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    blurRadius:
                                                                        5,
                                                                    spreadRadius:
                                                                        1,
                                                                    offset:
                                                                    const  Offset(
                                                                            1,
                                                                            2),
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Transform
                                                                  .translate(
                                                                      offset:
                                                                      const Offset(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          GestureDetector(
                                                                            onTap: (){
                                                                              Provider.of<VillageProvider>(context,listen: false).incSys();
                                                                              setState(() {

                                                                              });
                                                                            },
                                                                            child: const Icon(
                                                                        Icons
                                                                              .add,
                                                                        color:
                                                                              black,
                                                                        size:
                                                                              16,
                                                                      ),
                                                                          )),
                                                            )),
                                                            Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              8),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  color: Colors
                                                                      .transparent,
                                                                  child: Text(
                                                                    Provider.of<VillageProvider>(context,listen: false).sys.toString(),
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                )),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          4),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    blurRadius:
                                                                        5,
                                                                    spreadRadius:
                                                                        1,
                                                                    offset:
                                                                    const Offset(
                                                                            1,
                                                                            2),
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Transform
                                                                  .translate(
                                                                      offset:
                                                                      const   Offset(
                                                                              0,
                                                                              -4),
                                                                      child:
                                                                          GestureDetector(
                                                                            onTap: (){
                                                                              Provider.of<VillageProvider>(context,listen: false).decSys();
                                                                              setState(() {

                                                                              });
                                                                            },
                                                                            child: const Icon(
                                                                        Icons
                                                                              .minimize,
                                                                        color:
                                                                              black,
                                                                        size:
                                                                              16,
                                                                      ),
                                                                          )),
                                                            )),
                                                          ],
                                                        ),
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 8),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              8,
                                                                          bottom:
                                                                              8,
                                                                          right:
                                                                              8),
                                                                  color: Colors
                                                                      .transparent,
                                                                  child: Text(
                                                                    "Dia",
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                )),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          4),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    blurRadius:
                                                                        5,
                                                                    spreadRadius:
                                                                        1,
                                                                    offset:
                                                                    const Offset(
                                                                            1,
                                                                            2),
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Transform
                                                                  .translate(
                                                                      offset:
                                                                      const   Offset(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          GestureDetector(
                                                                            onTap: (){
                                                                              Provider.of<VillageProvider>(context,listen: false).incDis();
                                                                              setState(() {

                                                                              });
                                                                            },
                                                                            child: const Icon(
                                                                        Icons
                                                                              .add,
                                                                        color:
                                                                              black,
                                                                        size:
                                                                              16,
                                                                      ),
                                                                          )),
                                                            )),
                                                            Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              8),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  color: Colors
                                                                      .transparent,
                                                                  child: Text(
                                                                    Provider.of<VillageProvider>(context,listen: false).dia.toString(),
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                )),
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          4),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    blurRadius:
                                                                        5,
                                                                    spreadRadius:
                                                                        1,
                                                                    offset:
                                                                    const Offset(
                                                                            1,
                                                                            2),
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Transform
                                                                  .translate(
                                                                      offset:
                                                                      const  Offset(
                                                                              0,
                                                                              -4),
                                                                      child:
                                                                          GestureDetector(
                                                                            onTap: (){
                                                                              Provider.of<VillageProvider>(context,listen: false).decDis();
                                                                              setState(() {

                                                                              });
                                                                            },
                                                                            child: const Icon(
                                                                        Icons
                                                                              .minimize,
                                                                        color:
                                                                              black,
                                                                        size:
                                                                              16,
                                                                      ),
                                                                          )),
                                                            )),
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Cont(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 8),
                                                        child: Text(
                                                          "Date of Injection",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: black),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: TextFormField(
                                                          controller:
                                                              dateInjection,
                                                          decoration:
                                                          const InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10,
                                                                    bottom: 5),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14,
                                                                  color: black),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: GestureDetector(
                                                            onTap: () async {
                                                              var datePicked =
                                                                  await DatePicker
                                                                      .showSimpleDatePicker(
                                                                context,
                                                                initialDate:
                                                                    DateTime(
                                                                        1994),
                                                                firstDate:
                                                                    DateTime(
                                                                        1960),
                                                                lastDate:
                                                                    DateTime(
                                                                        2022),
                                                                dateFormat:
                                                                    "dd-MMMM-yyyy",
                                                                locale:
                                                                    DateTimePickerLocale
                                                                        .en_us,
                                                                looping: true,
                                                              );
                                                              final DateFormat
                                                                  formatter =
                                                                  DateFormat(
                                                                      'yyyy-MM-dd');
                                                              final String
                                                                  formatted =
                                                                  formatter.format(
                                                                      datePicked!);
                                                              setState(() {
                                                                dateInjection
                                                                        .text =
                                                                    formatted;
                                                              });
                                                              final snackBar = SnackBar(
                                                                  content: Text(
                                                                      "Date Picked $formatted"));
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      snackBar);
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .calendar_today_outlined,
                                                              color: Colors
                                                                  .black87,
                                                              size: 24,
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                height: 40,
                                                color: colors[(a++) % 4]),
                                            radioContainer(
                                              name: "Place of injection",
                                              num: 2,
                                              item: injList,
                                              height: 120,
                                              a: (a++) % 4,
                                              press: (val) => setState(() {
                                                inj = int.parse(val.toString());
                                              }),
                                              selectedButton: inj,
                                              fun: (val){
                                                setState(() {
                                                  inj = val;
                                                });
                                              },
                                            ),
                                            Cont(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 8),
                                                        child: Text(
                                                          "Time of Injection",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: black),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: TextFormField(
                                                          controller:
                                                              timeInjection,
                                                          decoration:
                                                          const  InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10,
                                                                    bottom: 7),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14,
                                                                  color: black),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () async {

                                                          setState(() {
                                                            String crtTime =
                                                                time
                                                                    .format(
                                                                        context)
                                                                    .toString();
                                                            timeInjection.text =
                                                                crtTime;
                                                          });

                                                          final snackBar = SnackBar(
                                                              content: Text(
                                                                  "Time Picked ${timeInjection.text}"));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        },
                                                        child: Container(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: const Icon(
                                                              Icons
                                                                  .watch_later_outlined,
                                                              color: Colors
                                                                  .black87,
                                                              size: 30,
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                height: 40,
                                                color: colors[(a++) % 4]),
                                          ],
                                        )
                                      : tempster == 4
                                          ? Column(
                                              children: [
                                                Cont(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 8),
                                                            child: Text(
                                                              "Date of insertion",
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: black),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 4,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                color: white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  dateInsertion,
                                                              decoration:
                                                              const InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10,
                                                                        bottom:
                                                                            5),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                              ),
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      fontSize:
                                                                          14,
                                                                      color:
                                                                          black),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child:
                                                                GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      var datePicked =
                                                                          await DatePicker
                                                                              .showSimpleDatePicker(
                                                                        context,
                                                                        initialDate:
                                                                            DateTime(1994),
                                                                        firstDate:
                                                                            DateTime(1960),
                                                                        lastDate:
                                                                            DateTime(2022),
                                                                        dateFormat:
                                                                            "dd-MMMM-yyyy",
                                                                        locale:
                                                                            DateTimePickerLocale.en_us,
                                                                        looping:
                                                                            true,
                                                                      );
                                                                      final DateFormat
                                                                          formatter =
                                                                          DateFormat(
                                                                              'yyyy-MM-dd');
                                                                      final String
                                                                          formatted =
                                                                          formatter
                                                                              .format(datePicked!);
                                                                      setState(
                                                                          () {
                                                                        dateInsertion.text =
                                                                            formatted;
                                                                      });
                                                                      final snackBar =
                                                                          SnackBar(
                                                                              content: Text("Date Picked $formatted"));
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              snackBar);
                                                                    },
                                                                    child: const Icon(
                                                                      Icons
                                                                          .calendar_today_outlined,
                                                                      color: Colors
                                                                          .black87,
                                                                      size: 24,
                                                                    )),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    height: 40,
                                                    color: colors[(a++) % 4]),
                                                radioContainer(
                                                  name: "Place of insertion",
                                                  num: 3,
                                                  item: placeList,
                                                  height: 180,
                                                  a: (a++) % 4,
                                                  press: (val) => setState(() {
                                                    poi = int.parse(
                                                        val.toString());
                                                  }),
                                                  selectedButton: poi,
                                                  fun: (val){
                                                    setState(() {
                                                      poi = val;
                                                    });
                                                  },
                                                ),
                                                Cont(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 8),
                                                            child: Text(
                                                              "Type of IUCD insertion",
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: black),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child:
                                                                TextFormField(
                                                              controller: icud,
                                                              decoration:
                                                              const InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                              ),
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      fontSize:
                                                                          14,
                                                                      color:
                                                                          black),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    height: 40,
                                                    color: colors[(a++) % 4]),
                                              ],
                                            )
                                          : const SizedBox(),
                        ],
                      )
                    : method == 3
                        ? Column(
                            children: [
                              radioContainer(
                                name:
                                    "If pregnant \n\nPregnancy test conducted?",
                                num: 2,
                                item: yesno,
                                height: 120,
                                a: (a++) % 4,
                                press: (val) => setState(() {
                                  test = int.parse(val.toString());
                                }),
                                selectedButton: test,
                                fun: (val){
                                  setState(() {
                                    test = val;
                                  });
                                },
                              ),
                              radioContainer(
                                name: "Pregnancy test result",
                                num: 2,
                                item: resultList,
                                height: 120,
                                a: (a++) % 4,
                                press: (val) => setState(() {
                                  result = int.parse(val.toString());
                                }),
                                selectedButton: result,
                                fun: (val){
                                  setState(() {
                                    result = val;
                                  });
                                },
                              ),
                            ],
                          )
                        : method == 4
                            ? Column(
                                children: [
                                  Cont(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: Text(
                                                "Date of discontinuation",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: black),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: TextFormField(
                                                controller: dateDiscontinue,
                                                decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          bottom: 5),
                                                  border: InputBorder.none,
                                                ),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14, color: black),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: GestureDetector(
                                                  onTap: () async {
                                                    var datePicked =
                                                        await DatePicker
                                                            .showSimpleDatePicker(
                                                      context,
                                                      initialDate:
                                                          DateTime(1994),
                                                      firstDate: DateTime(1960),
                                                      lastDate: DateTime(2022),
                                                      dateFormat:
                                                          "dd-MMMM-yyyy",
                                                      locale:
                                                          DateTimePickerLocale
                                                              .en_us,
                                                      looping: true,
                                                    );
                                                    final DateFormat formatter =
                                                        DateFormat(
                                                            'yyyy-MM-dd');
                                                    final String formatted =
                                                        formatter.format(
                                                            datePicked!);
                                                    setState(() {
                                                      dateDiscontinue.text =
                                                          formatted;
                                                    });
                                                    final snackBar = SnackBar(
                                                        content: Text(
                                                            "Date Picked $formatted"));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  },
                                                  child: const Icon(
                                                    Icons
                                                        .calendar_today_outlined,
                                                    color: Colors.black87,
                                                    size: 24,
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                      height: 40,
                                      color: colors[(a++) % 4]),
                                  Cont(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: Text(
                                                "Date of abortion",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: black),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: TextFormField(
                                                controller: dateAbortion,
                                                decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          bottom: 5),
                                                  border: InputBorder.none,
                                                ),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14, color: black),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: GestureDetector(
                                                  onTap: () async {
                                                    var datePicked =
                                                        await DatePicker
                                                            .showSimpleDatePicker(
                                                      context,
                                                      initialDate:
                                                          DateTime(1994),
                                                      firstDate: DateTime(1960),
                                                      lastDate: DateTime(2022),
                                                      dateFormat:
                                                          "dd-MMMM-yyyy",
                                                      locale:
                                                          DateTimePickerLocale
                                                              .en_us,
                                                      looping: true,
                                                    );
                                                    final DateFormat formatter =
                                                        DateFormat(
                                                            'yyyy-MM-dd');
                                                    final String formatted =
                                                        formatter.format(
                                                            datePicked!);
                                                    setState(() {
                                                      dateAbortion.text =
                                                          formatted;
                                                    });
                                                    final snackBar = SnackBar(
                                                        content: Text(
                                                            "Date Picked $formatted"));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  },
                                                  child: const Icon(
                                                    Icons
                                                        .calendar_today_outlined,
                                                    color: Colors.black87,
                                                    size: 24,
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                      height: 40,
                                      color: colors[(a++) % 4]),
                                  radioContainer(
                                    name: "Reason for discontinuing",
                                    num: 3,
                                    item: reasonList,
                                    height: 200,
                                    a: (a++) % 4,
                                    press: (val) => setState(() {
                                      reason = int.parse(val.toString());
                                    }),
                                    selectedButton: reason,
                                    fun: (val){
                                      setState(() {
                                        reason = val;
                                      });
                                    },
                                  ),
                                  reason == 3
                                      ? radioContainer(
                                          name:
                                              "If new mode of contraception, \nNew method",
                                          num: 5,
                                          item: newList,
                                          height: 300,
                                          a: (a++) % 4,
                                          press: (val) => setState(() {
                                            newmode = int.parse(val.toString());
                                          }),
                                          selectedButton: newmode,
                                    fun: (val){
                                      setState(() {
                                        newmode = val;
                                      });
                                    },
                                        )
                                      : const SizedBox(),
                                ],
                              )
                            : const SizedBox(),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
                onTap: () async {
                  Map<String, dynamic> data = {
                    "Date": dateTracking.text,
                    "LMP": lmp.text,
                    "Method": methodList[method-1],
                  };

                  await FirebaseFirestore.instance
                      .collection("Details")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection("Eligible Couples")
                      .doc(Provider.of<DocID>(context, listen: false).doc)
                      .collection("Tracking")
                      .doc(dateTracking.text)
                      .set(data);

                  if(method == 1){
                    Map<String, dynamic> details = {
                      "Type" : perSterList[ster-1],
                      "Date" : dateSterializ.text,
                      "Reason" : reasonSterializ.text
                    };

                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context, listen: false).phone)
                        .collection("Eligible Couples")
                        .doc(Provider.of<DocID>(context, listen: false).doc)
                        .collection("Tracking")
                        .doc(dateTracking.text).collection("Permanent").doc(dateTracking.text)
                        .set(details);
                  }

                  else if(method == 2){
                    if(tempster == 1){
                      Map<String, dynamic> temp = {
                        "Number" : condom.text,
                        "Type" : "Condoms"
                      };

                      await FirebaseFirestore.instance
                          .collection("Details")
                          .doc(Provider.of<Details>(context, listen: false).phone)
                          .collection("Eligible Couples")
                          .doc(Provider.of<DocID>(context, listen: false).doc)
                          .collection("Tracking")
                          .doc(dateTracking.text).collection("Temporary Condoms").doc(dateTracking.text)
                          .set(temp);

                    }
                    else if(tempster == 2){
                      Map<String, dynamic> temp = {
                        "Name of Ocp" : ocp.text,
                        "Date" : dateSupply.text,
                      };

                      await FirebaseFirestore.instance
                          .collection("Details")
                          .doc(Provider.of<Details>(context, listen: false).phone)
                          .collection("Eligible Couples")
                          .doc(Provider.of<DocID>(context, listen: false).doc)
                          .collection("Tracking")
                          .doc(dateTracking.text).collection("Temporary OCP").doc(dateTracking.text)
                          .set(temp);

                    }
                    else if(tempster == 3){
                      Map<String, dynamic> temp = {
                        "Weight" : Provider.of<VillageProvider>(context,listen: false).weight,
                        "Sys" : Provider.of<VillageProvider>(context,listen: false).sys,
                        "Dia" : Provider.of<VillageProvider>(context,listen: false).dia,
                        "Date" : dateInjection.text,
                        "Place" : injList[inj-1],
                        "Time" : timeInjection.text,
                      };

                      await FirebaseFirestore.instance
                          .collection("Details")
                          .doc(Provider.of<Details>(context, listen: false).phone)
                          .collection("Eligible Couples")
                          .doc(Provider.of<DocID>(context, listen: false).doc)
                          .collection("Tracking")
                          .doc(dateTracking.text).collection("Temporary Injection").doc(dateTracking.text)
                          .set(temp);

                    }
                    else if(tempster == 4){
                      Map<String, dynamic> temp = {
                        "Date" : dateInsertion.text,
                        "Place" : placeList[poi-1],
                        "ICUD" : icud.text,
                      };

                      await FirebaseFirestore.instance
                          .collection("Details")
                          .doc(Provider.of<Details>(context, listen: false).phone)
                          .collection("Eligible Couples")
                          .doc(Provider.of<DocID>(context, listen: false).doc)
                          .collection("Tracking")
                          .doc(dateTracking.text).collection("Temporary Device").doc(dateTracking.text)
                          .set(temp);

                    }
                  }

                  else if(method == 3){
                    Map<String, dynamic> details = {
                      "Test" : yesno[test-1],
                      "Result" : resultList[result-1],
                    };

                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context, listen: false).phone)
                        .collection("Eligible Couples")
                        .doc(Provider.of<DocID>(context, listen: false).doc)
                        .collection("Tracking")
                        .doc(dateTracking.text).collection("Pregnant").doc(dateTracking.text)
                        .set(details).whenComplete(() async {

                          if(result == 1){

                           DocumentSnapshot<Map<String,dynamic>> ds = await FirebaseFirestore.instance
                                .collection("Details")
                                .doc(Provider.of<Details>(context, listen: false).phone)
                                .collection("Eligible Couples")
                                .doc(Provider.of<DocID>(context, listen: false).doc).get();

                           Map<String,dynamic>? pregData = ds.data();

                            await FirebaseFirestore.instance
                                .collection("Details")
                                .doc(Provider.of<Details>(context, listen: false).phone)
                                .collection("Pregnant").doc(Provider.of<DocID>(context, listen: false).doc).set(pregData!);

                          }

                    });
                  }

                  else if(method == 4){
                    Map<String, dynamic> details = {
                      "Date" : dateDiscontinue.text,
                      "Reason" : reasonList[reason-1],
                      "New Method" : reason == 3 ? newList[newmode-1] : "",
                    };

                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context, listen: false).phone)
                        .collection("Eligible Couples")
                        .doc(Provider.of<DocID>(context, listen: false).doc)
                        .collection("Tracking")
                        .doc(dateTracking.text).collection("Permanent").doc(dateTracking.text)
                        .set(details);
                  }
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(
                    backgroundColor: Colors.black,
                    duration: const Duration(seconds: 2),
                    content: Text(
                      "The details are registered successfully!",
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                  ));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeSub(number: Provider.of<Details>(context, listen: false).phone,)));

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
