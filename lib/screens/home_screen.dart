import 'package:flutter/material.dart';

/// A stateless widget representing the home screen.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FinWise')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to FinWise - Your Financial Planning App'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login screen when the button is pressed.
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the registration screen when the button is pressed
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
