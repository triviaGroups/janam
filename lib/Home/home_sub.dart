import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Home/home.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: check ? Home(num: widget.number,) :  const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
