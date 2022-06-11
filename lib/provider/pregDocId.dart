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
  int _difference = 0;
  int _folic = 0;
  int _iron = 0;

  String get doc => _doc;
  String get address => _address;
  String get village => _village;
  int get diff => _difference;


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

  void setCc(String val,String add,String name,String dob,String vi){
    _doc = val;
    _address = add;
    _name = name;
    _dob = dob;
    _village = vi;
    final birthday = DateTime.parse(_dob);
    final date2 = DateTime.now();
    _difference = date2.difference(birthday).inDays;
    print("Difference" + _difference.toString());
    notifyListeners();
  }

  void incWeight(){
    _weight++;
  }

  void setWeight(String n){
    _weight = int.parse(n);
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

  void setHeight(String n){
    _height = int.parse(n);
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

  void setHae(String n){
    _hae = int.parse(n);
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

  void setFolic(String n){
    _folic = int.parse(n);
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

  void setIron(String n){
    _iron = int.parse(n);
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

  void setWei(String n){
    _bwieght = int.parse(n);
  }

  void decbWei(){
    _bwieght--;
    if(_bwieght < 0){
      _bwieght = 0;
    }
  }
}