import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/exerscises/exerscisecontroll.dart'; // Corrected package path
import 'package:app/exerscises/exercises.dart';
import 'package:app/login/signin.dart'; // Adjust the import path as necessary
import 'package:app/mainpage/info.dart'; // Adjust the import path as necessary
import 'package:app/profile/myprofilepage.dart'; // Adjust the import path as necessary

class MainPage extends StatefulWidget {
  final String email;

  MainPage({required this.email});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _exerciseCount = 0;
  int _currentIndex = 0; // Controls where the Start button appears
  List<bool> _exerciseCompleted = [];
  List<bool> _exerciseSkipped = [];
  String _username = '';

  @override
  void initState() {
    super.initState();
    _exerciseCompleted = List<bool>.filled(7, false);
    _exerciseSkipped = List<bool>.filled(7, false);
    _loadData();
  }

  void _loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username_${widget.email}') ?? '';
      _exerciseCount = prefs.getInt('exerciseCount_${widget.email}') ?? 0;
      for (int i = 0; i < 7; i++) {
        _exerciseCompleted[i] = prefs.getBool('completed_${widget.email}_$i') ?? false;
        _exerciseSkipped[i] = prefs.getBool('skipped_${widget.email}_$i') ?? false;
      }
      _currentIndex = prefs.getInt('currentIndex_${widget.email}') ?? 0;
    });
  }

  void _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('exerciseCount_${widget.email}', _exerciseCount);
    for (int i = 0; i < 7; i++) {
      await prefs.setBool('completed_${widget.email}_$i', _exerciseCompleted[i]);
      await prefs.setBool('skipped_${widget.email}_$i', _exerciseSkipped[i]);
    }
    await prefs.setInt('currentIndex_${widget.email}', _currentIndex);
  }

  void _logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedInEmail');
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => SignInPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    const double cellHeight = 60.0; // Set a uniform height for all cells
    const double cellWidth = 100.0; // Set a uniform width for all cells

    return Scaffold(
      appBar: AppBar(
        title: const Text('CrunchyFit', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black45,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'logout') {
                _logout();
              } else if (result == 'info') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoPage(),
                  ),
                );
              } else if (result == 'profile') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfilePage(email: widget.email),
                  ),
                );
              }
            },
            color: Colors.white,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'profile',
                child: Text('My Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'info',
                child: Text('App Info'),
              ),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black45,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width, // Use the full width
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgrounds.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 10), // Reduced vertical padding
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  _username!,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              Icon(
                Icons.emoji_events,
                size: 50, // Reduced size for mobile and web
                color: Colors.amber,
              ),
              SizedBox(height: 8), // Reduced spacing
              Text(
                '$_exerciseCount',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0), // Added bottom padding
                    child: DataTable(
                      columnSpacing: 30,
                      columns: [
                        DataColumn(
                          label: Container(
                            width: cellWidth,
                            height: cellHeight,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center, // Center the text
                            child: Text(
                              'Day',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            width: cellWidth,
                            height: cellHeight,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center, // Center the text
                            child: Text(
                              'Action',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            width: cellWidth,
                            height: cellHeight,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center, // Center the text
                            child: Text(
                              'Status',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                      rows: List.generate(7, (index) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Container(
                                width: cellWidth,
                                height: cellHeight,
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Text('Day ${index + 1}', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                            DataCell(
                              Container(
                                width: cellWidth,
                                height: cellHeight,
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: _currentIndex == index && !_exerciseCompleted[index] && !_exerciseSkipped[index]
                                    ? ElevatedButton(
                                  onPressed: () {
                                    startExercise(index);
                                  },
                                  child: Text('Start', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                )
                                    : SizedBox.shrink(),
                              ),
                            ),
                            DataCell(
                              Container(
                                width: cellWidth,
                                height: cellHeight,
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: _exerciseCompleted[index]
                                    ? Icon(Icons.check, color: Colors.green)
                                    : _exerciseSkipped[index]
                                    ? Icon(Icons.close, color: Colors.red)
                                    : SizedBox.shrink(),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startExercise(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RandomExercisesPage(allExercises: exampleExercises)),
    ).then((result) {
      if (result != null && result is Map<String, dynamic>) {
        setState(() {
          bool completed = result['completed'];
          bool skipped = result['skipped'];

          _exerciseCompleted[index] = completed;
          _exerciseSkipped[index] = skipped;

          if (completed) {
            _exerciseCount++;
          }
          if (skipped) {
            _exerciseCount = 0;
          }

          _currentIndex = (index + 1) % 7;
          if (_currentIndex == 0) {
            _exerciseCompleted = List<bool>.filled(7, false);
            _exerciseSkipped = List<bool>.filled(7, false);
          }
          _saveData();
        });
      }
    });
  }
}
