import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:offer_informing_app/presentation/login_screen.dart';
import 'package:offer_informing_app/services/details_provider.dart';
import 'package:offer_informing_app/services/file_provider.dart';
import 'package:offer_informing_app/services/signup_screen_provider.dart';
import 'package:provider/provider.dart';

import 'services/sell_screen_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyD6qvHjRhPLK9f-FgD85O3Rtai3w_LcGoA',
    appId: 'com.example.offer_informing_app',
    messagingSenderId: '989926612249',
    projectId: 'offer-informing-app',
    storageBucket: 'offer-informing-app.appspot.com',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SignupScreenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FileProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SellScreenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => DetailsProvider(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(255, 56, 56, 63),
              useMaterial3: true,
            ),
            home: LoginScreen()));
  }
}
