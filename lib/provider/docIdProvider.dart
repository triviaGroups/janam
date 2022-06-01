import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class DocID with ChangeNotifier {
  String _doc = "";
  String _address = "";
  String _G = "";

  String get doc => _doc;
  String get address => _address;
  String get G => _G;

  void setEc(String val,String add,String g){
    this._doc = val;
    this._address = add;
    this._G = g;
    print("Setted");
    notifyListeners();
  }
}