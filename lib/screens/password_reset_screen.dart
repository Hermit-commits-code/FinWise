import 'package:finwise/services/auth_service.dart';
import 'package:flutter/material.dart';

/// A stateless widget representing the password reset screen.
class PasswordResetScreen extends StatelessWidget {
  final AuthService authService = AuthService('https://your-api-url.com');

  @override
  Widget build(BuildContext context) {
    // Controller for capturing user input from text fields.
    final _emailController = TextEditingController();

    // Scaffold provides the basic material design visual layout structure.
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
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
            SizedBox(height: 20), // Spacing between fields and button.
            // ElevatedButton for triggering the password reset process.
            ElevatedButton(
              onPressed: () async {
                // Handle password reset logic.
                final response = await authService.resetPassword(
                  _emailController.text,
                );

                if (response.statusCode == 200) {
                  // Show success message on successful password reset.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password reset email sent')),
                  );
                } else {
                  // Show error message on failed password reset.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password reset failed')),
                  );
                }
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
