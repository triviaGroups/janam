import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class searchWidget extends StatefulWidget {

  @override
  State<searchWidget> createState() => _searchWidgetState();
}

class _searchWidgetState extends State<searchWidget> {

  TextEditingController _searchController = TextEditingController();
  Future? resultsloaded;
  List _allResults = [];
  List _resultsList = [];

  createAlertDialog(BuildContext context)
  {
    return AlertDialog(
      title: Text("Search List"),
      content: Container(
        height: 250,
        child: ListView.builder(
            itemCount: _resultsList.length,
            itemBuilder: (BuildContext context,int index){
              return  ListTile(
                leading: Container(
                  alignment: Alignment.center,
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _resultsList[index]["Name"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Grold Regular",
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Container(
          padding:EdgeInsets.symmetric(horizontal: 24),
          height: 56,
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.5,color: Colors.grey),
                borderRadius: BorderRadius.circular(50)
            ),
            child: Container(
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                controller: _searchController,
                onTap: (){
                  createAlertDialog(context);
                },
                decoration:
                InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                    hintText: "🔍 Search",
                    errorMaxLines: 1,
                    hintStyle: GoogleFonts.poppins(fontSize: 16,color: black),
                    border: InputBorder.none
                ),
                style: GoogleFonts.poppins(fontSize: 14,color: black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
