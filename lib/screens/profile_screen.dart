import 'dart:io';

import 'package:finwise/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// A stateful widget representing the user profile screen.
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  final ProfileService _profileService = ProfileService(
    'https://your-api-url.com',
  );
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final userId = 'current-user-id'; // Replace with actual user ID
      final profileData = await _profileService.getUserProfile(userId);
      setState(() {
        _usernameController.text = profileData['username'];
        _emailController.text = profileData['email'];
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to load profile: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load profile')));
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Picks an image from the gallery and updates the profile image.
  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _updateUserProfile() async {
    try {
      final userId = 'current-user-id'; // Replace with actual user ID
      final profileData = {
        'username': _usernameController.text,
        'email': _emailController.text,
        // Add other fields like profile image if necessary
      };
      await _profileService.updateUserProfile(userId, profileData);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Profile updated successfully')));
    } catch (e) {
      print('Failed to update profile: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to update profile')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            _profileImage != null
                                ? FileImage(_profileImage!)
                                : null,
                        child:
                            _profileImage == null
                                ? Icon(Icons.add_a_photo, size: 50)
                                : null,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _updateUserProfile,
                      child: Text('Update Profile'),
                    ),
                  ],
                ),
              ),
    );
  }
}
