import 'package:flutter/material.dart';

/// A stateless widget representing the home screen.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to FinWise - Your Financial Planning App'),
            ElevatedButton(
              onPressed: () {
                // Handle logout logic and navigate to login screen.
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the registration screen.
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
