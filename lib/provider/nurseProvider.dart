import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NurseDetails with ChangeNotifier {
  String _name = "";
  String _phcn = "";
  String _sub = "";

  List<String> _village = [];
  List<String> _pop = [];
  List<String> _ilr = [];
  List<String> _freezer = [];
  int _village_count = 0;

  List<List<String>> _asha_name = [[""]];
  List<List<String>> _asha_mob = [[""]];
  List<int> _asha_count = [];

  List<List<String>> _awc_name = [[""]];
  List<List<String>> _awc_mob = [[""]];
  List<List<String>> _awc_chi = [[""]];
  List<int> _awc_count = [];

  List<List<String>> _gvt_name = [[""]];
  List<List<String>> _gvt_mob = [[""]];
  List<List<String>> _gvt_chi = [[""]];
  List<int> _gvt_count = [];

  List<List<String>> _pvt_name = [[""]];
  List<List<String>> _pvt_mob = [[""]];
  List<List<String>> _pvt_chi = [[""]];
  List<int> _pvt_count = [];


  void details(){

    //
    // for(int i=0;i<_village_count;i++){
    //   try{
    //     _asha_count[i] = _asha_count[i]+1;
    //   }
    //   catch(e){
    //     _asha_count.insert(i, 1);
    //   }
    //   try{
    //     _awc_count[i] = _awc_count[i]+1;
    //   }
    //   catch(e){
    //     _awc_count.insert(i, 1);
    //   }
    //   try{
    //     _gvt_count[i] = _gvt_count[i]+1;
    //   }
    //   catch(e){
    //     _gvt_count.insert(i, 1);
    //   }
    //   try{
    //     _pvt_count[i] = _pvt_count[i]+1;
    //   }
    //   catch(e){
    //     _pvt_count.insert(i, 1);
    //   }
    // }
    //
    // print("Lengthsss");
    // print(_village_count);
    // print(_asha_name.length);
    // print(_awc_name.length);
    // print(_gvt_name.length);
    // print(_pvt_name.length);
    //
    //
    // print("Haaalloo");
    // print(_village.length);
    // print(_asha_count);
    // print(_awc_count);
    // print(_gvt_count);
    // print(_pvt_count);
    //
    //
    // _village.removeRange(_village_count+1, _village.length);
    // _pop.removeRange(_village_count+1, _pop.length);
    // _ilr.removeRange(_village_count+1, _ilr.length);
    // _freezer.removeRange(_village_count+1, _freezer.length);
    //
    // _asha_name.removeRange(_village_count+1, _asha_name.length);
    // _awc_name.removeRange(_village_count+1, _awc_name.length);
    // _gvt_name.removeRange(_village_count+1, _gvt_name.length);
    // _pvt_name.removeRange(_village_count+1, _pvt_name.length);
    //
    // _asha_mob.removeRange(_village_count+1, _asha_mob.length);
    // _awc_mob.removeRange(_village_count+1, _awc_mob.length);
    // _gvt_mob.removeRange(_village_count+1, _gvt_mob.length);
    // _pvt_mob.removeRange(_village_count+1, _pvt_mob.length);
    //
    // _awc_chi.removeRange(_village_count+1, _awc_chi.length);
    // _gvt_chi.removeRange(_village_count+1, _gvt_chi.length);
    // _pvt_chi.removeRange(_village_count+1, _pvt_chi.length);
    //
    // for(int i=0;i<_asha_name.length;i++)
    //   _asha_name[i].removeRange(_asha_count[i]+1, _asha_name[i].length);
    //
    // for(int i=0;i<_asha_mob.length;i++)
    //   _asha_mob[i].removeRange(_asha_count[i]+1, _asha_mob[i].length);
    //
    // for(int i=0;i<_awc_name.length;i++)
    //   _awc_name[i].removeRange(_awc_count[i]+1, _awc_name[i].length);
    //
    // for(int i=0;i<_awc_mob.length;i++)
    //   _awc_mob[i].removeRange(_awc_count[i]+1, _awc_mob[i].length);
    //
    // for(int i=0;i<_awc_chi.length;i++)
    //   _awc_chi[i].removeRange(_awc_count[i]+1, _awc_chi[i].length);
    //
    // for(int i=0;i<_gvt_name.length;i++)
    //   _gvt_name[i].removeRange(_gvt_count[i]+1, _gvt_name[i].length);
    //
    // for(int i=0;i<_gvt_mob.length;i++)
    //   _gvt_mob[i].removeRange(_gvt_count[i]+1, _gvt_mob[i].length);
    //
    // for(int i=0;i<_gvt_chi.length;i++)
    //   _gvt_chi[i].removeRange(_gvt_count[i]+1, _gvt_chi[i].length);
    //
    // for(int i=0;i<_pvt_name.length;i++)
    //   _pvt_name[i].removeRange(_pvt_count[i]+1, _pvt_name[i].length);
    //
    // for(int i=0;i<_pvt_mob.length;i++)
    //   _pvt_mob[i].removeRange(_pvt_count[i]+1, _pvt_mob[i].length);
    //
    // for(int i=0;i<_pvt_chi.length;i++)
    //   _pvt_chi[i].removeRange(_pvt_count[i]+1, _pvt_chi[i].length);

    print("================================ PROVIDER ===============================================");
    print(_name);
    print(_village);
    print(_asha_name.toString());
    print(_awc_name.toString());
    print(_gvt_name.toString());
    print(_pvt_name.toString());
    print(_asha_mob.toString());
    print(_awc_mob.toString());
    print(_gvt_mob.toString());
    print(_pvt_mob.toString());
    print(_awc_chi.toString());
    print(_gvt_chi.toString());
    print(_pvt_chi.toString());
    print(_pop);
    print(_ilr);
    print(_freezer);
    print(_phcn);
    print(_sub);

  }

  void set_village_count(int ind){
    print("Village count");
    print(ind.toString());
    _village_count=ind;
    print(_village_count);
  }

  void set_asha_count(int index,int num){
    print("asha count");
    print(index.toString()+" "+num.toString());
    _asha_count.insert(index, num);
    _asha_count.removeRange(index+1, _asha_count.length);
    print(_asha_count);
    _asha_name.add([""]);
    _asha_mob.add([""]);
  }

  void set_awc_count(int index,int num){
    print("awc count");
    print(index.toString()+" "+num.toString());
    _awc_count.insert(index, num);
    _awc_count.removeRange(index+1, _awc_count.length);
    print(_awc_count);
  }

  void set_gvt_count(int index,int num){
    print("Gov count");
    print(index.toString()+" "+num.toString());
    _gvt_count.insert(index, num);
    _gvt_count.removeRange(index+1, _gvt_count.length);
    print(_gvt_count);
  }

  void set_pvt_count(int index,int num){
    print("Pvt count");
    print(index.toString()+" "+num.toString());
    _pvt_count.insert(index, num);
    _pvt_count.removeRange(index+1, _pvt_count.length);
    print(_pvt_count);
  }

  void add_pop(String name,int index){
    _pop.insert(index, name);
    print(_pop);
  }

  void add_ilr(String name,int index){
    _ilr.insert(index, name);
  }

  void add_freezer(String name,int index){
    _freezer.insert(index, name);
  }

  void add_name(String name){
    this._name = name;
  }

  void add_phcn(String name){
    this._phcn = name;
  }

  void add_sub(String name){
    this._sub = name;
  }

  void add_village(String name,int index){
    _village.insert(index,name);
    print(_village);
  }

  void add_asha_name(int in1,int in2,String name){
      List<String> k = _asha_name[in1];
      k[in2] = name;
      _asha_name[in1] = k;
      print(_asha_name);
  }

  void add_asha_mob(int in1,int in2,String name){
    List<String> k = _asha_mob[in1];
    k[in2] = name;
    _asha_mob[in1] = k;
    print(_asha_mob);
  }

  void add_awc_name(int in1,int in2,String name){
    List<String> k = _awc_name[in1];
    k[in2] = name;
    _awc_name[in1] = k;
  }

  void add_awc_mob(int in1,int in2,String name){
    List<String> k = _awc_mob[in1];
    k[in2] = name;
    _awc_mob[in1] = k;
  }

  void add_awc_chi(int in1,int in2,String name){
    List<String> k = _awc_chi[in1];
    k.insert(in2, name);
    _awc_chi.insert(in1, k);
  }

  void add_gvt_name(int in1,int in2,String name){
    List<String> k = _gvt_name[in1];
    k.insert(in2, name);
    _gvt_name.insert(in1, k);
  }

  void add_gvt_mob(int in1,int in2,String name){
    List<String> k = _gvt_mob[in1];
    k.insert(in2, name);
    _gvt_mob.insert(in1, k);
  }

  void add_gvt_chi(int in1,int in2,String name){
    List<String> k = _gvt_chi[in1];
    k.insert(in2, name);
    _gvt_chi.insert(in1, k);
  }

  void add_pvt_name(int in1,int in2,String name){
    List<String> k = _pvt_name[in1];
    k.insert(in2, name);
    _pvt_name.insert(in1, k);
  }

  void add_pvt_mob(int in1,int in2,String name){
    List<String> k = _pvt_mob[in1];
    k.insert(in2, name);
    _pvt_mob.insert(in1, k);
  }

  void add_pvt_chi(int in1,int in2,String name){
    List<String> k = _pvt_mob[in1];
    k.insert(in2, name);
    _pvt_mob.insert(in1, k);
  }

}