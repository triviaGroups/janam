import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class PregDocID with ChangeNotifier {
  String _doc = "";
  String _address = "";
  int _G = 0;
  String _name = "";
  String _dob = "";
  int _bwieght = 3000;

  int _weight = 0;
  int _height = 0;
  int _hae = 0;
  int _folic = 0;
  int _iron = 0;

  String get doc => _doc;
  String get address => _address;


  int get G => _G;
  String get name => _name;
  String get dob => _dob;

  int get weight => _weight;
  int get height => _height;
  int get hae => _hae;
  int get folic => _folic;
  int get iron => _iron;
  int get bweight => _bwieght;

  void setEc(String val,String add,int g,String name,String dob){
    this._doc = val;
    this._address = add;
    this._G = g;
    this._name = name;
    this._dob = dob;
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

  void incHae(){
    this._hae++;
  }

  void decHae(){
    this._hae--;
    if(this._hae < 0){
      this._hae = 0;
    }
  }

  void incFolic(){
    this._folic++;
  }

  void decFolic(){
    this._folic--;
    if(this._folic < 0){
      this._folic = 0;
    }
  }

  void incIron(){
    this._iron++;
  }

  void decIron(){
    this._iron--;
    if(this._iron < 0){
      this._iron = 0;
    }
  }

  void incbWei(){
    this._bwieght++;
  }

  void decbWei(){
    this._bwieght--;
    if(this._bwieght < 0){
      this._bwieght = 0;
    }
  }
}