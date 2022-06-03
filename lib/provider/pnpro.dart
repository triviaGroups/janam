import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class PnPro with ChangeNotifier {
  int _ifa = 0;
  int _weight = 0;

  int get ifa => _ifa;
  int get weight => _weight;

  void incIfa(){
    this._ifa++;
  }

  void decIfa(){
    this._ifa--;
    if(this._ifa < 0){
      this._ifa = 0;
    }
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

}