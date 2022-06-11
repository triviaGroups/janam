import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Other%20pages/ORS/ORSpro.dart';
import 'package:janam/Other%20pages/search_common.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
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
  int tobacco = 1;
  int tobSmokeless = 1;
  int alcohol = 1;
  int sedentary = 1;
  int history = 1;
  int oral = 1;
  int breast = 1;
  int cervix = 1;
  int status = 1;

  List<String> ncd = const [
    "Diabetes mellitus",
    "Hypertension",
    "Heart disease (CVD)",
    "Stroke",
    "Kidney disease (CKD)",
    "COVID",
    "Pul. TB",
    "Cancer"
  ];

  TextEditingController height =  TextEditingController();
  TextEditingController weight =  TextEditingController();
  
  List<String> yn =  const ["Yes", "No"];
  List<String> cavity = const ["Normal","Abnormal"];
  List<String> historyList = const ["Diabetes","High BP","CVD","Stroke","COPD","CKD","RHD","Pul. TB","Cancer"];
  List<String> statusList = const ["Referred to FU","Lost to FU","Dead"];
  List<bool> ncdBool = [false,false,false,false,false,false,false,false];


  TextEditingController sys =  TextEditingController();
  TextEditingController dia =  TextEditingController();

  TextEditingController name =  TextEditingController();
  TextEditingController addr =  TextEditingController();
  TextEditingController dob =  TextEditingController();

  TextEditingController fbs =  TextEditingController();
  TextEditingController rbs =  TextEditingController();
  TextEditingController other =  TextEditingController();

  TextEditingController start =  TextEditingController();
  TextEditingController co =  TextEditingController();
  TextEditingController remark =  TextEditingController();



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
                topic("NPCDCS", "Select member"),
                searchCommon(),
                Cont(
                    child: Row(
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
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              context.watch<orspro>().name,
                              style:
                              GoogleFonts.poppins(fontSize: 14, color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 40,
                    color: colors[(a++) % 4]),
                CheckBoxCont(
                  name: "Known NCD",
                  item: ncd,
                  height: 568,
                  a: (a++) % 4,
                  boolean: ncdBool,
                ),
                radioContainer(
                  name: "Tobacco - Smoking",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    tobacco = int.parse(val.toString());
                  }),
                  selectedButton: tobacco,
                  fun: (val){
                    setState(() {
                      tobacco = val;
                    });
                  },
                ),
                radioContainer(
                  name: "Tobacco - Smokeless (Chewing / snuffing)",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    tobSmokeless = int.parse(val.toString());
                  }),
                  selectedButton: tobSmokeless,
                  fun: (val){
                    setState(() {
                      tobSmokeless = val;
                    });
                  },
                ),
                radioContainer(
                  name: "Alcohol consumption in last ? months",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    alcohol = int.parse(val.toString());
                  }),
                  selectedButton: alcohol,
                  fun: (val){
                    setState(() {
                      alcohol = val;
                    });
                  },
                ),
                radioContainer(
                  name: "Sedentary lifestyle",
                  num: 2,
                  item: yn,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    sedentary = int.parse(val.toString());
                  }),
                  selectedButton: sedentary,
                  fun: (val){
                    setState(() {
                      sedentary = val;
                    });
                  },
                ),
                radioContainer(
                  name: "Family history",
                  num: 9,
                  item: historyList,
                  height: 500,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    history = int.parse(val.toString());
                  }),
                  selectedButton: history,
                  fun: (val){
                    setState(() {
                      history = val;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "Height",
                    fun: (val){
                      Provider.of<orspro>(context,listen: false).setHeight(height.text);
                    },
                    tec: height,
                    count: Provider.of<orspro>(context,listen: false).height,
                    height: 60,
                    add: (){
                      Provider.of<orspro>(context,listen: false).incHeight();
                      height.text = Provider.of<orspro>(context,listen: false).height.toString();
                      setState(() {

                      });
                    },
                    sub: (){
                      Provider.of<orspro>(context,listen: false).decHeight();
                      height.text = Provider.of<orspro>(context,listen: false).height.toString();
                      setState(() {

                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    tec: weight,
                    name: "Weight (kg)",
                    fun: (val){
                      Provider.of<orspro>(context,listen: false).setWeight(weight.text);
                  },
                    count: Provider.of<orspro>(context,listen: false).weight,
                    height: 60,
                    add: (){
                      Provider.of<orspro>(context,listen: false).incWeight();
                      weight.text = Provider.of<orspro>(context,listen: false).weight.toString();
                      setState(() {

                      });
                    },
                    sub: (){
                      Provider.of<orspro>(context,listen: false).decWeight();
                      weight.text = Provider.of<orspro>(context,listen: false).weight.toString();
                      setState(() {

                      });
                    },
                  ),
                ),
                Container(
                  height: 150,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 24),
                  padding:const  EdgeInsets.symmetric(
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
                                      .w500,
                                  color: black),
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
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
                                                  8),
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
                                                      0),
                                                  child:
                                                  GestureDetector(
                                                    onTap: (){
                                                      Provider.of<VillageProvider>(context,listen: false).incSys();
                                                      sys.text = Provider.of<VillageProvider>(context,listen: false).sys.toString();
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
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8),
                                              alignment: Alignment.center,
                                              color: Colors.white,
                                              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                                              child: TextFormField(
                                                controller: sys,
                                                onChanged: (val){
                                                  Provider.of<VillageProvider>(context, listen: false).setSys(val);
                                                },
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  hintStyle: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                      color: black),
                                                ),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: black),
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
                                                  const Offset(
                                                      0,
                                                      -4),
                                                  child:
                                                  GestureDetector(
                                                    onTap: (){
                                                      Provider.of<VillageProvider>(context,listen: false).decSys();
                                                      sys.text = Provider.of<VillageProvider>(context,listen: false).sys.toString();
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
                                              padding:const  EdgeInsets
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
                                                  const Offset(
                                                      0,
                                                      0),
                                                  child:
                                                  GestureDetector(
                                                    onTap: (){
                                                      Provider.of<VillageProvider>(context,listen: false).incDis();
                                                      dia.text = Provider.of<VillageProvider>(context,listen: false).dia.toString();
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
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8),
                                              alignment: Alignment.center,
                                              color: Colors.white,
                                              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                                              child: TextFormField(
                                                controller: dia,
                                                onChanged: (val){
                                                  Provider.of<VillageProvider>(context, listen: false).setDia(val);
                                                },
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  hintStyle: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                      color: black),
                                                ),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: black),
                                              ),
                                            )),
                                        Expanded(
                                            child:
                                            Container(
                                              padding:const  EdgeInsets
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
                                                  const Offset(
                                                      0,
                                                      -4),
                                                  child:
                                                  GestureDetector(
                                                    onTap: (){
                                                      Provider.of<VillageProvider>(context,listen: false).decDis();
                                                      dia.text = Provider.of<VillageProvider>(context,listen: false).dia.toString();
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
                          ))
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
                  name: "Oral cavity",
                  num: 2,
                  item: cavity,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    oral = int.parse(val.toString());

                  }),
                  selectedButton: oral,
                  fun: (val){
                    setState(() {
                      oral = val;
                    });
                  },
                ),
                radioContainer(
                  name: "Breast examination",
                  num: 2,
                  item: cavity,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    breast = int.parse(val.toString());

                  }),
                  selectedButton: breast,
                  fun: (val){
                    setState(() {
                      breast = val;
                    });
                  },
                ),
                radioContainer(
                  name: "Visual examination of cervix",
                  num: 2,
                  item: cavity,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    cervix = int.parse(val.toString());

                  }),
                  selectedButton: cervix,
                  fun: (val){
                    setState(() {
                      cervix = val;
                    });
                  },
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
                              "Start of treatment",
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
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              controller: start,
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
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () async {
                                  var datePicked =
                                  await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1960, 1),
                                    lastDate: DateTime(2022, 12),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  final DateFormat formatter =
                                  DateFormat('yyyy-MM-dd');
                                  final String formatted =
                                  formatter.format(datePicked!);
                                  setState(() {
                                    start.text = formatted;
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
                radioContainer(
                  name: "Status",num: 3,
                  item: statusList,
                  height: 160,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    status = int.parse(val.toString());

                  }),
                  selectedButton: status,
                  fun: (val){
                    setState(() {
                      status = val;
                    });
                  },
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
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () async{
                    List<String> mn = [];

                    for(int i=0;i<ncd.length;i++){
                      if(ncdBool[i]){
                        mn.add(ncd[i]);
                      }
                    }

                    Map<String, dynamic> data = {
                      "Name" : Provider.of<orspro>(context,listen: false).name,
                      "Address" : addr.text,
                      "DOB" : dob.text,
                      "Known NCD" : mn,
                      "Tobacco smoking" : yn[tobacco-1],
                      "Tobacco smokeless" : yn[tobSmokeless-1],
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

                    var now = DateTime.now();
                    var formatter = DateFormat('yyyy-MM-dd');
                    String formattedDate = formatter.format(now);
                    await FirebaseFirestore.instance
                        .collection("NPCDCS")
                        .doc(Provider.of<Details>(context, listen: false)
                        .phone).collection(formattedDate.toString()).doc(Provider.of<orspro>(context,listen: false).name)
                        .set(data);
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
