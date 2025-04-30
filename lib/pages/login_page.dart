import 'package:flutter/material.dart';
import 'package:study_planner/database/db_helper.dart';
import 'package:study_planner/models/user.dart';
import 'package:study_planner/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;
  String _errorMessage = '';

  final DBHelper _dbHelper = DBHelper();

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
      _errorMessage = '';
    });
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      if (_isLogin) {
        // Login
        var user = await _dbHelper.getUser(username, password);
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(username: username),
            ),
          );
        } else {
          setState(() {
            _errorMessage = 'Invalid username or password';
          });
        }
      } else {
        // Signup
        try {
          User newUser = User(username: username, password: password);
          await _dbHelper.insertUser(newUser.toMap());
          setState(() {
            _errorMessage = 'Signup successful! Please login.';
            _isLogin = true;
          });
        } catch (e) {
          setState(() {
            _errorMessage = 'Username already exists';
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Planner - ${_isLogin ? "Login" : "Signup"}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter username' : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter password' : null,
              ),
              SizedBox(height: 12),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_isLogin ? 'Login' : 'Signup'),
              ),
              TextButton(
                onPressed: _toggleForm,
                child: Text(_isLogin
                    ? 'Don\'t have an account? Signup'
                    : 'Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
