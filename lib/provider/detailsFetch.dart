import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Details with ChangeNotifier {
   String _name = "";
   String _phone = "";
   List<dynamic> _village = [];
   
   String get name => _name;
   List<dynamic> get village => _village;
   String get phone => _phone;
   
   Future<void> getData(String num) async{
     await FirebaseFirestore.instance.collection("Details").doc(num).get().then((value) => {
       _name = value['Name'],
       _village = value['Villages'],
     });
     _phone = num;
     notifyListeners();
   }
   
}