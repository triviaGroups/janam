
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NurseDetails with ChangeNotifier {

  File? _file;

  void add_file(File file)
  {
    this._file = file;
    print("File data here");
    print(_file);
  }

  File? get_file(){
    return _file;
  }

}