import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatelessWidget {
  final File? profileImage;
  final Function(File) onImageSelected;

  const ProfileAvatar({
    super.key,
    required this.profileImage,
    required this.onImageSelected,
  });

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      onImageSelected(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: profileImage != null 
            ? FileImage(profileImage!) 
            : null,
        child: profileImage == null 
            ? const Icon(Icons.add_a_photo, size: 40)
            : null,
      ),
    );
  }
}