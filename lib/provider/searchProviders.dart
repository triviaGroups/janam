import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class searchProvider extends GetxController{

  Future preganancy_getData(String collection) async {
    final FirebaseFirestore? firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot? snapshot = await firebaseFirestore!.collection("Search").doc("preganancy").collection('NameList').get();
    print("hello");
    print(snapshot.docs.length);
    return snapshot.docs;
  }

  Future queryData(String queryString) async{
    return FirebaseFirestore.instance.collection('Search').doc("preganancy").collection('NameList').where(
      'Name',isGreaterThanOrEqualTo: queryString
    ).get();
  }

}