import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/Other%20pages/ORS/ORSpro.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:provider/provider.dart';

class searchCommon extends StatefulWidget {

  @override
  State<searchCommon> createState() => _searchCommonState();
}

class _searchCommonState extends State<searchCommon> {

  TextEditingController _searchController = TextEditingController();
  Future? resultsloaded;
  List _allResults = [];
  List _resultsList = [];


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
    var unsold = await FirebaseFirestore.instance
        .collection("Village Members")
        .doc(Provider.of<Details>(context, listen: false).phone)
        .collection("Members")
        .get();
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
    if (_searchController.text != "") {
      for (var i in _allResults) {
        String sName = i["Name"].toString().toLowerCase();
        String pName = i["Village Name"].toString().toLowerCase();

        if (sName.contains(_searchController.text.toLowerCase())) {
          showResults.add(i);
        } else if (pName.contains(_searchController.text.toLowerCase())) {
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
    return ExpansionCard(
      backgroundColor: Colors.white,
      trailing: const Icon(Icons.search,color: Colors.black,),
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 16),
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
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: purple,
            border: Border.all(width: 0.5, color: white),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: ListView.builder(
              itemCount: _resultsList.length,
              itemBuilder: (BuildContext context,int index){
                return  GestureDetector(
                  onTap: (){
                    Provider.of<orspro>(context,listen: false).setName(_resultsList[index]["Name"]);
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Colors.white)),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                      title: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _searchController.text == "" ? _allResults[index]["Name"] : _resultsList[index]["Name"]+", "+_resultsList[index]["Village Name"],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: "Grold Regular",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
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
