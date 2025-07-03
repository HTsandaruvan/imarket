import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedFilter = '7D';

  final Map<String, List<Map<String, dynamic>>> statsData = {
    '7D': [
      {'icon': Icons.visibility, 'label': 'Total Views', 'value': '12,450', 'change': '+12.5%'},
      {'icon': Icons.mark_email_unread, 'label': 'Inquiries', 'value': '234', 'change': '+8.5%'},
      {'icon': Icons.shopping_bag, 'label': 'Products', 'value': '32', 'change': '+2.5%'},
      {'icon': Icons.attach_money, 'label': 'Revenue', 'value': '\$24,000', 'change': '-3.1%'},
    ],
    '30D': [
      {'icon': Icons.visibility, 'label': 'Total Views', 'value': '45,120', 'change': '+10.2%'},
      {'icon': Icons.mark_email_unread, 'label': 'Inquiries', 'value': '800', 'change': '+6.7%'},
      {'icon': Icons.shopping_bag, 'label': 'Products', 'value': '40', 'change': '+1.2%'},
      {'icon': Icons.attach_money, 'label': 'Revenue', 'value': '\$95,000', 'change': '+5.0%'},
    ],
    '3M': [
      {'icon': Icons.visibility, 'label': 'Total Views', 'value': '120,500', 'change': '+18.4%'},
      {'icon': Icons.mark_email_unread, 'label': 'Inquiries', 'value': '2,400', 'change': '+11.3%'},
      {'icon': Icons.shopping_bag, 'label': 'Products', 'value': '45', 'change': '+3.5%'},
      {'icon': Icons.attach_money, 'label': 'Revenue', 'value': '\$300,000', 'change': '+12.0%'},
    ],
    '1Y': [
      {'icon': Icons.visibility, 'label': 'Total Views', 'value': '450,000', 'change': '+25.0%'},
      {'icon': Icons.mark_email_unread, 'label': 'Inquiries', 'value': '8,000', 'change': '+15.0%'},
      {'icon': Icons.shopping_bag, 'label': 'Products', 'value': '50', 'change': '+5.0%'},
      {'icon': Icons.attach_money, 'label': 'Revenue', 'value': '\$1,200,000', 'change': '+20.0%'},
    ],
  };

  final Map<String, List<double>> chartData = {
    '7D': [50, 60, 55, 70, 65, 80, 75],
    '30D': [40, 45, 50, 60, 55, 65, 70],
    '3M': [30, 25, 40, 25, 35, 50, 60],
    '1Y': [20, 25, 20, 35, 25, 45, 40],
  };

  final List<Map<String, String>> topPerforming = const [
    {
      'title': 'Premium Coffee Beans',
      'view': '1250',
      'message': '54',
      'rating': '4.8',
    },
    {
      'title': 'Electronic Components',
      'view': '890',
      'message': '32',
      'rating': '4.6',
    },
    {
      'title': 'Organic Cotton Fabric',
      'view': '756',
      'message': '28',
      'rating': '4.7',
    },
  ];

  final List<Map<String, String>> recentActivity = const [
    {
      'title': 'New Inquiry for Coffee Beans',
      'by': 'From TechCraft Ltd. (China)',
      'time': '3 hours ago',
      'type': 'message',
    },
    {
      'title': 'Product viewed 15 times',
      'by': 'Electronic Components',
      'time': '4 hours ago',
      'type': 'view',
    },
    {
      'title': 'New trader connection',
      'by': 'Maria Gracia from Brazil',
      'time': '2 days ago',
      'type': 'connection',
    },
  ];


  @override
  Widget build(BuildContext context) {
    final stats = statsData[selectedFilter]!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Gradient with rounded bottom
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3556FF), Color(0xFF67A3FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Track your business Performance', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Time Filter Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['7D', '30D', '3M', '1Y'].map((label) => _buildTimeFilterButton(label)).toList(),
              ),
              const SizedBox(height: 16),

              // Stats Cards
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: stats.map((data) {
                  bool isPositive = data['change'].contains('+');

                  // Determine icon background color
                  Color bgColor = Colors.grey.shade200;
                  if (data['label'] == 'Total Views') {
                    bgColor = Colors.blue.withOpacity(0.15);
                  } else if (data['label'] == 'Inquiries') {
                    bgColor = Colors.green.withOpacity(0.15);
                  } else if (data['label'] == 'Products') {
                    bgColor = Colors.orange.withOpacity(0.15);
                  } else if (data['label'] == 'Revenue') {
                    bgColor = Colors.red.withOpacity(0.15);
                  }

                  return Container(
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(50),
                                color: bgColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(data['icon'], size: 30, color: bgColor.withOpacity(0.9),
                              //color: Colors.black54
                              ),
                            ),
                            const Spacer(),
                            
                            Icon(isPositive ? Icons.trending_up : Icons.trending_down,
                                size: 16, color: isPositive ? Colors.green : Colors.red),
                            const SizedBox(width: 4),
                            Text(
                              data['change'],
                              style: TextStyle(color: isPositive ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data['value'],
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(data['label'], style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),


              //Performance Overview
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue.shade50),
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
                    const Text(
                      'Performance Overview',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 200,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade100, width: 1),
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
                                  String label = '';
                                  if (selectedFilter == '7D') {
                                    if (value.toInt() >= 0 && value.toInt() < 7) {
                                      label = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][value.toInt()];
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  } else if (selectedFilter == '30D') {
                                    if (value.toInt() >= 0 && value.toInt() < 7) {
                                      label = 'W${(value.toInt() + 1)}';
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  } else if (selectedFilter == '3M') {
                                    if (value.toInt() >= 0 && value.toInt() < 6) {
                                      label = ['15D', '30D', '45D', '60D', '75D', '90D'][value.toInt()];
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  } else if (selectedFilter == '1Y') {
                                    if (value.toInt() >= 0 && value.toInt() < 12) {
                                      label = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug',
                                        'Sep', 'Oct', 'Nov', 'Dec'][value.toInt()];
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  }
                                  return Text(label, style: const TextStyle(fontSize: 10));
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
                              spots: List.generate(
                                chartData[selectedFilter]!.length,
                                (index) => FlSpot(
                                  index.toDouble(),
                                  chartData[selectedFilter]![index],
                                ),
                              ),
                              dotData: FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        "Sales Performance",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Top Performing Products
              const Text('Top Performing Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ...topPerforming.asMap().entries.map((entry) {
                int index = entry.key;
                var product = entry.value;
                return _infoCard(
                  context,
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blue,
                    child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  //title: product['title']!,
                  title: product['title'] ?? 'Untitled',
                  subtitle: Row(
                    children: [
                      const Icon(Icons.visibility, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(product['view'] ?? ''),
                      const SizedBox(width: 8),
                      const Icon(Icons.message, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(product['message'] ?? ''),
                      const SizedBox(width: 8),
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(product['rating'] ?? ''),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 24),

              // Recent Activity
              const Text('Recent Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ...recentActivity.map((activity) {
                IconData icon = Icons.notifications;
                Color color = Colors.grey;
                if (activity['type'] == 'message') {
                  icon = Icons.mark_email_unread;
                  color = Colors.blue;
                } else if (activity['type'] == 'view') {
                  icon = Icons.visibility;
                  color = Colors.green;
                } else if (activity['type'] == 'connection') {
                  icon = Icons.person_add;
                  color = Colors.pink;
                }
                return _infoCard(
                  context,
                  leading: CircleAvatar(radius: 16, backgroundColor: color.withOpacity(0.2), child: Icon(icon, size: 16, color: color)),
                  title: activity['title'] ?? '',
                  // subtitle: Text('${activity['by'] ?? ''} • ${activity['time'] ?? ''}', style: const TextStyle(color: Colors.grey)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity['by'] ?? '',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            activity['time'] ?? '',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),

                    ],
                  ),

                );
              }),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeFilterButton(String label) {
    bool isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  Widget _infoCard(BuildContext context, {required Widget leading, required String title, required Widget subtitle}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 6))],
        // boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                subtitle,
              ],
            ),
          ),
        ],
      ),
    );
  }

}

