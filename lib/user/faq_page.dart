import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'question': "How do I reset my password?",
        'answer':
            "Go to your Profile page, Navigate to Privacy & Security select 'Change Password', and follow the instructions."
      },
      {
        'question': "How do I contact support?",
        'answer':
            "Go to your Profile page, Navigate to Help & Support > Contact Support and send us your issue."
      },
      {
        'question': "How do I delete my account?",
        'answer':
            "Go to your Profile page, Navigate to Privacy & Security > Delete Account to request account deletion."
      },
      {
        'question': "How to update my profile?",
        'answer':
            "Go to your Profile page, tap the edit icon or Edit Details, and update your details."
      },
      {
        'question': "How can I manage notifications?",
        'answer':
            "Navigate to Notifications in settings to manage your preferences."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 3,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "FAQs",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return Card(
            color: Colors.white,
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text(
                  faq['question']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      faq['answer']!,
                      style: const TextStyle(
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
