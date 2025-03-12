import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/password_reset_screen.dart';
import 'screens/registration_screen.dart';

/// Main function to run the Flutter app.
void main() {
  runApp(FinWiseApp());
}

/// The root widget of the FinWise app.
class FinWiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinWise',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/', // Define the initial route.
      routes: {
        '/': (context) => HomeScreen(), // Route for the home screen.
        '/login': (context) => LoginScreen(), // Route for the login screen.
        '/register':
            (context) =>
                RegistrationScreen(), // Route for the registration screen.
        '/reset-password':
            (context) =>
                PasswordResetScreen(), // Route for the password reset screen.
      },
    );
  }
}
