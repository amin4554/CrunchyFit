import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/mainpage/mainpage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  final _registerUsernameController = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();
  bool _loginPasswordVisible = false;
  bool _registerPasswordVisible = false;
  String? _loginError;
  String? _registerError;

  @override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _registerUsernameController.dispose();
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  void _register() async {
    final username = _registerUsernameController.text;
    final email = _registerEmailController.text;
    final password = _registerPasswordController.text;
    if (username.isNotEmpty && _isValidEmail(email) && password.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> registeredEmails = prefs.getStringList('registeredEmails') ?? [];
      if (!registeredEmails.contains(email)) {
        registeredEmails.add(email);
      }
      await prefs.setStringList('registeredEmails', registeredEmails);
      await prefs.setString('username_$email', username);
      await prefs.setString('password_$email', password);

      setState(() {
        _registerError = null;
      });

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainPage(email: email),
      ));
      print('Register with username: $username, email: $email, password: $password');
    } else {
      setState(() {
        _registerError = 'Please enter a valid username, email, and password';
      });
    }
  }

  void _login() async {
    final email = _loginEmailController.text;
    final password = _loginPasswordController.text;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> registeredEmails = prefs.getStringList('registeredEmails') ?? [];
    final registeredPassword = prefs.getString('password_$email');

    if (registeredEmails.contains(email) && password == registeredPassword) {
      await prefs.setString('loggedInEmail', email);
      setState(() {
        _loginError = null;
      });

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainPage(email: email),
      ));
      print('Login with email: $email, password: $password');
    } else {
      setState(() {
        _loginError = 'Invalid email or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign In', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black45,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Register'),
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        backgroundColor: Colors.black45,
        body: TabBarView(
          children: [
            _buildLoginTab(),
            _buildRegisterTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _loginEmailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              errorText: _loginError,
            ),
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _loginPasswordController,
            obscureText: !_loginPasswordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                icon: Icon(
                  _loginPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _loginPasswordVisible = !_loginPasswordVisible;
                  });
                },
              ),
              errorText: _loginError,
            ),
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: _login,
            child: Text('Log In', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _registerUsernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              errorText: _registerError,
            ),
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _registerEmailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              errorText: _registerError,
            ),
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _registerPasswordController,
            obscureText: !_registerPasswordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                icon: Icon(
                  _registerPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _registerPasswordVisible = !_registerPasswordVisible;
                  });
                },
              ),
              errorText: _registerError,
            ),
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: _register,
            child: Text('Register', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
