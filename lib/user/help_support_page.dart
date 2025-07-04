import 'package:flutter/material.dart';

import 'faq_page.dart';
import 'contact_support_page.dart';
import 'terms_policies_page.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          "Help & Support",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Find answers or contact our support team for assistance.",
            style: TextStyle(color: theme.textTheme.bodyMedium!.color),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: Icon(Icons.help_outline, color: theme.primaryColor),
            title: const Text("FAQs"),
            subtitle: const Text("Find frequently asked questions."),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const FAQPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.contact_support, color: theme.primaryColor),
            title: const Text("Contact Support"),
            subtitle: const Text("Get in touch with our support team."),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactSupportPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.policy, color: theme.primaryColor),
            title: const Text("Terms & Policies"),
            subtitle: const Text("View our terms and privacy policies."),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const TermsPoliciesPage()));
            },
          ),
        ],
      ),
    );
  }
}
