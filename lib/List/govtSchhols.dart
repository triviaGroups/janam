import 'package:flutter/material.dart';

class govtSchoolsDetailsDataList
{
  String name;

  govtSchoolsDetailsDataList({required this.name});
}

List<govtSchoolsDetailsDataList> govtDetailsList()
{
  // ignore: deprecated_member_use
  List<govtSchoolsDetailsDataList> gwc = <govtSchoolsDetailsDataList>[];

  govtSchoolsDetailsDataList  gw = new govtSchoolsDetailsDataList(name: "AWC1 - Name");
  gwc.add(gw);

  gw = new govtSchoolsDetailsDataList(name: "AWC2 - Name");
  gwc.add(gw);

  return gwc;
}