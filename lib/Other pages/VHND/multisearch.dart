import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Other%20pages/VHND/VHNDpro.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:provider/provider.dart';

class SearchMulti extends StatefulWidget {
  final int num;
  const SearchMulti({Key? key, required this.num}) : super(key: key);

  @override
  _SearchMultiState createState() => _SearchMultiState();
}

class _SearchMultiState extends State<SearchMulti> {
  TextEditingController _searchController = TextEditingController();
  Future? resultsloaded;
  List _allResults = [];
  List _resultsList = [];

  List _selected = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _searchController.addListener(_onSearchChanged);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    resultsloaded = getData();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  getData() async {
    print("KIO");
    var rk = 
    await FirebaseFirestore.instance
        .collection("Village Details")
        .doc(Provider.of<vhndpro>(context, listen: false).village[widget.num])
        .collection("Family")
        .get();
    print("MEOW");
    rk.docs.forEach((e) async{
      print("HIKJMLP");
      print(e.id);
      var mk =
      await FirebaseFirestore.instance
          .collection("Village Details")
          .doc(Provider.of<vhndpro>(context, listen: false).village[widget.num])
          .collection("Family")
          .doc(e.id).collection("Household").get();
      setState(() {
        _allResults.add(mk.docs);
      });
      print(_allResults);
    });
    
    return "Completed";
  }

  _onSearchChanged() {
    searchResults();
  }

  List<bool> _isChecked = [];

  searchResults() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var i in _allResults) {
        for(var j in i){
          print("PRINT");
          String name = j["head"][0].toString().toLowerCase();
          String pname = j["spouse"][1].toString().toLowerCase();

          if (name.contains(_searchController.text.toLowerCase())) {
            showResults.add(j);
          }
          else if (pname.contains(_searchController.text.toLowerCase())) {
            showResults.add(j);
          }
          if (Provider.of<vhndpro>(context,listen: false).selected.contains(name)) {
            showResults.remove(j);
          }
        }
      }
    } else {
      showResults = [];
    }
    setState(() {
      _resultsList = showResults;
      _isChecked = List<bool>.filled(_resultsList.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      backgroundColor: Colors.white,
      trailing: Icon(
        Icons.search,
        color: Colors.black,
      ),
      title: Container(
        alignment: Alignment.center,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey),
            borderRadius: BorderRadius.circular(50)),
        child: TextField(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          controller: _searchController,
          onTap: () {},
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              hintText: "Search",
              errorMaxLines: 1,
              hintStyle: GoogleFonts.poppins(fontSize: 16, color: black),
              border: InputBorder.none),
          style: GoogleFonts.poppins(fontSize: 14, color: black),
        ),
      ),
      children: [
        _searchController.text == ""
            ? SizedBox()
            : Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: purple,
            border: Border.all(width: 0.5, color: white),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.builder(
              itemCount: _resultsList.length,
              itemBuilder: (BuildContext context, int index) {
                return  CheckboxListTile(
                  onChanged: (val){
                    setState(
                          () {
                        print("Hi");
                        _isChecked[index] = val!;
                        val ? Provider.of<vhndpro>(context,listen: false).putselect(_resultsList[index]["head"][0]+" ,"+(2022-(int.parse(_resultsList[index]["head"][1].toString().substring(0,4)))).toString()) : Provider.of<vhndpro>(context,listen: false).removedata(_resultsList[index]["head"][0]+" ,"+(2022-(int.parse(_resultsList[index]["head"][1].toString().substring(0,4)))).toString());
                        val ? Provider.of<vhndpro>(context,listen: false).putselect(_resultsList[index]["spouse"][1]+" ,"+(2022-(int.parse(_resultsList[index]["spouse"][2].toString().substring(0,4)))).toString()): Provider.of<vhndpro>(context,listen: false).removedata(_resultsList[index]["head"][0]+" ,"+(2022-(int.parse(_resultsList[index]["spouse"][2].toString().substring(0,4)))).toString());
                        print(Provider.of<vhndpro>(context,listen: false).selected);
                        setState(() {

                        });
                      },
                    );
                  },
                  activeColor: white,
                  checkColor: hTxt,
                  value: _isChecked[index],
                  checkboxShape: CircleBorder(),
                  title: Container(
                    alignment: _resultsList == []
                        ? Alignment.center
                        : Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _resultsList == []
                          ? "No result"
                          : _resultsList[index]["head"][0] +", "+_resultsList[index]["spouse"][1] +", ",
                      textAlign: _resultsList == []
                          ? TextAlign.center
                          : TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Grold Regular",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: white,
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
