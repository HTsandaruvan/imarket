import 'package:flutter/material.dart';
import 'package:imarket/admin/admin_main_page.dart';
//import 'package:imarket/admin/super_broadcast.dart';
//import 'package:imarket/admin/super_dashbard.dart';
//import 'package:imarket/user/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I Market',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: const DashboardPage(),
      // home: const SuperAdminDashboard(),
      //home: const BroadcastPage(),
      home: AdminMainPage(initialIndex: 0),
    );
  }
}
