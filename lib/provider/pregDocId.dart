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
  List<int> _list = [];
  List<String> _birthDoses = [];

  int _weight = 0;
  int _height = 0;
  int _hae = 0;
  int _difference = 0;
  int _folic = 0;
  int _iron = 0;
  String _date = "";

  String get doc => _doc;
  String get address => _address;
  String get date => _date;
  String get village => _village;
  List<int> get list => _list;
  List<String> get bD => _birthDoses;
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

  void setCc(String val,String add,String da,String name,String dob,String vi,List<String> a,List<String> b,List<String> c,List<String> d){
    _doc = val;
    _address = add;
    _date = da;
    _name = name;
    _dob = dob;
    _village = vi;
    _list.add(int.parse(a[0]));
    _list.add(int.parse(b[0]));
    _list.add(int.parse(c[0]));
    _list.add(int.parse(d[0]));
    _birthDoses.add(a[1]);
    _birthDoses.add(b[1]);
    _birthDoses.add(c[1]);
    _birthDoses.add(d[1]);
    final birthday = DateTime.parse(_date);
    final date2 = DateTime.now();
    _difference = date2.difference(birthday).inDays;
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