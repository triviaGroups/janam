import 'package:flutter/material.dart';

class villageDetailsDataList
{
  String name;

  villageDetailsDataList({required this.name});
}

List<villageDetailsDataList> villageDetailsList()
{

  // ignore: deprecated_member_use
  List<villageDetailsDataList> vil = <villageDetailsDataList>[];

  villageDetailsDataList vl = new villageDetailsDataList(name: "Village1 - Name");
  vil.add(vl);

  return vil;
}