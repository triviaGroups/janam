import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/SearchWidgets/searchPost.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/pregDocId.dart';

class CloseCase extends StatefulWidget {
  const CloseCase({Key? key}) : super(key: key);

  @override
  _CloseCaseState createState() => _CloseCaseState();
}

class _CloseCaseState extends State<CloseCase> {
  int a = 0;
  int close = 1;
  int reason = 1;
  int place = 1;
  int cause = 1;
  int death = 1;
  int dc = 1;

  List<String> h = const ["Home", "Hospital", "In transit"];

  TextEditingController dateMaternal = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController o = TextEditingController();
  TextEditingController dateInfant = TextEditingController();
  TextEditingController dateAbortion = TextEditingController();
  TextEditingController dateDC = TextEditingController();

  TextEditingController ph = TextEditingController();

  List<String> yn = const ["Yes", "No"];
  List<String> id = const [
    "Asphyxia",
    "Low birth weight",
    "High fever",
    "Diarrhoea",
    "Pneumonia",
    "Others"
  ];
  List<String> pid = const ["Home", "Hospital", "In transit"];

  List<String> reasonList = const [
    "Completed",
    "Migration",
    "Maternal death",
    "Infant death",
    "Abortion"
  ];

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
            topic("Closing the case", "Select member"),
            const PostSearch(),
            context.watch<PregDocID>().doc == ""
                ? const SizedBox()
                : Cont(
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Text(
                              Provider.of<PregDocID>(context, listen: false)
                                  .name,
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                            Text(
                              ", Female, " +
                                  (2021 -
                                          (int.parse(Provider.of<PregDocID>(
                                                  context,
                                                  listen: false)
                                              .dob
                                              .substring(0, 4))))
                                      .toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: txt),
                            ),
                          ],
                        )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\nAddress",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                                Text(
                                  Provider.of<PregDocID>(context, listen: false)
                                      .address,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: txt),
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                              ],
                            )),
                      ],
                    ),
                    height: 150,
                    color: colors[(a++) % 4]),
            radioContainer(
              name: "Would you like to close the case",
              num: 2,
              item: yn,
              height: 120,
              a: (a++) % 4,
              press: (val) => setState(() {
                close = int.parse(val.toString());
              }),
              selectedButton: close,
              fun: (val){
                setState(() {
                  close = val;
                });
              },
            ),
            close == 1
                ? Column(
                    children: [
                      radioContainer(
                        name: "Reason for closure",
                        num: 5,
                        item: reasonList,
                        height: 320,
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
                          ? Column(
                              children: [
                                Cont(
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
                                              "Probable cause of maternal death",
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
                                              controller: c,
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
                                    color: colors[(a++) % 4]),
                                radioContainer(
                                  name: "Place of maternal death",
                                  num: 3,
                                  item: h,
                                  height: 200,
                                  a: (a++) % 4,
                                  press: (val) => setState(() {
                                    place = int.parse(val.toString());
                                  }),
                                  selectedButton: place,
                                  fun: (val){
                                    setState(() {
                                      place = val;
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
                                            alignment: Alignment.centerLeft,
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Text(
                                              "Date of maternal death",
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
                                              controller: dateMaternal,
                                              decoration: const InputDecoration(
                                                contentPadding: EdgeInsets.only(
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
                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime(1960,1),
                                                        lastDate: DateTime(2022,12),
                                                    dateFormat: "dd-MMMM-yyyy",
                                                    locale: DateTimePickerLocale
                                                        .en_us,
                                                    looping: true,
                                                  );
                                                  final DateFormat formatter =
                                                      DateFormat('yyyy-MM-dd');
                                                  final String formatted =
                                                      formatter
                                                          .format(datePicked!);
                                                  setState(() {
                                                    dateMaternal.text =
                                                        formatted;
                                                  });
                                                  final snackBar = SnackBar(
                                                      content: Text(
                                                          "Date Picked $formatted"));
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
                              ],
                            )
                          : reason == 4
                              ? Column(
                                  children: [
                                    radioContainer(
                                      name: "Probable cause of infant death",
                                      num: 6,
                                      item: id,
                                      height: 360,
                                      a: (a++) % 4,
                                      press: (val) => setState(() {
                                        cause = int.parse(val.toString());
                                      }),
                                      selectedButton: cause,
                                      fun: (val){
                                        setState(() {
                                          cause = val;
                                        });
                                      },
                                    ),
                                    cause == 6
                                        ? Cont(
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
                                                      "If others,",
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
                                                      controller: o,
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
                                            color: colors[(a++) % 4])
                                        : const SizedBox(),
                                    radioContainer(
                                      name: "Place of infant death",
                                      num: 3,
                                      item: pid,
                                      height: 200,
                                      a: (a++) % 4,
                                      press: (val) => setState(() {
                                        death = int.parse(val.toString());
                                      }),
                                      selectedButton: death,
                                      fun: (val){
                                        setState(() {
                                          death = val;
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
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Text(
                                                  "Date of infant death",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                        BorderRadius.circular(
                                                            5)),
                                                child: TextFormField(
                                                  controller: dateInfant,
                                                  decoration:
                                                      const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            bottom: 5),
                                                    border: InputBorder.none,
                                                  ),
                                                  style: GoogleFonts.poppins(
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
                                                            initialDate: DateTime.now(),
                                                            firstDate: DateTime(1960,1),
                                                            lastDate: DateTime(2022,12),
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
                                                      final String formatted =
                                                          formatter.format(
                                                              datePicked!);
                                                      setState(() {
                                                        dateInfant.text =
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
                              : reason == 5
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
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Text(
                                                      "Date of abortion",
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
                                                      controller: dateAbortion,
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
                                                                initialDate: DateTime.now(),
                                                                firstDate: DateTime(1960,1),
                                                                lastDate: DateTime(2022,12),
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
                                                            dateAbortion.text =
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
                                        radioContainer(
                                          name:
                                              "Was dilation and curettage (D&C) done?",
                                          num: 2,
                                          item: yn,
                                          height: 120,
                                          a: (a++) % 4,
                                          press: (val) => setState(() {
                                            dc = int.parse(val.toString());
                                          }),
                                          selectedButton: dc,
                                          fun: (val){
                                            setState(() {
                                              dc = val;
                                            });
                                          },
                                        ),
                                        dc == 1
                                            ? Column(
                                                children: [
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
                                                                "Place of D&C",
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color:
                                                                        black),
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
                                                                controller: ph,
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
                                                                "Date of D&C",
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color:
                                                                        black),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 4,
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
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
                                                                    dateDC,
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
                                                                            await DatePicker.showSimpleDatePicker(
                                                                          context,
                                                                              initialDate: DateTime.now(),
                                                                              firstDate: DateTime(1960,1),
                                                                              lastDate: DateTime(2022,12),
                                                                          dateFormat:
                                                                              "dd-MMMM-yyyy",
                                                                          locale:
                                                                              DateTimePickerLocale.en_us,
                                                                          looping:
                                                                              true,
                                                                        );
                                                                        final DateFormat
                                                                            formatter =
                                                                            DateFormat('yyyy-MM-dd');
                                                                        final String
                                                                            formatted =
                                                                            formatter.format(datePicked!);
                                                                        setState(
                                                                            () {
                                                                          dateDC.text =
                                                                              formatted;
                                                                        });
                                                                        final snackBar =
                                                                            SnackBar(content: Text("Date Picked $formatted"));
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(snackBar);
                                                                      },
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .calendar_today_outlined,
                                                                        color: Colors
                                                                            .black87,
                                                                        size:
                                                                            24,
                                                                      )),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      height: 40,
                                                      color: colors[(a++) % 4]),
                                                ],
                                              )
                                            : const SizedBox(),
                                      ],
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
                  if (close == 1) {
                    Map<String, dynamic> data = {
                      "docId": Provider.of<PregDocID>(context).doc,
                      "Reason": reasonList[reason],
                    };

                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context).phone)
                        .collection("Closed Case")
                        .doc(Provider.of<PregDocID>(context).doc)
                        .set(data);

                    Map<String, dynamic> r = {};

                    if (reason == 3) {
                      setState(() {
                        r = {
                          "Cause": c.text,
                          "Place": h[place],
                          "Date": dateMaternal.text,
                        };
                      });
                    } else if (reason == 4) {
                      setState(() {
                        r = {
                          "Cause": id[cause],
                          "Other": o.text,
                          "Place": pid[death],
                          "Date": dateInfant.text,
                        };
                      });
                    } else if (reason == 5) {
                      setState(() {
                        r = {
                          "Date of abortion": dateAbortion.text,
                          "D&C": yn[dc],
                        };
                      });

                      if (dc == 1) {
                        r.addAll({
                          "Place": ph.text,
                          "Date of D&C": dateDC.text,
                        });
                      }
                    }

                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context).phone)
                        .collection("Closed Case")
                        .doc(Provider.of<PregDocID>(context).doc)
                        .update(r);

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                      backgroundColor: Colors.black,
                      duration: const Duration(seconds: 2),
                      content: Text(
                        "The details are registered successfully!",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ));

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeSub(
                                number:
                                    Provider.of<Details>(context, listen: false)
                                        .phone)));
                  }
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
