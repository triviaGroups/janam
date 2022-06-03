import 'package:flutter/material.dart';
import 'package:janam/Other%20pages/NIPI/NIPI.dart';
import 'package:janam/Other%20pages/NIPI/NIPIpro.dart';
import 'package:janam/Other%20pages/NIPI/NIPIpro.dart';
import 'package:janam/Other%20pages/VHND/VHND.dart';
import 'package:provider/provider.dart';

class Nipisub extends StatefulWidget {
  final String number;
  const Nipisub({Key? key, required this.number}) : super(key: key);

  @override
  _NipisubState createState() => _NipisubState();
}

class _NipisubState extends State<Nipisub> {
  bool check = false;
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<nipipro>(context,listen: false).getData(widget.number).whenComplete(() => {
      setState(() {
        check = true;
      })
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return check ? NIPI() : SizedBox();
  }
}
