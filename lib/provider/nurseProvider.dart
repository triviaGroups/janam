
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NurseDetails with ChangeNotifier {

  File? _file;
  String _url = "";

  String get url => _url;

  void add_file(File file)
  {
    _file = file;
  }

  Future<void> add_url(String url)
  async {
    print("provider la print panran");
    print(url);
    this._url = url;
  }

  Future<String> getUrl() async{
    return url;
  }

  File? get_file(){
    return _file;
  }

}