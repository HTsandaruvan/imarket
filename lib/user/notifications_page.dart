import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool emailNotifications = true;
  bool pushNotifications = true;
  bool smsNotifications = false;

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
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Manage your notification preferences for your account.",
            style: TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 24),
          SwitchListTile(
            value: emailNotifications,
            onChanged: (value) {
              setState(() {
                emailNotifications = value;
              });
            },
            title: const Text("Email Notifications"),
            subtitle: const Text("Receive notifications via email."),
          ),
          const Divider(),
          SwitchListTile(
            value: pushNotifications,
            onChanged: (value) {
              setState(() {
                pushNotifications = value;
              });
            },
            title: const Text("Push Notifications"),
            subtitle: const Text("Receive notifications via push alerts."),
          ),
          const Divider(),
          SwitchListTile(
            value: smsNotifications,
            onChanged: (value) {
              setState(() {
                smsNotifications = value;
              });
            },
            title: const Text("SMS Notifications"),
            subtitle: const Text("Receive notifications via SMS."),
          ),
        ],
      ),
    );
  }
}
