import 'package:flutter/material.dart';
import 'package:janam/Home/home.dart';
import 'package:janam/Other%20pages/NIPI/NIPIpro.dart';
import 'package:janam/Other%20pages/ORS/ORSpro.dart';
import 'package:janam/Other%20pages/TC/Tcpro.dart';
import 'package:janam/Other%20pages/VHND/VHNDpro.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:janam/provider/docIdProvider.dart';
import 'package:janam/provider/nurseProvider.dart';
import 'package:janam/provider/pnpro.dart';
import 'package:janam/provider/pregDocId.dart';
import 'package:janam/provider/villageProvider.dart';
import 'package:provider/provider.dart';

class HomeSub extends StatefulWidget {
  final String number;
  const HomeSub({Key? key, required this.number}) : super(key: key);

  @override
  _HomeSubState createState() => _HomeSubState();
}

class _HomeSubState extends State<HomeSub> {
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Details>(context,listen: false).getData(widget.number).whenComplete(() => {
      setState(() {
        check = true;
      })
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: check ? Dummy(num: widget.number) :  const Center(child: CircularProgressIndicator()),
    );
  }
}

class Dummy extends StatelessWidget {
  final String num;
  const Dummy({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NurseDetails>.value(value: (NurseDetails())),
        ChangeNotifierProvider<VillageProvider>.value(value: (VillageProvider())),
        ChangeNotifierProvider<DocID>.value(value: (DocID())),
        ChangeNotifierProvider<PregDocID>.value(value: (PregDocID())),
        ChangeNotifierProvider<vhndpro>.value(value: vhndpro()),
        ChangeNotifierProvider<nipipro>.value(value: nipipro()),
        ChangeNotifierProvider<orspro>.value(value: orspro()),
        ChangeNotifierProvider<tcpro>.value(value: tcpro()),
        ChangeNotifierProvider<PnPro>.value(value: PnPro()),
      ],
      child: MaterialApp(
        home: Home(num: num,),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

