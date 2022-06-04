import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PregDocID with ChangeNotifier {
  String _doc = "";
  String _address = "";
  int _G = 0;
  String _name = "";
  String _dob = "";
  int _bwieght = 3000;
  String _village = "";

  int _weight = 0;
  int _height = 0;
  int _hae = 0;
  int _folic = 0;
  int _iron = 0;

  String get doc => _doc;
  String get address => _address;
  String get village => _village;


  int get G => _G;
  String get name => _name;
  String get dob => _dob;

  int get weight => _weight;
  int get height => _height;
  int get hae => _hae;
  int get folic => _folic;
  int get iron => _iron;
  int get bweight => _bwieght;

  void setEc(String val,String add,int g,String name,String dob,String vi){
    _doc = val;
    _address = add;
    _G = g;
    _name = name;
    _dob = dob;
    _village = vi;
    notifyListeners();
  }

  void incWeight(){
    _weight++;
  }

  void decWeight(){
    _weight--;
    if(_weight < 0){
      _weight = 0;
    }
  }

  void incHeight(){
    _height++;
  }

  void decHeight(){
    _height--;
    if(_height < 0){
      _height = 0;
    }
  }

  void incHae(){
    _hae++;
  }

  void decHae(){
    _hae--;
    if(_hae < 0){
      _hae = 0;
    }
  }

  void incFolic(){
    _folic++;
  }

  void decFolic(){
    _folic--;
    if(_folic < 0){
      _folic = 0;
    }
  }

  void incIron(){
    _iron++;
  }

  void decIron(){
    _iron--;
    if(_iron < 0){
      _iron = 0;
    }
  }

  void incbWei(){
    _bwieght++;
  }

  void decbWei(){
    _bwieght--;
    if(_bwieght < 0){
      _bwieght = 0;
    }
  }
}