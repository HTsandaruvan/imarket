import 'package:flutter/material.dart';
import 'package:imarket/admin/admin_main_page.dart';
import 'package:imarket/admin/super_reviews.dart';
import 'package:fl_chart/fl_chart.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  final List<Map<String, String>> pendingReviews = const [
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
      'status': 'Pending',
    },
  ];

  // Stat Card Data
  final List<Map<String, dynamic>> statData = const [
    {
      'icon': Icons.visibility,
      'label': 'Total Views',
      'value': '12450',
    },
    {
      'icon': Icons.shopping_bag,
      'label': 'Total Products',
      'value': '3291',
    },
    {
      'icon': Icons.rate_review,
      'label': 'Pending Reviews',
      'value': '45',
    },
    {
      'icon': Icons.group,
      'label': 'Total Users',
      'value': '1245',
    },
  ];

  // Quick Action Data
  final List<Map<String, dynamic>> actionData = const [
    {
      'icon': Icons.rate_review,
      'title': 'Review Products',
      'subtitle': '45 Pending Reviews',
    },
    {
      'icon': Icons.group,
      'title': 'Manage Users',
      'subtitle': 'User Management',
    },
    {
      'icon': Icons.send,
      'title': 'Send Broadcast',
      'subtitle': 'Message all users',
    },
    {
      'icon': Icons.settings,
      'title': 'System Settings',
      'subtitle': 'App Configuration',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFFF9FAFB),
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
                      'Admin Dashboard',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Role : Super Admin',
                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.shield_outlined, size: 30, color: Colors.blue),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // Stats Cards
              // Wrap(
              //   spacing: 16,
              //   runSpacing: 16,
              //   children: statData
              //     .map((item) => _buildStatCard(item['icon'], item['label'], item['value']))
              //     .toList(),
              // ),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: statData.map((item) {
                  Color bgColor = Colors.grey.withOpacity(0.15);

                  if (item['label'] == 'Total Views') {
                    bgColor = Colors.blue.withOpacity(0.15);
                  } else if (item['label'] == 'Total Products') {
                    bgColor = Colors.green.withOpacity(0.15);
                  } else if (item['label'] == 'Pending Reviews') {
                    bgColor = Colors.orange.withOpacity(0.15);
                  } else if (item['label'] == 'Total Users') {
                    bgColor = Colors.red.withOpacity(0.15);
                  }

                  return Container(
                  //  width: (MediaQuery.of(context).size.width - 48) / 4,
                    width: 100,
                    height: 165,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Circular icon
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: bgColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item['icon'],
                            size: 28,
                            color: bgColor.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['value'] ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['label'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 24),

              // Quick Actions
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: actionData.map((item) {
                  Color bgColor = Colors.grey.withOpacity(0.15);

                  if (item['title'] == 'Manage Users') {
                    bgColor = Colors.blue.withOpacity(0.15);
                  } else if (item['title'] == 'Send Broadcast') {
                    bgColor = Colors.green.withOpacity(0.15);
                  } else if (item['title'] == 'Review Products') {
                    bgColor = Colors.orange.withOpacity(0.15);
                  } else if (item['title'] == 'System Settings') {
                    bgColor = Colors.purpleAccent.withOpacity(0.15);
                  }

                  return Container(
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon with colored circular background
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: bgColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item['icon'],
                            size: 28,
                            color: bgColor.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['subtitle'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),


              const SizedBox(height: 24),

              // Sales Overview
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Sales Overview',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.settings),
                ],
              ),
              const SizedBox(height: 16),
              // Container(
              //   height: 150,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.blue.shade100),
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: const Center(
              //     child: Text('Sales Chart need to show here'),
              //   ),
              // ),

Container(
  height: 200,
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.blue.shade100),
    borderRadius: BorderRadius.circular(12),
  ),
  child: LineChart(
    LineChartData(
      minY: 0,
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              // Customize X-axis labels
              if (value.toInt() >= 0 && value.toInt() < 7) {
                return Text(
                  ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][value.toInt()],
                  style: const TextStyle(fontSize: 10),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: (value, meta) => Text(
              '${value.toInt()}',
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          isCurved: true,
          color: Colors.blue,
          barWidth: 3,
          spots: [
            FlSpot(0, 50),
            FlSpot(1, 60),
            FlSpot(2, 55),
            FlSpot(3, 70),
            FlSpot(4, 65),
            FlSpot(5, 80),
            FlSpot(6, 75),
          ],
          dotData: FlDotData(show: false),
        ),
      ],
    ),
  ),
),



              const SizedBox(height: 24),

              // Top Countries & Most Searched Products
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildListCard('Top Countries by Trade Activity', [
                      '1. United Arab Emirates (UAE)',
                      '2. India',
                      '3. Qatar',
                      '4. Italy',
                      '5. Germany',
                      '6. Japan',
                    ]),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildListCard('Most Searched Products', [
                      '1. Premium Ceylon Tea',
                      '2. Electronic Components',
                      '3. Premium Coffee',
                      '4. Cotton Fabric',
                      '5. Milky Chocolate',
                      '6. Women\'s Watch',
                    ]),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Pending Reviews
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pending Reviews',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        // context,  MaterialPageRoute(builder: (_) =>const ReviewsPage()),
                        context,  MaterialPageRoute(builder: (_) => AdminMainPage(
                          initialIndex: 4,
                          overridePage: ReviewsPage(),
                        )),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 16),
              
              // Review List (show only first 3)
              ...pendingReviews.take(3).map((review) => _reviewCard(context, review)).toList(),
            ],
          ),
        ),
      ),
    );
  }



  static Widget _buildStatCard(IconData icon, String label, String value) {
    return Container(
      width: 100,
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 3),
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


  static Widget _buildActionCard(IconData icon, String title, String subtitle) {
    return Container(
      width: 160,
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, size: 30, color: Colors.lightBlue),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }


  static Widget _buildListCard(String title, List<String> items) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          // Use Flexible to scroll if content exceeds height
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _reviewCard(BuildContext context, Map<String, String> review) {
    Color levelColor = _getPriorityColor(review['priority']!);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text("by ${review['by']}", style: const TextStyle(color: Colors.grey)),
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

          // Buttons
          Row(
            children: [
              // _actionButton(Icons.check_circle, Colors.greenAccent.shade100, Colors.green),
              // const SizedBox(height: 8),
              // _actionButton(Icons.cancel, Colors.redAccent.shade100, Colors.red),

            //  if (review['status'] == 'Pending') ...[
                _actionButton(
                  Icons.check_circle,
                  Colors.greenAccent.shade100,
                  Colors.green,
                  onTap: () {
                    // Approval logic here
                    print("Approved");
                  },
                ),
                const SizedBox(width: 8),
                _actionButton(
                  Icons.cancel,
                  Colors.redAccent.shade100,
                  Colors.red,
                  onTap: () => _showRejectConfirmation( context, review),
                ),
            //  ],

            ],
          ),
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }

  Color _getPriorityColor(String level) {
    switch (level) {
      case 'HIGH':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      default:
        return Colors.green;
    }
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
