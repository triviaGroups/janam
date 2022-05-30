import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class Details with ChangeNotifier {
   String _name = "";
   List<dynamic> _village = [];
   
   String get name => _name;
   List<dynamic> get village => _village;
   
   Future<void> getData(String num) async{
     await FirebaseFirestore.instance.collection("Details").doc(num).get().then((value) => {
       this._name = value['Name'],
       this._village = value['Villages'],
     });
   }
   
}