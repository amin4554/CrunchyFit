import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:app/exerscises/exercises.dart'; // Corrected package path
import 'package:file_picker/file_picker.dart'; // Add this for file picking
import 'package:audioplayers/audioplayers.dart'; // Add this for audio playback

class RandomExercisesPage extends StatefulWidget {
  final List<Exercise> allExercises;

  RandomExercisesPage({required this.allExercises});

  @override
  _RandomExercisesPageState createState() => _RandomExercisesPageState();
}

class _RandomExercisesPageState extends State<RandomExercisesPage> {
  List<Exercise> _selectedExercises = [];
  Timer? _timer;
  int _currentExerciseIndex = 0;
  int _counter = 0;
  bool _isMuted = false;
  String? _musicFilePath;
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _selectRandomExercises();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter >= 60) {
          _counter = 0;
          _currentExerciseIndex++;
          if (_currentExerciseIndex >= _selectedExercises.length) {
            _completeExercise();
          }
        } else {
          _counter++;
        }
      });
    });
  }

  void _selectRandomExercises() {
    setState(() {
      var rng = math.Random();
      Set<int> indices = {};
      while (indices.length < 20) {
        indices.add(rng.nextInt(widget.allExercises.length));
      }
      _selectedExercises = indices.map((index) => widget.allExercises[index]).toList();
    });
  }

  void _completeExercise() {
    Navigator.pop(context, {
      'skipped': false,
      'completed': true,
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      if (_isMuted) {
        _audioPlayer.setVolume(0);
      } else {
        _audioPlayer.setVolume(1);
      }
    });
  }

  Future<void> _chooseMusic() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _musicFilePath = result.files.single.path!;
      });
      _playMusic(_musicFilePath!);
    } else {
      // User canceled the picker
    }
  }

  void _playMusic(String filePath) {
    _audioPlayer.setSourceDeviceFile(filePath);
    _audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.8;
    double maxHeight = MediaQuery.of(context).size.height * 0.8;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.5); // Limiting text scaling

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout!', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Selected Exercise ${_currentExerciseIndex + 1}/20:',
                    style: TextStyle(fontSize: 20 * textScaleFactor, color: Colors.white),
                  ),
                  if (_selectedExercises.isNotEmpty)
                    Column(
                      children: <Widget>[
                        Image.asset(
                          _selectedExercises[_currentExerciseIndex].imagePath,
                          width: maxWidth * 0.8, // Updated to fit within the constraints
                          height: maxHeight * 0.4, // Updated to fit within the constraints
                        ),
                        Text(
                          _selectedExercises[_currentExerciseIndex].name,
                          style: TextStyle(fontSize: 18 * textScaleFactor, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          _selectedExercises[_currentExerciseIndex].description,
                          style: TextStyle(fontSize: 16 * textScaleFactor, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  SizedBox(height: 20),
                  Text(
                    'Time left: ${60 - _counter} seconds',
                    style: TextStyle(fontSize: 16 * textScaleFactor, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          onPressed: _toggleMute,
                          child: Text(_isMuted ? 'Unmute' : 'Mute', style: TextStyle(color: Colors.white, fontSize: 16 * textScaleFactor)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add space between buttons
                      Flexible(
                        child: ElevatedButton(
                          onPressed: _chooseMusic,
                          child: Text('Choose Music', style: TextStyle(color: Colors.white, fontSize: 16 * textScaleFactor)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add space between buttons
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, {'skipped': true, 'completed': false}),
                          child: Text('Skip to Main Page', style: TextStyle(color: Colors.white, fontSize: 16 * textScaleFactor)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_musicFilePath != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Playing: ${_musicFilePath!.split('/').last}',
                        style: TextStyle(color: Colors.white, fontSize: 14 * textScaleFactor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
