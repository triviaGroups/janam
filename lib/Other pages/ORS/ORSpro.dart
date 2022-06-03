import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class orspro with ChangeNotifier {

  int _weight = 50;
  int _height = 170;

  int get weight => _weight;
  int get height => _height;

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

