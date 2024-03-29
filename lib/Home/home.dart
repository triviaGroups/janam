import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Other%20pages/AEFI/AEFI.dart';
import 'package:janam/Other%20pages/IDSP/IDSP.dart';
import 'package:janam/Other%20pages/NIPI/NIPIsub.dart';
import 'package:janam/Other%20pages/NPCDCS/NPCDCS.dart';
import 'package:janam/Other%20pages/ORS/ORS.dart';
import 'package:janam/Other%20pages/VHND/VHNDsub.dart';
import 'package:janam/Other%20pages/COVID/covid.dart';
import 'package:janam/Other%20pages/DR/deathReg.dart';
import 'package:janam/Other%20pages/Stock/stockReg.dart';
import 'package:janam/Other%20pages/TC/temperatureChart.dart';
import 'package:janam/RMNCH/ANC.dart';
import 'package:janam/RMNCH/Delivery.dart';
import 'package:janam/RMNCH/childCare.dart';
import 'package:janam/RMNCH/closeCase.dart';
import 'package:janam/RMNCH/eligibleCouple.dart';
import 'package:janam/RMNCH/pregnancy.dart';
import 'package:janam/Village%20Survey/page1.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String num;
  const Home({Key? key, required this.num}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> rmnca = [
    "Eligible couple",
    "Pregnant women",
    "Antenatal checkup",
    "Postnatal checkup",
    "Immunization",
    "Close the case"
  ];

  List<Widget> wid =const [
    EligibleCouple(),
    Pregnancy(),
    ANC(),
    Delivery(),
    ChildCare(),
    CloseCase()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: appBg,
          resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 155,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: purple,
                 ),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: GoogleFonts.inter(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: orange),
                            ),
                            Text(
                              context.read<Details>().name.toUpperCase(),
                              style: GoogleFonts.inter(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage("assets/images/nurse.png"),fit: BoxFit.cover),
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "My Programs",
                      style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: orange),
                    ),
                  ),
                  programs("Village survey",const vpage1()),
                  programs(
                      "Reproductive, Maternal, Newborn, Child, Adolescent Health ",const EligibleCouple()),
                  Container(
                    height: 250,
                    alignment: Alignment.center,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>wid[index]));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: orange,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: const Offset(1, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  rmnca[index],
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: white),
                                  softWrap: true,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  programs("Village Health & Nutrition Day (VHND)", Vhndsub(number: widget.num)),
                  programs("National Iron Plus Initiative (NIPI)",Nipisub(number: widget.num)),
                  programs("NPCDCS - Cancer, diabetes, CVD & stroke",const  NPCDCS()),
                  programs("Stock register",const StockReg()),
                  programs("Death register",const DeathReg()),
                  programs("ORS",const ORS()),
                  programs("AEFI",const AEFI()),
                  programs("Temperature chart",const TempChart()),
                  programs("IDSP",const IDSP()),
                  programs("Covid 19",const Covid()),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Padding programs(String text,Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
        },

        child: Container(
          height: 150,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: Container(
            height: 100,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: purple,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                text,
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w600, color: white),
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
