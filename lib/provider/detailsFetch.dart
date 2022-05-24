import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Details with ChangeNotifier {
   String _name = "";
   
   String get name => _name;
   
   Future<void> getData(String num) async{
     await FirebaseFirestore.instance.collection("nurse_profile").doc(num).get().then((value) => {
       this._name = value['fullname'],
     });
   }
   
}