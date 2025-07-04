import 'package:flutter/material.dart';
import 'package:imarket/user/change_password_page.dart';
import 'package:imarket/user/two_factor_verification_page.dart';

class PrivacySecurityPage extends StatefulWidget {
  const PrivacySecurityPage({super.key});

  @override
  State<PrivacySecurityPage> createState() => _PrivacySecurityPageState();
}

class _PrivacySecurityPageState extends State<PrivacySecurityPage> {
  bool allowSearchByEmail = false;

  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Delete Account"),
        content: const Text(
          "Are you sure you want to delete your account?\n\n"
          "Your account will be deactivated now and permanently deleted after 30 days. "
          "You can reactivate your account by logging in within this period.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Account deletion initiated. Your account will be permanently deleted after 30 days.")),
              );
              // Add your delete logic here
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _toggleSearchByEmail(bool value) {
    setState(() {
      allowSearchByEmail = value;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          allowSearchByEmail
              ? "Others can now find you by your email."
              : "Others can no longer find you by your email.",
        ),
        backgroundColor: allowSearchByEmail ? Colors.green : Colors.red,
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
          "Privacy & Security",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Manage your account security and privacy preferences to protect your data.",
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 24),

          Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.security, color: Colors.blue),
              title: const Text("Two-Factor Authentication"),
              subtitle: const Text("Add an extra layer of security to your account."),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TwoFactorVerificationPage()),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SwitchListTile(
              value: allowSearchByEmail,
              onChanged: _toggleSearchByEmail,
              activeColor: Color(0xFF2C42CF),
              secondary: const Icon(Icons.search, color: Colors.orange),
              title: const Text("Allow Search by Email"),
              subtitle: const Text("Control if others can find you by your email address."),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.lock, color: Colors.purple),
              title: const Text("Change Password"),
              subtitle: const Text("Update your account password."),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChangePasswordPage()),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text("Delete Account"),
              subtitle: const Text("Permanently delete your account."),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _confirmDeleteAccount(context),
            ),
          ),
        ],
      ),
    );
  }
}
