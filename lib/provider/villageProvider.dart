import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
    _G++;
  }

  void setG(String n){
    _G = int.parse(n);
  }

  void decG(){
    _G--;
    if(_G < 0){
      _G = 0;
    }
  }

  void incP(){
    _P++;

  }

  void setP(String n){
    _P = int.parse(n);
  }

  void decP(){
    _P--;
    if(_P < 0){
      _P = 0;
    }
  }

  void incL1(){
    _L1++;

  }

  void setL1(String n){
    _L1 = int.parse(n);
  }

  void decL1(){
    _L1--;
    if(_L1 < 0){
      _L1 = 0;
    }
  }

  void incL2(){
    _L2++;

  }

  void setL2(String n){
    _L2 = int.parse(n);
  }

  void decL2(){
    _L2--;
    if(_L2 < 0){
      _L2 = 0;
    }
  }

  void incL3(){
    _L3++;

  }

  void setL3(String n){
    _L3 = int.parse(n);
  }

  void decL3(){
    _L3--;
    if(_L3 < 0){
      _L3 = 0;
    }
  }

  void incA1(){
    _A1++;
  }

  void setA1(String n){
    _A1 = int.parse(n);
  }

  void decA1(){
    _A1--;
    if(_A1 < 0){
      _A1 = 0;
    }
  }

  void incA2(){
    _A2++;
  }

  void setA2(String n){
    _A2 = int.parse(n);
  }

  void decA2(){
    _A2--;
    if(_A2 < 0){
      _A2 = 0;
    }
  }

  void incA3(){
    _A3++;

  }

  void setA3(String n){
    _A3 = int.parse(n);
  }

  void decA3(){
    _A3--;
    if(_A3 < 0){
      _A3 = 0;
    }
  }

  void incWeight(){
    _weight++;
  }

  void setWeight(String n){
    _weight = int.parse(n);
    notifyListeners();
  }

  void decWeight(){
    _weight--;
    if(_weight < 0){
      _weight = 0;
    }
  }

  void incSys(){
    _sys++;
  }

  void decSys(){
    _sys--;
    if(_sys < 0){
      _sys = 0;
    }
  }

  void incDis(){
    _dia++;
  }

  void decDis(){
    _dia--;
    if(_dia < 0){
      _dia = 0;
    }
  }

}