// import 'package:flutter/material.dart';

// class BroadcastDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> data;

//   const BroadcastDetailsPage({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(
//         title: const Text('Broadcast Details'),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
//         elevation: 2,
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(data['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10),
//             Text("Audience: ${data['audience']}"),
//             const SizedBox(height: 6),
//             Text("Recipients: ${data['recipients']}"),
//             const SizedBox(height: 6),
//             Text("Date: ${data['date']}"),
//             const SizedBox(height: 6),
//             Text("Status: ${data['status']}"),
//             const SizedBox(height: 12),
//             const Text("Message:", style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Text(data['message']),
//           ],
//         ),
//       ),

//     );
//   }
// }

import 'package:flutter/material.dart';

class BroadcastDetailsPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const BroadcastDetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color(0xFF2C42CF);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Broadcast Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  data['title'] ?? 'No Title',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Info Rows
                _buildInfoRow(Icons.group, "Audience", data['audience']),
                const SizedBox(height: 8),
                _buildInfoRow(Icons.person, "Recipients", data['recipients']),
                const SizedBox(height: 8),
                _buildInfoRow(Icons.calendar_today, "Date", data['date']),
                const SizedBox(height: 8),
                _buildInfoRow(Icons.info, "Status", data['status'], valueColor: primaryColor),
                const SizedBox(height: 20),

                const Divider(),
                const SizedBox(height: 12),

                // Message
                const Text(
                  "Message",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  data['message'] ?? 'No message provided.',
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, dynamic value, {Color? valueColor}) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(width: 8),
        Text(
          "$label: ",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Text(
            value?.toString() ?? 'N/A',
            style: TextStyle(color: valueColor ?? Colors.black87),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
