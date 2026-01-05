import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/services/profile_api_service.dart';

class ProfileHomeScreen extends StatefulWidget {
  const ProfileHomeScreen({
    super.key,
    this.profileImage,
    required this.onProfileImageUpdated,
  });

  final File? profileImage;
  final Function(File image) onProfileImageUpdated;

  @override
  State<ProfileHomeScreen> createState() => _ProfileHomeScreenState();
}

class _ProfileHomeScreenState extends State<ProfileHomeScreen> {
  final ImagePicker _picker = ImagePicker();
  final ProfileApiService _profileService = ProfileApiService();

  File? _selectedImage;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      _selectedImage = File(image.path);
    });
  }

  Future<void> _saveProfile() async {
    if (_selectedImage == null) return;

    setState(() => _isLoading = true);

    try {
      await _profileService.updateProfile(
        firstName: 'Saem',
        lastName: 'Hasan',
        image: _selectedImage,
      );

      widget.onProfileImageUpdated(_selectedImage!);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = _selectedImage ?? widget.profileImage;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                image != null ? FileImage(image) : null,
                child: image == null
                    ? const Icon(Icons.camera_alt, size: 30)
                    : null,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveProfile,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Save Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
