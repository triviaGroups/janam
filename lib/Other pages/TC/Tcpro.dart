import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class tcpro with ChangeNotifier {

  int _I8 = 0;
  int _D8 = 0;

  int get I8 => _I8;
  int get D8 => _D8;

  void incI8(){
    this._I8++;
  }

  void decI8(){
    this._I8--;
    if(this._I8 < 0){
      this._I8 = 0;
    }
  }

  void incD8(){
    this._D8++;
  }

  void decD8(){
    this._D8--;
    if(this._D8 < 0){
      this._D8 = 0;
    }
  }

  int _I2 = 0;
  int _D2 = 0;

  int get I2 => _I2;
  int get D2 => _D2;

  void incI2(){
    this._I2++;
  }

  void decI2(){
    this._I2--;
    if(this._I2 < 0){
      this._I2 = 0;
    }
  }

  void incD2(){
    this._D2++;
  }

  void decD2(){
    this._D2--;
    if(this._D2 < 0){
      this._D2 = 0;
    }
  }

}

