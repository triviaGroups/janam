import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class tcpro with ChangeNotifier {

  int _I8 = 0;
  int _D8 = 0;

  int get I8 => _I8;
  int get D8 => _D8;

  void incI8(){
    _I8++;
  }

  void decI8(){
    _I8--;
    if(_I8 < 0){
      _I8 = 0;
    }
  }

  void incD8(){
    _D8++;
  }

  void decD8(){
    _D8--;
    if(_D8 < 0){
      _D8 = 0;
    }
  }

  int _I2 = 0;
  int _D2 = 0;

  int get I2 => _I2;
  int get D2 => _D2;

  void incI2(){
    _I2++;
  }

  void decI2(){
    _I2--;
    if(_I2 < 0){
      _I2 = 0;
    }
  }

  void incD2(){
    _D2++;
  }

  void decD2(){
    _D2--;
    if(_D2 < 0){
      _D2 = 0;
    }
  }

}

