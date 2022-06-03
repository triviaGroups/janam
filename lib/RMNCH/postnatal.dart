import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/chechboxContainer.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/incDecContainer.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:janam/provider/pnpro.dart';
import 'package:provider/provider.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/pregDocId.dart';

class PostnatalCare extends StatefulWidget {
  const PostnatalCare({Key? key}) : super(key: key);

  @override
  _PostnatalCareState createState() => _PostnatalCareState();
}

class _PostnatalCareState extends State<PostnatalCare> {
  int a = 0;
  int method = 0;

  List<String> signs = const [
    "Bleeding",
    "Fever",
    "Foul smelling discharge",
    "Abdominal cramps",
    "Painful breast or cracked nipples",
    "Mental disturbance","Facial or hand swelling",
    "Headaches","Convulsions","Painful calf muscles"
  ];

  List<bool> signbool = [false,false,false,false,false,false,false];

  List<String> danger = const [
    "Difficult breathing",
    "Skin lesions",
    "Yellow skin",
    "Convulsion",
    "Poor sucking, feeding",
    "Lethargy or unconsciousness",
    "Pur or bleeding",
    "red or swollen eyes with pus",
  ];

  List<bool> dangerbool = [false,false,false,false,false,false,false,false];
  List<String> ster = const ["Sterlization", "Nil"];


  TextEditingController dateVisit = new TextEditingController();
  TextEditingController mother = new TextEditingController();
  TextEditingController infant = new TextEditingController();
  TextEditingController name = new TextEditingController();
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
                topic("Postnatal Care", "Select member"),
                context.watch<PregDocID>().doc == ""
                    ? SizedBox()
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "No. of IFA tablets given",
                    count: Provider.of<PnPro>(context,listen: false).ifa,
                    height: 60,
                    add: (){
                      Provider.of<PnPro>(context,listen: false).incIfa();
                      setState(() {
                        
                      });
                    },
                    sub: (){
                      Provider.of<PnPro>(context,listen: false).decIfa();
                      setState(() {
                        
                      });
                    },
                  ),
                ),
                radioContainer(
                  name: "Method of contraception",
                  num: 2,
                  item: ster,
                  height: 120,
                  a: (a++) % 4,
                  press: (val) => setState(() {
                    method = int.parse(val.toString());
                    print("$method");
                  }),
                  selectedButton: method,
                ),
                CheckBoxCont(
                  name: "Mother danger signs",
                  item: signs,
                  height: 760,
                  a: (a++) % 4,
                  boolean: signbool,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: incDec(
                    color: colors[(a++) % 4],
                    name: "Weight of the child",
                    count: Provider.of<PnPro>(context,listen: false).weight,
                    height: 60,
                    add: (){
                      Provider.of<PnPro>(context,listen: false).incWeight();
                      setState(() {
                        
                      });
                    },
                    sub: (){
                      Provider.of<PnPro>(context,listen: false).decWeight();
                      setState(() {
                        
                      });
                    },
                  ),
                ),

                CheckBoxCont(
                  name: "Infant danger signs",
                  item: danger,
                  height: 600,
                  a: (a++) % 4,
                  boolean: dangerbool,
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
                              "Referral facility for mother",
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
                              controller: mother,
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
                              "Referral facility for infant",
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
                              controller: infant,
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
                              "Name of the child",
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
                              controller: name,
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

                    for(int i=0;i<signs.length;i++){
                      if(signbool[i]){
                        mn.add(signs[i]);
                      }
                    }

                    List<String> nm = [];

                    for(int i=0;i<danger.length;i++){
                      if(dangerbool[i]){
                        nm.add(danger[i]);
                      }
                    }

                    Map<String,dynamic> data = {
                      "IFA" : Provider.of<PnPro>(context,listen: false).ifa,
                      "Contraception" : ster[method],
                      "Mother danger signs" : mn,
                      "Weight" : Provider.of<PnPro>(context,listen: false).weight,
                      "Infant danger signs" : nm,
                      "Referral facility for mother" : mother.text,
                      "Referral facility for infant" : infant.text,
                      "Name" : name.text,
                      "PregId" : Provider.of<PregDocID>(context, listen: false).doc
                    };

                    await FirebaseFirestore.instance
                        .collection("Details")
                        .doc(Provider.of<Details>(context, listen: false)
                        .phone)
                        .collection("Post Pregnancy")
                        .doc(Provider.of<PregDocID>(context, listen: false)
                        .doc).collection("Postnatal").doc(Provider.of<PregDocID>(context, listen: false)
                        .doc).set(data);
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
