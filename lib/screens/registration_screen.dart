import 'package:finwise/services/auth_service.dart';
import 'package:flutter/material.dart';

/// A stateless widget representing the registration screen.
class RegistrationScreen extends StatelessWidget {
  final AuthService authService = AuthService('https://your-api-url.com');

  @override
  Widget build(BuildContext context) {
    // Controllers for capturing user input from text fields.
    final _emailController = TextEditingController();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    // Scaffold provides the basic material design visual layout structure.
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
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
            // TextField for username input.
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            // TextField for password input.
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Obscure text for password fields.
            ),
            // TextField for confirming password input.
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true, // Obscure text for password fields.
            ),
            SizedBox(height: 20), // Spacing between fields and button.
            // ElevatedButton for triggering the registration process.
            ElevatedButton(
              onPressed: () async {
                // Handle registration logic.
                final response = await authService.register(
                  _emailController.text,
                  _usernameController.text,
                  _passwordController.text,
                );

                if (response.statusCode == 200) {
                  // Navigate to the login screen on successful registration.
                  Navigator.pushNamed(context, '/login');
                } else {
                  // Show error message on failed registration.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registration failed')),
                  );
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
