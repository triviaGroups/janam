import 'package:flutter/material.dart';

class ashaDetailsDataList
{
  String name;

  ashaDetailsDataList({required this.name});
}

List<ashaDetailsDataList> ashaDetailsList()
{

  // ignore: deprecated_member_use
  List<ashaDetailsDataList> ash = <ashaDetailsDataList>[];

  ashaDetailsDataList  as = new ashaDetailsDataList(name: "ASHA1 - Name");
  ash.add(as);

  as = new ashaDetailsDataList(name: "ASHA2 - Name");
  ash.add(as);



  return ash;
}