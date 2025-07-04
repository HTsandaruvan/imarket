import 'package:flutter/material.dart';

class TwoFactorVerificationPage extends StatefulWidget {
  const TwoFactorVerificationPage({super.key});

  @override
  State<TwoFactorVerificationPage> createState() => _TwoFactorVerificationPageState();
}

class _TwoFactorVerificationPageState extends State<TwoFactorVerificationPage> {
  bool is2FAEnabled = false;

  void _toggle2FA(bool value) {
    setState(() {
      is2FAEnabled = value;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(is2FAEnabled
            ? "Two-Factor Authentication Enabled"
            : "Two-Factor Authentication Disabled"),
        backgroundColor: is2FAEnabled ? Colors.green : Colors.red,
      ),
    );
  }

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
          "Two-Factor Authentication",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(Icons.lock, size: 28, color: Colors.blue),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: const Text(
                    "Enhance your account security by requiring a verification code during login.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SwitchListTile(
            value: is2FAEnabled,
            onChanged: _toggle2FA,
            activeColor: theme.primaryColor,
            title: const Text(
              "Enable Two-Factor Authentication",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
                "When enabled, you will be required to verify your identity on login."),
          ),
          const SizedBox(height: 24),
          if (is2FAEnabled)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Two-Factor Authentication is Enabled",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "You will receive a verification code via your registered method when logging in.",
                  ),
                ],
              ),
            ),
          if (!is2FAEnabled)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Two-Factor Authentication is Disabled",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "We recommend enabling 2FA to add an extra layer of security to your account.",
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
