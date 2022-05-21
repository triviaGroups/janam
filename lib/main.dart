import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:janam/RMNCH/ANC.dart';
import 'package:janam/RMNCH/Delivery.dart';
import 'package:janam/RMNCH/pregnancy.dart';
import 'package:janam/Village%20Survey/page2.dart';
import 'package:janam/Village%20Survey/page3.dart';
import 'package:janam/constants/color_constants.dart';
import 'package:janam/provider/colorSelection.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider<colorSelect>.value(value: (colorSelect())),
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
                        return const Delivery();
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
