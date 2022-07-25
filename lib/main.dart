// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/Responsive_layout/responsive_layout_screen.dart';
import 'package:insta_clone/Responsive_layout/mobile_screen_layout.dart';
import 'package:insta_clone/Responsive_layout/web_screen_layout.dart';
import 'package:insta_clone/Utilities/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insta_clone/providers/user_providers.dart';
import 'package:insta_clone/screens/login_screen.dart';
import 'package:insta_clone/screens/sign_up.dart';
import 'package:provider/provider.dart';
// import 'dart:js';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key  key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        // home: const Responsivelayout(
        //     mobileScreenLayout: MobileScreenLayout(),));
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const Responsivelayout(
                  mobileScreenLayout: MobileScreenLayout(),
                );
              } else if (snapshot.hasError) {
                Center(
                  child: Text("${snapshot.error}"),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
