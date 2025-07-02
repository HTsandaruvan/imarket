import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  String selectedStatus = 'Pending';

  final List<Map<String, String>> allReviews = [
    {
      'title': 'Premium Coffee Beans - Arabica A Grade',
      'by': 'Global Trade Solutions',
      'date': '2025-06-13',
      'time': '14:30',
      'priority': 'HIGH',
      'status': 'Pending',
    },
    {
      'title': 'New Trader Registration',
      'by': 'TechParts Manufacturing (Ltd.)',
      'date': '2025-06-13',
      'time': '14:30',
      'priority': 'Medium',
      'status': 'Pending',
    },
    {
      'title': 'Inappropriate Content Report',
      'by': 'Anonymous User',
      'date': '2025-06-13',
      'time': '14:30',
      'priority': 'HIGH',
      'status': 'Approved',
    },
    {
      'title': 'Product Quality Complaint',
      'by': 'Anonymous User',
      'date': '2025-06-13',
      'time': '14:30',
      'priority': 'HIGH',
      'status': 'Rejected',
    },
  ];

  Color getPriorityColor(String level) {
    switch (level) {
      case 'HIGH':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter reviews by selected status
    final filteredReviews =
        allReviews.where((r) => r['status'] == selectedStatus).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          backgroundColor: const Color(0xFFF9FAFB),
          elevation: 2,
          centerTitle: true,
          title: const Text(
            "Reviews",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),

      body: Column(
        children: [
          // Status Tabs
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['Pending', 'Approved', 'Rejected'].map((tab) {
                final isSelected = tab == selectedStatus;
                return GestureDetector(
                  onTap: () => setState(() => selectedStatus = tab),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tab,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Reviews List
          Expanded(
            child: filteredReviews.isEmpty
                ? const Center(child: Text("No reviews found."))
                : ListView.builder(
                    itemCount: filteredReviews.length,
                    itemBuilder: (context, index) {
                      final review = filteredReviews[index];
                      return buildReviewCard(review);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildReviewCard(Map<String, String> review) {
    Color levelColor = getPriorityColor(review['priority']!);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left: Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  "by ${review['by']}",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("${review['date']}   ${review['time']}"),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: levelColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        review['priority']!,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Right: Status-based buttons
          if (review['status'] == 'Pending') ...[
            _actionButton(Icons.check_circle, Colors.greenAccent.shade100, Colors.green, onTap: () { print("Approved"); },),
            const SizedBox(width: 8),
            _actionButton(Icons.cancel, Colors.redAccent.shade100, Colors.red, onTap: () => _showRejectConfirmation( context, review),),
          // ] else if (review['status'] == 'Approved') ...[
          //   _actionButton(Icons.cancel, Colors.redAccent.shade100, Colors.red),
          ] else if (review['status'] == 'Rejected') ...[
            _actionButton(Icons.check_circle, Colors.greenAccent.shade100, Colors.green, onTap: () { print("Approved"); },),
          ]
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, Color bgColor, Color iconColor, {VoidCallback? onTap}) {
    // return Container(
    //   margin: const EdgeInsets.only(left: 8),
    //   padding: const EdgeInsets.all(8),
    //   decoration: BoxDecoration(
    //     color: bgColor,
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: Icon(icon, color: iconColor),
    // );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }


  void _showRejectConfirmation(BuildContext context, Map<String, String> review) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text('Confirm Rejection'),
          content: Text('Are you sure you want to reject:\n\n"${review['title']}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
                // TODO: Add rejection logic here
                print("Rejected: ${review['title']}");
              },
              child: const Text('Reject'),
            ),
          ],
        );
      },
    );
  }




}

