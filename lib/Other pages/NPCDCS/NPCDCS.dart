import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Other%20pages/ORS/ORSpro.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/SearchWidgets/search.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:janam/provider/villageProvider.dart';
import 'package:provider/provider.dart';

class NPCDCS extends StatefulWidget {
  const NPCDCS({Key? key}) : super(key: key);

  @override
  _NPCDCSState createState() => _NPCDCSState();
}

class _NPCDCSState extends State<NPCDCS> {
  int a = 0;
  int tobacco = 0;
  int tob_smokeless = 0;
  int alcohol = 0;
  int sedentary = 0;
  int history = 0;
  int oral = 0;
  int breast = 0;
  int cervix = 0;
  int status = 0;

  List<String> ncd = const [
    "Diabetes mellitus",
    "Hypertension",
    "Heart disease (CVD)",
    "Stroke",
    "Kidney disease (CKD)",
    "COPID",
    "Pul. TB",
    "Cancer"
  ];
  
  List<String> yn =  const ["Yes", "No"];
  List<String> cavity = const ["Normal","Abnormal"];
  List<String> historyList = const ["Diabetes","High BP","CVD","Stroke","COPD","CKD","RHD","Pul. TB","Cancer"];
  List<String> statusList = const ["Referred to FU","Lost to FU","Dead"];
  List<bool> ncdbool = [false,false,false,false,false,false,false,false];

  TextEditingController name = new TextEditingController();
  TextEditingController addr = new TextEditingController();
  TextEditingController dob = new TextEditingController();

  TextEditingController fbs = new TextEditingController();
  TextEditingController rbs = new TextEditingController();
  TextEditingController other = new TextEditingController();

  TextEditingController start = new TextEditingController();
  TextEditingController co = new TextEditingController();
  TextEditingController remark = new TextEditingController();

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
                topic("NPCDCS", "Enter member"),
                Cont(
                    child: Column(
                      children: [
                        Expanded(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Name of member",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(

                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  controller: name,
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                  ),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: black),
                                ),
                              ),),
                          ],
                        ),),
                        Expanded(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Address",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  controller: addr,
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                  ),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: black),
                                ),
                              ),),
                          ],
                        ),),
                        Expanded(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Date of birth",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(

                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  controller: dob,
                                  decoration: InputDecoration(
                                      hintText: "",
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(fontSize: 14, color: black)
                                  ),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: black),
                                ),
                              ),),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () async{
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
                                      final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                      final String formatted = formatter. format(datePicked!);
                                      setState((){
                                        dob.text = formatted;
                                      });
                                      final snackBar = SnackBar(
                                          content:
                                          Text("Date Picked $formatted"));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    child: Icon(Icons.calendar_today_outlined,color: Colors.black87,size: 24,)),
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                    height: 300,
                    color: colors[(a++) % 4]),
                CheckBoxCont(
                  name: "Known NCD",
                  item: ncd,
                  height: 568,
                  a: (a++) % 4,
                  boolean: ncdbool,
                ),
                radioContainer(
                  name: "Tobacco - Smoking",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    tobacco = int.parse(val.toString());
                    print("$tobacco");
                  }),
                  selectedButton: tobacco,
                ),
                radioContainer(
                  name: "Tobacco - Smokeless (Chewing / snuffing)",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    tob_smokeless = int.parse(val.toString());
                    print("$tob_smokeless");
                  }),
                  selectedButton: tob_smokeless,
                ),
                radioContainer(
                  name: "Alcohol consumption in last ? months",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    alcohol = int.parse(val.toString());
                    print("$alcohol");
                  }),
                  selectedButton: alcohol,
                ),
                radioContainer(
                  name: "Sedentary lifestyle",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    sedentary = int.parse(val.toString());
                    print("$sedentary");
                  }),
                  selectedButton: sedentary,
                ),
                radioContainer(
                  name: "Family history",
                  num: 9,
                  item: historyList,
                  height: 500,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    history = int.parse(val.toString());
                    print("$history");
                  }),
                  selectedButton: history,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "Height",
                    count: Provider.of<orspro>(context,listen: false).height,
                    height: 60,
                    add: (){
                      Provider.of<orspro>(context,listen: false).incHeight();
                      setState(() {

                      });
                    },
                    sub: (){
                      Provider.of<orspro>(context,listen: false).decHeight();
                      setState(() {

                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "Weight (kg)",
                    count: Provider.of<orspro>(context,listen: false).weight,
                    height: 60,
                    add: (){
                      Provider.of<orspro>(context,listen: false).incWeight();
                      setState(() {

                      });
                    },
                    sub: (){
                      Provider.of<orspro>(context,listen: false).decWeight();
                      setState(() {

                      });
                    },
                  ),
                ),
                Container(
                  height: 69,
                  margin: EdgeInsets.symmetric(
                      vertical: 8, horizontal: 24),
                  padding: EdgeInsets.symmetric(
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
                          offset: Offset(1, 2),
                        ),
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
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
                                      padding: EdgeInsets
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
                                      padding: EdgeInsets
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
                                            Offset(
                                                1,
                                                2),
                                          ),
                                        ],
                                      ),
                                      child: Transform
                                          .translate(
                                          offset:
                                          Offset(
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
                                      padding: EdgeInsets
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
                                      padding: EdgeInsets
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
                                            Offset(
                                                1,
                                                2),
                                          ),
                                        ],
                                      ),
                                      child: Transform
                                          .translate(
                                          offset:
                                          Offset(
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
                                      padding: EdgeInsets
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
                                      padding: EdgeInsets
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
                                            Offset(
                                                1,
                                                2),
                                          ),
                                        ],
                                      ),
                                      child: Transform
                                          .translate(
                                          offset:
                                          Offset(
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
                                      padding: EdgeInsets
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
                                      padding: EdgeInsets
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
                                            Offset(
                                                1,
                                                2),
                                          ),
                                        ],
                                      ),
                                      child: Transform
                                          .translate(
                                          offset:
                                          Offset(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Blood sugar -FBS-----",
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
                              controller: fbs,
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
                              "Blood sugar -RBS",
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
                              controller: rbs,
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
                radioContainer(
                  name: "Oral cavity",
                  num: 2,
                  item: cavity,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    oral = int.parse(val.toString());
                    print("$oral");
                  }),
                  selectedButton: oral,
                ),
                radioContainer(
                  name: "Breast examination",
                  num: 2,
                  item: cavity,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    breast = int.parse(val.toString());
                    print("$breast");
                  }),
                  selectedButton: breast,
                ),
                radioContainer(
                  name: "Visual examination of cervix",
                  num: 2,
                  item: cavity,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    cervix = int.parse(val.toString());
                    print("$cervix");
                  }),
                  selectedButton: cervix,
                ),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Any other",style: GoogleFonts.poppins(
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
                             controller: other,
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
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Start of treatment",
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
                              controller: start,
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
                radioContainer(
                  name: "Status",num: 3,
                  item: statusList,
                  height: 160,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    status = int.parse(val.toString());
                    print("$status");
                  }),
                  selectedButton: status,
                ),
                Cont(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "Any other co-morbidities",
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
                              controller: co,
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
                              "Remarks",
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
                              controller: remark,
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
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () async{
                    List<String> mn = [];

                    for(int i=0;i<ncd.length;i++){
                      if(ncdbool[i]){
                        mn.add(ncd[i]);
                      }
                    }

                    Map<String, dynamic> data = {
                      "Name" : name.text,
                      "Address" : addr.text,
                      "DOB" : dob.text,
                      "Known NCD" : mn,
                      "Tobacco smoking" : yn[tobacco-1],
                      "Tobacco smokeless" : yn[tob_smokeless-1],
                      "Alcohol consumption" : yn[alcohol-1],
                      "Sedentary lifestyle" : yn[sedentary-1],
                      "Family history" : historyList[history-1],
                      "Height" : Provider.of<orspro>(context,listen: false).height,
                      "Weight" : Provider.of<orspro>(context,listen: false).weight,
                      "Sys" : Provider.of<VillageProvider>(context,listen: false).sys,
                      "Dia" : Provider.of<VillageProvider>(context,listen: false).dia,
                      "FBS" : fbs.text,
                      "RBS" : rbs.text,
                      "Oral cavity" : cavity[oral-1],
                      "Breast Examination" : cavity[breast-1],
                      "Cervix" : cavity[cervix-1],
                      "Any other" : other.text,
                      "Start of treatment" : start.text,
                      "Status" : statusList[status-1],
                      "Co-morbidities" : co.text,
                      "Remarks" : remark.text,
                    };

                    var now = new DateTime.now();
                    var formatter = new DateFormat('yyyy-MM-dd');
                    String formattedDate = formatter.format(now);
                    await FirebaseFirestore.instance
                        .collection("NPCDCS")
                        .doc(Provider.of<Details>(context, listen: false)
                        .phone).collection(formattedDate.toString()).doc(name.text)
                        .set(data);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeSub(
                              number:
                              Provider.of<Details>(context, listen: false)
                                  .phone,
                            )));
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
