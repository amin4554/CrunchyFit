import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/welcome/welcome_screen.dart';
import 'package:app/mainpage/mainpage.dart';
import 'package:app/exerscises/exerscisecontroll.dart';
import 'package:app/exerscises/exercises.dart';
import 'package:app/login/signin.dart';
import 'package:app/mainpage/info.dart'; // Ensure this path is correct
import 'package:app/profile/myprofilepage.dart'; // Ensure this path is correct

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showWelcomeScreen = prefs.getBool('showWelcomeScreen') ?? true;
  String? email = prefs.getString('loggedInEmail');

  runApp(MyApp(showWelcomeScreen: showWelcomeScreen, email: email));
}

class MyApp extends StatelessWidget {
  final bool showWelcomeScreen;
  final String? email;

  MyApp({required this.showWelcomeScreen, required this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showWelcomeScreen ? WelcomeScreen() : (email != null ? MainPage(email: email!) : SignInPage()),
      routes: {
        '/randomExercises': (context) => RandomExercisesPage(allExercises: exampleExercises),
        '/mainpage': (context) => MainPage(email: email ?? ''), // Use a default value if email is null
        '/signin': (context) => SignInPage(),
        '/info': (context) => InfoPage(), // Add the InfoPage route
        '/profile': (context) => MyProfilePage(email: email ?? ''), // Add the MyProfilePage route
      },
    );
  }
}
