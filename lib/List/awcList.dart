import 'package:flutter/material.dart';

class awcDetailsDataList
{
  String name;

  awcDetailsDataList({required this.name});
}

List<awcDetailsDataList> awcDetailsList()
{
  // ignore: deprecated_member_use
  List<awcDetailsDataList> awc = <awcDetailsDataList>[];

  awcDetailsDataList  aw = new awcDetailsDataList(name: "AWC1 - Name");
  awc.add(aw);

  return awc;
}