import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class MyProfilePage extends StatefulWidget {
  final String email;

  MyProfilePage({required this.email});

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  String? _username;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  bool _isEditing = true;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username_${widget.email}');
      _heightController.text = prefs.getString('height_${widget.email}') ?? '';
      _weightController.text = prefs.getString('weight_${widget.email}') ?? '';
      _dobController.text = prefs.getString('dob_${widget.email}') ?? '';
      String? profileImagePath = prefs.getString('profileImage_${widget.email}');
      if (profileImagePath != null) {
        _profileImage = File(profileImagePath);
      }
    });
  }

  Future<void> _saveProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('height_${widget.email}', _heightController.text);
    await prefs.setString('weight_${widget.email}', _weightController.text);
    await prefs.setString('dob_${widget.email}', _dobController.text);
    if (_profileImage != null) {
      await prefs.setString('profileImage_${widget.email}', _profileImage!.path);
    }
    setState(() {
      _isEditing = false;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      _saveProfileData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile',style: TextStyle(fontSize: 24, color: Colors.white)),
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                _username!,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _showImagePickerDialog(context);
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Height (cm)',
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
              keyboardType: TextInputType.number,
              enabled: _isEditing,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Weight (kg)',
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
              keyboardType: TextInputType.number,
              enabled: _isEditing,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _dobController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date of Birth',
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
              keyboardType: TextInputType.datetime,
              enabled: _isEditing,
              style: TextStyle(color: Colors.black),
              onTap: _isEditing
                  ? () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _dobController.text =
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              }
                  : null,
            ),
            SizedBox(height: 20),
            _isEditing
                ? ElevatedButton(
              onPressed: _saveProfileData,
              child: Text('Save Profile',style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            )
                : ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
              child: Text('Edit Profile',style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black54,
        title: Text('Choose an option', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo, color: Colors.white),
              title: Text('Gallery', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.white),
              title: Text('Camera', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }
}
