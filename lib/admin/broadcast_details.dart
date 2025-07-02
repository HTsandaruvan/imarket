import 'package:flutter/material.dart';

class BroadcastDetailsPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const BroadcastDetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Broadcast Details'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        elevation: 2,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Audience: ${data['audience']}"),
            const SizedBox(height: 6),
            Text("Recipients: ${data['recipients']}"),
            const SizedBox(height: 6),
            Text("Date: ${data['date']}"),
            const SizedBox(height: 6),
            Text("Status: ${data['status']}"),
            const SizedBox(height: 12),
            const Text("Message:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(data['message']),
          ],
        ),
      ),

    );
  }
}