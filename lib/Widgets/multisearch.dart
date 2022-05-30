import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class SearchMulti extends StatefulWidget {
  const SearchMulti({Key? key}) : super(key: key);

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
  void dispose(){
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
  getData() async{
    var unsold =   await FirebaseFirestore.instance.collection("Search").doc("preganancy").collection("NameList").get();
    setState(() {
      _allResults = unsold.docs;
    });
    return "Completed";
  }

  _onSearchChanged(){
    searchResults();
  }

  List<bool> _isChecked = [];

  searchResults(){
    var showResults = [];
    if(_searchController.text != ""){
      for(var i in _allResults){
        String name = i["Name"].toString().toLowerCase();

        if(name.contains(_searchController.text.toLowerCase())){
          showResults.add(i);
        }
      }
    }else{
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
      trailing: Icon(Icons.search,color: Colors.black,),
      title: Container(
        alignment: Alignment.center,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Colors.grey),
            borderRadius: BorderRadius.circular(50)
        ),
        child: TextField(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          controller: _searchController,
          onTap: (){
          },
          decoration:
          InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 25,vertical: 16),
              hintText: "Search",
              errorMaxLines: 1,
              hintStyle: GoogleFonts.poppins(fontSize: 16,color: black),
              border: InputBorder.none
          ),
          style: GoogleFonts.poppins(fontSize: 14,color: black),
        ),
      ),
      children: [
        Container(
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: ListView.builder(
              itemCount: _resultsList.length,
              itemBuilder: (BuildContext context,int index){
                return  CheckboxListTile(
                  onChanged: (val){
                    setState(
                          () {
                            print("Hi");
                        _isChecked[index] = val!;
                        val ? _selected.add(_resultsList[index]["Name"]) : _selected.remove(_resultsList[index]["Name"]);
                        print(_selected);
                      },
                    );
                  },
                  value: _isChecked[index],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  title: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _searchController.text == "" ? _allResults[index]["Name"] : _resultsList[index]["Name"],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Grold Regular",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
