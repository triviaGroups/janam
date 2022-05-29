import 'package:flutter/material.dart';
import 'package:janam/Village%20Survey/page2.dart';
import 'package:janam/Widgets/button.dart';
import 'package:janam/Widgets/dropdown.dart';
import 'package:janam/Widgets/heading.dart';
import 'package:janam/Widgets/search.dart';
import 'package:janam/Widgets/textbox.dart';
import 'package:janam/Widgets/topic.dart';
import 'package:janam/constants/color_constants.dart';

class vpage1 extends StatefulWidget {
  const vpage1({Key? key}) : super(key: key);

  @override
  _vpage1State createState() => _vpage1State();
}

class _vpage1State extends State<vpage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            topic("Village survey","Add new household"),
            const SizedBox(
              height: 24,
            ),
            DropDown("Select village", "Village name"),
            DropDown("Add new", "Select"),
            Heading("Add new household"),
            textBox("Village name"),
            textBox("Village name"),
            textBox("Village name"),
            textBox("Village name"),
            textBox("Village name"),
            Heading("Select household"),
            searchWidget(),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> vPage2()));
              },
                child: Button("Next")),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ));
  }
}
