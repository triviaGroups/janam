import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:janam/Login/villageWidget.dart';

class VillageProvider with ChangeNotifier {
  int _G = 0;
  int _P = 0;
  int _L1 = 0;
  int _L2 = 0;
  int _L3 = 0;
  int _A1 = 0;
  int _A2 = 0;
  int _A3 = 0;

  int _weight = 60;
  int _sys = 120;
  int _dia = 80;

  int get G => _G;
  int get P => _P;
  int get L1 => _L1;
  int get L2 => _L2;
  int get L3 => _L3;
  int get A1 => _A1;
  int get A2 => _A2;
  int get A3 => _A3;

  int get weight => _weight;
  int get sys => _sys;
  int get dia => _dia;

  void incG(){
    this._G++;
    print(this._G);
  }

  void decG(){
    this._G--;
    if(this._G < 0){
      this._G = 0;
    }
  }

  void incP(){
    this._P++;

  }

  void decP(){
    this._P--;
    if(this._P < 0){
      this._P = 0;
    }
  }

  void incL1(){
    this._L1++;

  }

  void decL1(){
    this._L1--;
    if(this._L1 < 0){
      this._L1 = 0;
    }
  }

  void incL2(){
    this._L2++;

  }

  void decL2(){
    this._L2--;
    if(this._L2 < 0){
      this._L2 = 0;
    }
  }

  void incL3(){
    this._L3++;

  }

  void decL3(){
    this._L3--;
    if(this._L3 < 0){
      this._L3 = 0;
    }
  }

  void incA1(){
    this._A1++;

  }

  void decA1(){
    this._A1--;
    if(this._A1 < 0){
      this._A1 = 0;
    }
  }

  void incA2(){
    this._A2++;

  }

  void decA2(){
    this._A2--;
    if(this._A2 < 0){
      this._A2 = 0;
    }
  }

  void incA3(){
    this._A3++;

  }

  void decA3(){
    this._A3--;
    if(this._A3 < 0){
      this._A3 = 0;
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

  void incSys(){
    this._sys++;
  }

  void decSys(){
    this._sys--;
    if(this._sys < 0){
      this._sys = 0;
    }
  }

  void incDis(){
    this._dia++;
  }

  void decDis(){
    this._dia--;
    if(this._dia < 0){
      this._dia = 0;
    }
  }

}