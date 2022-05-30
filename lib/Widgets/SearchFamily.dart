import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class FamilySearch extends StatefulWidget {
  final String villagename;
  const FamilySearch({Key? key, required this.villagename}) : super(key: key);

  @override
  _FamilySearchState createState() => _FamilySearchState();
}

class _FamilySearchState extends State<FamilySearch> {
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
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  getData() async {
    var unsold = await FirebaseFirestore.instance
        .collection("Village Details")
        .doc(widget.villagename)
        .collection("Family")
        .get();
    setState(() {
      _allResults = unsold.docs;
    });
    return "Completed";
  }

  _onSearchChanged() {
    searchResults();
  }

  searchResults() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var i in _allResults) {
        String sname = i["Street name"].toString().toLowerCase();
        String pname = i["Plot no"].toString().toLowerCase();
        String aname = i["Area name"].toString().toLowerCase();

        if (sname.contains(_searchController.text.toLowerCase())) {
          showResults.add(i);
        }
        if (pname.contains(_searchController.text.toLowerCase())) {
          showResults.add(i);
        }
        if (aname.contains(_searchController.text.toLowerCase())) {
          showResults.add(i);
        }
      }
    } else {
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
        Container(
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.builder(
              itemCount: _resultsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                  title: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _searchController.text == ""
                          ? _allResults[index]["Plot no"] +
                              ", " +
                              _allResults[index]["Street name"] +
                              ", " +
                              _allResults[index]["Area name"] +
                              ", " +
                              _allResults[index]["Village name"]
                          : _resultsList[index]["Plot no"] +
                              ", " +
                              _resultsList[index]["Street name"] +
                              ", " +
                              _resultsList[index]["Area name"] +
                              ", " +
                              _resultsList[index]["Village name"],
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
              }),
        )
      ],
    );
  }
}
