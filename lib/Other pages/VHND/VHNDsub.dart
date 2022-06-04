import 'package:flutter/material.dart';
import 'package:janam/Other%20pages/VHND/VHND.dart';
import 'package:janam/Other%20pages/VHND/VHNDpro.dart';
import 'package:provider/provider.dart';

class Vhndsub extends StatefulWidget {
  final String number;
  const Vhndsub({Key? key, required this.number}) : super(key: key);

  @override
  _VhndsubState createState() => _VhndsubState();
}

class _VhndsubState extends State<Vhndsub> {
  bool check = false;
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<vhndpro>(context,listen: false).getData(widget.number).whenComplete(() => {
      setState(() {
        check = true;
      })
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return check ? const VHND() : const SizedBox();
  }
}
