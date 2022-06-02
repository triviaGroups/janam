import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class vhndpro with ChangeNotifier {

  List<String> _village = [];
  int _len = 0;
  int _given = 0;
  int _issued = 0;


  List<String> get village => _village;
  int get given => _given;
  int get issued => _issued;
  int get len => _len;

  Future<void> getData(String num) async{
    await FirebaseFirestore.instance.collection("Details").doc(num).get().then((value) => {
      this._village.add(value['Villages'].toString().substring(1,value['Villages'].toString().length-1)),
    });
    this._len = _village.length;
    
    notifyListeners();
  }

  void incGiven(){
    this._given++;
  }

  void decGiven(){
    this._given--;
    if(this._given < 0){
      this._given = 0;
    }
  }

  void incIssue(){
    this._issued++;
  }

  void decIssue(){
    this._issued--;
    if(this._issued < 0){
      this._issued = 0;
    }
  }

}