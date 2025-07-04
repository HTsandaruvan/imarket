import 'package:flutter/material.dart';

class TermsPoliciesPage extends StatelessWidget {
  const TermsPoliciesPage({super.key});

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
    Color? iconColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: (iconColor ?? Colors.blue).withOpacity(0.15),
              child: Icon(icon, color: iconColor ?? Colors.blue),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: const TextStyle(color: Colors.black87, height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Terms & Policies",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            icon: Icons.rule,
            title: "Terms and Conditions",
            content:
                "By using this app, you agree to our terms and conditions, including data policies and security practices.",
            iconColor: Colors.blue,
          ),
          _buildSection(
            icon: Icons.privacy_tip,
            title: "Privacy Policy",
            content:
                "We are committed to protecting your privacy and handling your data transparently. We collect minimal data required to operate our services and do not share it without your consent.",
            iconColor: Colors.green,
          ),
          _buildSection(
            icon: Icons.security,
            title: "User Responsibilities",
            content:
                "Users are responsible for maintaining the confidentiality of their account and password, and for restricting access to their devices.",
            iconColor: Colors.orange,
          ),
          _buildSection(
            icon: Icons.info,
            title: "Usage Policy",
            content: "Do not misuse the app in any way.",
            iconColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
