import 'package:flutter/material.dart';

class villageDetailsDataList
{
  String villageName;

  villageDetailsDataList({required this.villageName});
}

List<villageDetailsDataList> villageDetailsList()
{

  // ignore: deprecated_member_use
  List<villageDetailsDataList> vil = <villageDetailsDataList>[];

  villageDetailsDataList vl = new villageDetailsDataList(villageName: "Village1 - Name");
  vil.add(vl);

  vl = new villageDetailsDataList(villageName: "Village2 - Name");
  vil.add(vl);



  return vil;
}