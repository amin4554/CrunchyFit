import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/mainpage/mainpage.dart';
import 'package:app/login/signin.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Map<String, String>> welcome = [
    {
      "header": "Welcome",
      "description":
      "Welcome to CrunchyFit your personal fitness companion for achieving your goals right from the comfort of your home.",
      "image": "assets/images/w1.png"
    },
    {
      "header": "App Features",
      "description":
      "Discover a variety of home workouts tailored to your fitness level and goals. Track your progress, earn strikes, and stay motivated with our daily challenges.",
      "image": "assets/images/w2.png"
    },
    {
      "header": "Benefits of Home Workouts",
      "description":
      "Experience the convenience of working out at home. No gym membership or equipment required. Achieve your fitness goals on your own schedule",
      "image": "assets/images/w3.png"
    },
    {
      "header": "Motivational Quote",
      "description":
      "The only bad workout is the one that didn't happen. Start your journey to a healthier you today!",
      "image": "assets/images/w4.png"
    },
  ];

  double currentPage = 0.0;
  final _pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });
  }

  void _onLastPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showWelcomeScreen', false);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => SignInPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: welcome.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Image.asset(
                        welcome[index]['image']!,
                        fit: BoxFit.fitWidth,
                        width: 220.0,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: <Widget>[
                            Text(welcome[index]['header']!,
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0XFF3F3D56),
                                    height: 2.0)),
                            Text(
                              welcome[index]['description']!,
                              style: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: 1.2,
                                  fontSize: 16.0,
                                  height: 1.3),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          if (currentPage == welcome.length - 1) // Show button only on the last page
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 70.0),
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: _onLastPage,
                  child: const Text('Get Started',style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
