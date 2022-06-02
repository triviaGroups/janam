import 'package:flutter/material.dart';
import 'package:janam/Home/home.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

import '../RMNCH/ANC.dart';

class HomeSub extends StatefulWidget {
  final String number;
  const HomeSub({Key? key, required this.number}) : super(key: key);

  @override
  _HomeSubState createState() => _HomeSubState();
}

class _HomeSubState extends State<HomeSub> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    Provider.of<Details>(context).getData(widget.number).whenComplete(() => {
          setState(() {
            check = true;
          })
        });
    return Scaffold(
      backgroundColor: white,
      body: check ? Home(num: widget.number,) : SizedBox(),
    );
  }
}
