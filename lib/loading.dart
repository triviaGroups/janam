import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Login/nurse_details.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janam/constants/color_constants.dart';

class Loading extends StatefulWidget {

  final String phone;

  const Loading({super.key, required this.phone});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text("OTP VERIFICATION",style: GoogleFonts.inter(fontSize: 22,fontWeight: FontWeight.w900,color: purple),),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Center(
              child: Text("Verify +91-${widget.phone}",style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
            child: PinPut(
              fieldsCount: 6,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 40.0,
              eachFieldHeight: 55.0,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async{
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                      verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      await FirebaseFirestore.instance.collection("Details").doc(widget.phone).get().then((data){
                        if(data.exists){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeSub(number: widget.phone)));
                        }
                        else{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => nurseDetails(
                            number: widget.phone,
                          )));
                        }
                      });
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Invalid OTP"),
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }
  _verifyPhone() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phone}",
        verificationCompleted: (credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
            if(value.user != null)
            {
             await FirebaseFirestore.instance.collection("Details").doc(widget.phone).get().then((data){
               if(data.exists){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeSub(number: widget.phone)));
               }
               else{
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => nurseDetails(
                   number: widget.phone,
                 )));
               }
             });

            }
          });
        },
        verificationFailed: (FirebaseAuthException e) async{
        },
        codeSent: (verificationId, resendingToken) async{
          setState((){
            _verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId){
          setState((){
            _verificationCode = verificationId;
          });
        },
        timeout: const Duration(seconds: 120)
    );
  }
}

