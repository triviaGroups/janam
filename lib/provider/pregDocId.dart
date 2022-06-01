import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class PregDocID with ChangeNotifier {
  String _doc = "";
  String _address = "";

  int _weight = 0;
  int _height = 0;

  String get doc => _doc;
  String get address => _address;

  int get weight => _weight;
  int get height => _height;

  void setEc(String val,String add){
    this._doc = val;
    this._address = add;
    print("Setted");
    notifyListeners();
  }

  void incWeight(){
    this._weight++;
  }

  void decWeight(){
    this._weight--;
    if(this._weight < 0){
      this._weight = 0;
    }
  }

  void incHeight(){
    this._height++;
  }

  void decHeight(){
    this._height--;
    if(this._height < 0){
      this._height = 0;
    }
  }

}