import 'package:flutter/material.dart';

class privateSchoolsDetailsDataList
{
  String name;

  privateSchoolsDetailsDataList({required this.name});
}

List<privateSchoolsDetailsDataList> pvtDetailsList()
{
  // ignore: deprecated_member_use
  List<privateSchoolsDetailsDataList> pvs = <privateSchoolsDetailsDataList>[];

  privateSchoolsDetailsDataList  pw = new privateSchoolsDetailsDataList(name: "Pvt School1 - Name");
  pvs.add(pw);

  return pvs;
}