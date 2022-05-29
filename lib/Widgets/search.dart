import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';
import '../provider/searchProviders.dart';

Padding Search() {
  return Padding(
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
        child: TextField(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          onSubmitted: (val){

          },
          decoration:
          InputDecoration(
              hintText: "Search",
              errorMaxLines: 1,
              prefixIcon: Icon(Icons.search,size: 30,),
              contentPadding: EdgeInsets.only(left: 20,right: 10),
              hintStyle: GoogleFonts.poppins(fontSize: 14,color: black),
              border: InputBorder.none
          ),
          style: GoogleFonts.poppins(fontSize: 14,color: black),
        ),
      ),
    ),
  );
}

class searchWidget extends StatefulWidget {

  @override
  State<searchWidget> createState() => _searchWidgetState();
}

class _searchWidgetState extends State<searchWidget> {

  final TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshot;
  bool isExecuted = false;

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Container(
            padding:EdgeInsets.symmetric(horizontal: 24),
            height: 56,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5,color: Colors.grey),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      alignment: Alignment.center,
                      child: TextField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        controller: searchController,
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
                  Expanded(
                    child: Container(
                      child: GetBuilder<searchProvider>(
                        init: searchProvider(),
                        builder: (val){
                          return IconButton(
                            onPressed: (){
                              val.queryData(searchController.text).then((value) => {
                                snapshot = value,
                                setState((){
                                  isExecuted = true;
                                })
                              });
                            },
                            icon: Icon(Icons.search, color: Colors.black,),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
                itemCount: snapshot.docs.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(child: Container(
                          child: CircleAvatar(),
                        )),
                        Expanded(child: Container(
                          child: Text(snapshot.docs[index].get('Name')),
                        ))
                      ],
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
