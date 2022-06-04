import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Other%20pages/NIPI/NIPIpro.dart';
import 'package:janam/Other%20pages/NIPI/searchchi.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/container.dart';
import 'package:janam/Widgets/radioContainer.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class NIPI extends StatefulWidget {
  const NIPI({Key? key}) : super(key: key);

  @override
  _NIPIState createState() => _NIPIState();
}

class _NIPIState extends State<NIPI> {
  int a = 0;
  int awcName = 0;
  int name = 0;

  TextEditingController dateNIPI = TextEditingController();

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
            topic("NIPI", "Select child"),
            const SearchMultiple(),
            context.watch<nipipro>().selected.isEmpty
                ? const SizedBox()
                :  Cont(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "Children participated",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: black),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              margin:
                              const EdgeInsets.only(right: 16, left: 4,top: 4,bottom: 4),
                              child: Text(
                                context.watch<nipipro>()
                                    .selected[index],
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: black),
                              ),
                            );
                          },
                          itemCount: Provider.of<nipipro>(context,
                              listen: false)
                              .selected
                              .length,
                        )),
                  ],
                ),
                height: Provider.of<nipipro>(context, listen: false)
                    .selected
                    .length *
                    40,
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
                          "Date of administration",
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
                          controller: dateNIPI,
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
                                dateNIPI.text = formatted;
                              });
                              final snackBar = SnackBar(
                                  content: Text("Date Picked $formatted"));
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
            radioContainer(
              name: "Name of village",
              num: Provider.of<nipipro>(context, listen: false).village.length,
              item: Provider.of<nipipro>(context, listen: false).village,
              height:
                  Provider.of<nipipro>(context, listen: false).village.length *
                      80,
              a: (a++) % 4,
              press: (val) => setState(() {
                name = int.parse(val.toString());
                Provider.of<nipipro>(context, listen: false).getAwc(name - 1);

              }),
              selectedButton: name,
            ),
            context.watch<nipipro>().awc.isEmpty
                ? const SizedBox()
                : radioContainer(
                    name: "AWC name",
                    num:
                        Provider.of<nipipro>(context, listen: false).awc.length,
                    item: Provider.of<nipipro>(context, listen: false).awc,
                    height: Provider.of<nipipro>(context, listen: false)
                            .awc
                            .length *
                        60,
                    a: (a++) % 4,
                    press: (val) => setState(() {
                      awcName = int.parse(val.toString());
                    }),
                    selectedButton: awcName,
                  ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
                onTap: () async {
                  Map<String, dynamic> data = {
                    "Date": dateNIPI.text,
                    "Children":
                        Provider.of<nipipro>(context, listen: false).selected,
                    "Village": Provider.of<nipipro>(context, listen: false)
                        .village[name - 1],
                    "AWC": Provider.of<nipipro>(context, listen: false)
                        .awc[awcName - 1],
                  };

                  await FirebaseFirestore.instance
                      .collection("NIPI")
                      .doc(Provider.of<Details>(context, listen: false).phone)
                      .collection(Provider.of<nipipro>(context, listen: false)
                          .village[name - 1])
                      .doc(dateNIPI.text)
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
