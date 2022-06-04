import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:janam/provider/pregDocId.dart';
import 'package:provider/provider.dart';

class ChildSearch extends StatefulWidget {
  const ChildSearch({
    Key? key,
  }) : super(key: key);

  @override
  _ChildSearchState createState() => _ChildSearchState();
}

class _ChildSearchState extends State<ChildSearch> {
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
        .collection("Village Children")
        .doc(Provider.of<Details>(context, listen: false).phone)
        .collection("New born")
        .get();

    setState(() {
      _allResults = unsold.docs;
    });
    return "Completed";
  }

  _onSearchChanged() {
    searchResults();
  }

  void setValue() {}

  searchResults() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var i in _allResults) {
        String sname = i["Name"].toString().toLowerCase();
        String vname = i["Village Name"].toString().toLowerCase();

        if (sname.contains(_searchController.text.toLowerCase())) {
          showResults.add(i);
        } else if (vname.contains(_searchController.text.toLowerCase())) {
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
      initiallyExpanded: true,
      trailing: const Icon(
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
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              hintText: "Search",
              errorMaxLines: 1,
              hintStyle: GoogleFonts.poppins(fontSize: 16, color: black),
              border: InputBorder.none),
          style: GoogleFonts.poppins(fontSize: 14, color: black),
        ),
      ),
      children: [
        _searchController.text == ""
            ? const SizedBox()
            : Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: purple,
                  border: Border.all(width: 0.5, color: white),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ListView.builder(
                    itemCount: _resultsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<PregDocID>(context, listen: false).setCc(
                              _resultsList[index]["DocId"],
                              _resultsList[index]["Address"],
                              _resultsList[index]["Delivery date"],
                              _resultsList[index]["Name"],
                              _resultsList[index]["DOB"],
                              _resultsList[index]["Village Name"],
                              List.from(_resultsList[index]["OPV"]),
                              List.from(_resultsList[index]["BCG"]),
                              List.from(_resultsList[index]["HEP"]),
                              List.from(_resultsList[index]["VIT"]));
                          setState(() {});
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.white)),
                          ),
                          child: ListTile(
                            title: Container(
                              alignment: _resultsList == []
                                  ? Alignment.center
                                  : Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                _resultsList == []
                                    ? "No result"
                                    : _resultsList[index]["Name"] +
                                        ", " +
                                        (2021 -
                                                (int.parse(_resultsList[index]
                                                        ["DOB"]
                                                    .substring(0, 4))))
                                            .toString() +
                                        ", " +
                                        _resultsList[index]["Village Name"],
                                textAlign: _resultsList == []
                                    ? TextAlign.center
                                    : TextAlign.left,
                                style: const TextStyle(
                                  fontFamily: "Grold Regular",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: white,
                                ),
                              ),
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
