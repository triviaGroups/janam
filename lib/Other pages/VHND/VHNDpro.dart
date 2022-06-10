import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class vhndpro with ChangeNotifier {

  List<String> _village = [];
  int _len = 0;
  int _given = 0;
  int _issued = 0;
  List<String> _selected = [];

  void setGiven(String n){
    _given = int.parse(n);
  }

  void setIssued(String n){
    _issued = int.parse(n);
  }


  List<String> get village => _village;
  int get given => _given;
  int get issued => _issued;
  int get len => _len;
  List<String> get selected => _selected;

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
    
    notifyListeners();
  }

  void incGiven(){
    _given++;
  }

  void decGiven(){
    _given--;
    if(_given < 0){
      _given = 0;
    }
  }

  void incIssue(){
    _issued++;
  }

  void decIssue(){
    _issued--;
    if(_issued < 0){
      _issued = 0;
    }
  }

}