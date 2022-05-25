import 'package:flutter/material.dart';

import '../Widgets/ListOfVillage.dart';

List<ListOfVillage> villageWidget(){

  List<ListOfVillage> lsv = <ListOfVillage>[];

  lsv.add(ListOfVillage(villageNumber: "Village1",ind: 0,));

  return lsv;
}
