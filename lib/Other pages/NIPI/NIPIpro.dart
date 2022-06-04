import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
    _selected.add(data);
    notifyListeners();
  }

  void removedata(String data){
    _selected.remove(data);
    notifyListeners();
  }

  Future<void> getData(String num) async{
    await FirebaseFirestore.instance.collection("Details").doc(num).get().then((value) => {
      _village = List.from(value["Villages"])
    });
    _len = _village.length;
    _num = num;

    notifyListeners();
  }

  Future<void> getAwc(int n) async{
    await FirebaseFirestore.instance.collection("Details").doc(_num).collection("village").doc(_village[n]).get().then((value) => {
      _awc  = List.from(value["Awc"])
    });

    notifyListeners();
  }


}

