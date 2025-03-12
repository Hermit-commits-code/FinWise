import 'package:finwise/services/auth_service.dart';
import 'package:flutter/material.dart';

/// A stateless widget representing the login screen.
class LoginScreen extends StatelessWidget {
  final AuthService authService = AuthService('https://your-api-url.com');

  @override
  Widget build(BuildContext context) {
    // Controllers for capturing user input from text fields.
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    // Scaffold provides the basic material design visual layout structure.
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextField for email input.
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // TextField for password input.
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Obscure text for password fields.
            ),
            SizedBox(height: 20), // Spacing between fields and button.
            // ElevatedButton for triggering the login process.
            ElevatedButton(
              onPressed: () async {
                // Handle login logic.
                final response = await authService.login(
                  _emailController.text,
                  _passwordController.text,
                );

                if (response.statusCode == 200) {
                  // Navigate to the home screen on successful login.
                  Navigator.pushReplacementNamed(context, '/');
                } else {
                  // Show error message on failed login.
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Login failed')));
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the password reset screen.
                Navigator.pushNamed(context, '/reset-password');
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
