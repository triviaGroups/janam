import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:janam/Home/home_sub.dart';
import 'package:janam/Login/login.dart';
import 'package:janam/Other%20pages/NIPI/NIPIpro.dart';
import 'package:janam/Other%20pages/ORS/ORSpro.dart';
import 'package:janam/Other%20pages/TC/Tcpro.dart';
import 'package:janam/Other%20pages/VHND/VHNDpro.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/detailsFetch.dart';
import 'package:janam/provider/docIdProvider.dart';
import 'package:janam/provider/nurseProvider.dart';
import 'package:janam/provider/pnpro.dart';
import 'package:janam/provider/pregDocId.dart';
import 'package:janam/provider/villageProvider.dart';
import 'package:provider/provider.dart';
import 'Login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Details>.value(value: (Details())),
        ChangeNotifierProvider<NurseDetails>.value(value: (NurseDetails())),
        ChangeNotifierProvider<VillageProvider>.value(value: (VillageProvider())),
        ChangeNotifierProvider<DocID>.value(value: (DocID())),
        ChangeNotifierProvider<PregDocID>.value(value: (PregDocID())),
        ChangeNotifierProvider<vhndpro>.value(value: vhndpro()),
        ChangeNotifierProvider<nipipro>.value(value: nipipro()),
        ChangeNotifierProvider<orspro>.value(value: orspro()),
        ChangeNotifierProvider<tcpro>.value(value: tcpro()),
        ChangeNotifierProvider<PnPro>.value(value: PnPro()),
      ],
      child: const MaterialApp(
        home: FireBaseInitialization(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class FireBaseInitialization extends StatefulWidget {
  const FireBaseInitialization({Key? key}) : super(key: key);

  @override
  _FireBaseInitializationState createState() => _FireBaseInitializationState();
}

class _FireBaseInitializationState extends State<FireBaseInitialization> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: white,
        statusBarColor: white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, streamSnapshot) {
                      if (streamSnapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text("Error: ${streamSnapshot.hasError}"),
                          ),
                        );
                      }

                      if (streamSnapshot.connectionState ==
                          ConnectionState.active) {
                        User? _user = streamSnapshot.data as User?;
                        if (_user == null) {
                          return Login();
                        } else {
                          String phn= _user.phoneNumber!;
                          return HomeSub(number: phn.substring(3));
                        }

                      }
                      return Scaffold(
                        body: Center(
                          child: Text(
                            "Checking Authentication",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      );
                    });
              }
              return const Scaffold(
                body: Center(
                  child: Text("Initialising App....."),
                ),
              );
            }),
      ),
    );
  }
}
