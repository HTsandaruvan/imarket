import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController(text: "John Doe");
  final TextEditingController _companyController = TextEditingController(text: "Global Trade Solutions");
  final String profileId = "IM12345";
  final TextEditingController _locationController = TextEditingController(text: "New York, USA");
  final TextEditingController _phoneController = TextEditingController(text: "+1 (555) 123-4567");
  final TextEditingController _emailController = TextEditingController(text: "john.doe@globaltrade.com");
  final TextEditingController _websiteController = TextEditingController(text: "www.globaltradesolutions.com");

  final _formKey = GlobalKey<FormState>();

  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 4, // Shadow effect
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Image
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blue.shade50,
                      // backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
                      // child: _selectedImage == null
                      //     ? const Icon(Icons.person, size: 80, color: Colors.grey)
                      //     : null,
                      child: ClipOval(
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: _selectedImage != null
                              ? Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.person, size: 80, color: Colors.grey),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.blue,
                        child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                      ),
                    ),
                  ],
                ),
                // child: CircleAvatar(
                //   radius: 60,
                //   backgroundColor: Colors.blue.shade50,
                //   backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
                //       ? FileImage(_selectedImage!)
                //       : const AssetImage('assets/profile.jpg') as ImageProvider,
                //   child: Align(
                //     alignment: Alignment.bottomRight,
                //     child: CircleAvatar(
                //       radius: 18,
                //       backgroundColor: Colors.blue,
                //       child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                //     ),
                //   ),
                // ),
              ),
              
              const SizedBox(height: 8),
              // Profile ID below the circle
              Text(
                "ID: $profileId",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 24),
              // Editable fields
              _buildTextField(_nameController, "Full Name"),
              const SizedBox(height: 12),
              _buildTextField(_companyController, "Company Name"),
              const SizedBox(height: 12),
              _buildTextField(_locationController, "Location"),
              const SizedBox(height: 12),
              _buildTextField(_phoneController, "Phone Number", keyboardType: TextInputType.phone),
              const SizedBox(height: 12),
              _buildTextField(_emailController, "Email", keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 12),
              _buildTextField(_websiteController, "Website"),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile updated successfully")),
                    );
                  }
                },
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  "Save Changes",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF2C42CF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  )
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $label";
        }
        return null;
      },
    );
  }
}
