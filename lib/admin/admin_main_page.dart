import 'package:flutter/material.dart';
import 'package:imarket/admin/super_broadcast.dart';
import 'package:imarket/admin/super_dashbard.dart';
import 'package:imarket/user/dashboard.dart';

class AdminMainPage extends StatefulWidget {
  final int initialIndex;

  final Widget? overridePage;

  const AdminMainPage({super.key, this.initialIndex = 0, this.overridePage});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  late int currentIndex;

  final List<Widget> pages = [
    DashboardPage(),
    Placeholder(), // Search Page (if needed)
    Placeholder(), // Search Page (if needed)
    BroadcastPage(),
    SuperAdminDashboard(),
    Placeholder(), // Profile Page (if needed)
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.overridePage ?? pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Directory"),
          BottomNavigationBarItem(icon: Icon(Icons.send_rounded), label: "Broadcast"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
