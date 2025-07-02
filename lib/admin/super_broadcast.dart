import 'package:flutter/material.dart';
import 'package:imarket/admin/add_broadcast.dart';
import 'package:imarket/admin/broadcast_details.dart';

class BroadcastPage extends StatefulWidget {
  const BroadcastPage({super.key});

  @override
  State<BroadcastPage> createState() => _BroadcastPageState();
}

class _BroadcastPageState extends State<BroadcastPage> {
  // Stat Card Data
  final List<Map<String, dynamic>> statData = const [
    {
      'icon': Icons.send_sharp,
      'label': 'Sent',
      'value': '2',
    },
    {
      'icon': Icons.group,
      'label': 'Recipients',
      'value': '1245',
    },
    {
      'icon': Icons.visibility,
      'label': 'Avg open Rate',
      'value': '70.0%',
    },
  ];

  // final List<Map<String, dynamic>> broadcasts = const [
  //   {
  //     'title': 'New Product Launch Announcement',
  //     'audience': 'All Users',
  //     'recipients': 12437,
  //     'date': 'Mar 15, 2025',
  //     'openRate': '65% open rate',
  //     'status': 'Sent',
  //   },
  // ];

  final List<Map<String, dynamic>> broadcasts = [
  {
    'id': 1,
    'title': 'New Product Launch Announcement',
    'audience': 'All Users',
    'recipients': 12437,
    'date': 'Mar 15, 2025',
    'openRate': '65% open rate',
    'status': 'Draft', // Can be 'Sent', 'Draft', 'Scheduled'
    'message': 'Our new product is launching soon!',
    'datetime': DateTime(2025, 3, 15, 14, 30),
  },
  {
    'id': 2,
    'title': 'New Product Launch Announcement',
    'audience': 'All Users',
    'recipients': 12437,
    'date': 'Mar 15, 2025',
    'openRate': '65% open rate',
    'status': 'Sent', // Can be 'Sent', 'Draft', 'Scheduled'
    'message': 'Our new product is launching soon!',
    'datetime': DateTime(2025, 3, 15, 14, 30),
  },
  {
    'id': 3,
    'title': 'New Product Launch Announcement',
    'audience': 'All Users',
    'recipients': 12437,
    'date': 'Mar 15, 2025',
    'openRate': '65% open rate',
    'status': 'Scheduled', // Can be 'Sent', 'Draft', 'Scheduled'
    'message': 'Our new product is launching soon!',
    'datetime': DateTime(2025, 3, 15, 14, 30),
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          automaticallyImplyLeading: false,
          //backgroundColor: const Color(0xFFF9FAFB),
          backgroundColor: Colors.white,
          elevation: 8,
          flexibleSpace: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Broadcast Messages',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Send notifications to your users',
                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Stats Cards
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: statData
                  .map((item) => _buildStatCard(item['icon'], item['label'], item['value']))
                  .toList(),
              ),
              const SizedBox(height: 24),

              // Create Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C42CF),
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddBroadcastPage(),
                      ),
                    );
                  },
                  child: const Text('+ Create New Broadcast', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'Recent Broadcasts',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              // Broadcast Cards List
              Column(
                children: broadcasts
                    .map((item) => _buildBroadcastCard(context, item))
                    .toList(),
              )

            ],
          ),
        )
      ),

    );
  }


  static Widget _buildStatCard(IconData icon, String label, String value) {
    return Container(
      width: 120,
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBroadcastCard(BuildContext context, Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(data['title'],
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  //color: Colors.green[100],
                  color: _getStatusColor(data['status']).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                //child: const Text('Sent', style: TextStyle(color: Colors.green)),
                child: Row(
                  children: [
                    //Icon(Icons.check_circle, size: 18, color: Colors.green),
                    Icon(_getStatusIcon(data['status']), size: 18, color: _getStatusColor(data['status']),),
                    SizedBox(width: 4),
                    Text(data['status'], style: TextStyle(color: _getStatusColor(data['status'])),),
                    //Text(data['status'], style: TextStyle(color: Colors.green)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 6),
          Text(data['message'],
              style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          const SizedBox(height: 12),

          _buildIconText(Icons.group, 'Audience', data['audience']),
          const SizedBox(height: 8),
          _buildIconText(Icons.mail, 'Recipients', data['recipients'].toString()),
          const SizedBox(height: 8),
          _buildIconText(Icons.calendar_today, 'Date', data['date']),

          const SizedBox(height: 10),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(data['openRate'], style: const TextStyle(color: Colors.green)),
          //     Row(
          //       children: const [
          //         Icon(Icons.visibility, size: 20, color: Colors.grey),
          //         SizedBox(width: 10),
          //         Icon(Icons.edit, size: 20, color: Colors.grey),
          //         SizedBox(width: 10),
          //         Icon(Icons.delete, size: 20, color: Colors.grey),
          //       ],
          //     )
          //   ],
          // )

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(data['openRate'], style: const TextStyle(color: Colors.green)),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BroadcastDetailsPage(data: data),
                        ),
                      );
                    },
                    child: const Icon(Icons.visibility, size: 20, color: Colors.grey),
                  ),
                  SizedBox(width: 10),
                  if (data['status'] != 'Sent') ...[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddBroadcastPage(editData: data),
                          ),
                        );
                      },
                      child: const Icon(Icons.edit, size: 20, color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _confirmDelete(context, data['id']);
                      },
                      child: const Icon(Icons.delete, size: 20, color: Colors.grey),
                    ),
                  ],
                  // Icon(Icons.visibility, size: 20, color: Colors.grey),
                  // SizedBox(width: 10),
                  // Icon(Icons.edit, size: 20, color: Colors.grey),
                  // SizedBox(width: 10),
                  // Icon(Icons.delete, size: 20, color: Colors.grey),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(value, style: TextStyle(fontSize: 13, color: Colors.grey[800])),
      ],
    );
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Sent':
        return Icons.check_circle;
      case 'Draft':
        return Icons.edit_document; // You can use Icons.edit_note too
      case 'Scheduled':
        return Icons.schedule;
      default:
        return Icons.info;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Sent':
        return Colors.green;
      case 'Draft':
        return Colors.orange;
      case 'Scheduled':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }


  void _confirmDelete(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this broadcast?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                broadcasts.removeWhere((item) => item['id'] == id);
              });
              Navigator.of(ctx).pop();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }



}