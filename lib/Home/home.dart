import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> rmnca = ["Eligible couple","Pregnant women","Antenatal checkup","Postnatal checkup","Immunization","Close the case"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 155,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32))),
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
                              "Revathy!",
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
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Programs",
                      style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: orange),
                    ),
                  ),
                  programs("Village survey"),
                  programs(
                      "Reproductive, Maternal, Newborn, Child, Adolescent Health "),
                  Container(
                    height: 250,
                    alignment: Alignment.center,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20),
                        itemCount: 6,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: orange,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: Offset(1, 2),
                                  ),
                                ],
                              ),
                            child: Text(
                              rmnca[index],
                              style: GoogleFonts.inter(
                                  fontSize: 12, fontWeight: FontWeight.w600, color: white),
                              softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }),
                  ),
                  programs("Village Health & Nutrition Day (VHND)"),
                  programs("National Iron Plus Initiative (NIPI)"),
                  programs("NPCDCS - Cancer, diabetes, CVD & stroke"),
                  programs("Stock register"),
                  programs("Death register"),
                  programs("ORS"),
                  programs("AEFI"),
                  programs("Temperature chart"),
                  programs("IDSP"),
                  programs("Covid 19"),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Padding programs(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 130,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: Container(
          height: 80,
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
    );
  }
}
