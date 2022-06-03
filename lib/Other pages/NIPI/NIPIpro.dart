import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class nipipro with ChangeNotifier {

  List<String> _village = [];
  int _len = 0;
  List<String> _selected = [];
  List<String> _awc = [];
  String _num = "";


  List<String> get village => _village;
  int get len => _len;
  List<String> get selected => _selected;
  List<String> get awc => _awc;

  void putselect(String data){
    this._selected.add(data);
    notifyListeners();
  }

  void removedata(String data){
    this._selected.remove(data);
    notifyListeners();
  }

  Future<void> getData(String num) async{
    await FirebaseFirestore.instance.collection("Details").doc(num).get().then((value) => {
      this._village.add(value['Villages'].toString().substring(1,value['Villages'].toString().length-1)),
    });
    this._len = _village.length;
    this._num = num;

    notifyListeners();
  }

  Future<void> getAwc(int n) async{
    await FirebaseFirestore.instance.collection("Details").doc(this._num).collection("village").doc(this._village[n]).get().then((value) => {
      this._awc.add(value['Awc'].toString().substring(1,value['Awc'].toString().length-1)),
    });

    notifyListeners();
  }


}

