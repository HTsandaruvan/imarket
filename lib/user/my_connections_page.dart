import 'package:flutter/material.dart';

class MyConnectionsPage extends StatefulWidget {
  const MyConnectionsPage({super.key});

  @override
  State<MyConnectionsPage> createState() => _MyConnectionsPageState();
}

class _MyConnectionsPageState extends State<MyConnectionsPage> {

  final TextEditingController _searchController = TextEditingController();

  List<Map<String,String>> connections =[
    // {"name": "John Deo", "email": "johndeo@example.com", "company": "ABC Exports", "imageUrl": "https://lutz.q10capital.com/wp-content/uploads/sites/8/2023/09/DSC_8914-Edit-Edit-Edit-2-scaled.jpg"},
    // {"name": "Jane Smith", "email": "jane@example.com", "company": "ABC Exports", "imageUrl": "https://imgcdn.stablediffusionweb.com/2024/4/17/6d71579f-ecef-42de-b83e-c0cb8179130c.jpg"},
    {"name": "John Deo", "email": "johndeo@example.com", "company": "ABC Exports",},
    {"name": "Jane Smith", "email": "jane@example.com", "company": "ABC Exports"},
    {"name": "Alice Johnson", "email": "alice@example.com", "company": "ABC Exports",},
  ];

  List<Map<String, String>> filteredConnections = [];

  @override
  void initState() {
    super.initState();
    filteredConnections = connections;
  }

  void _searchConnections(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      filteredConnections = connections.where((connection) {
        final name =  connection['name']?.toLowerCase() ?? '';
        final email =  connection['email']?.toLowerCase() ?? '';
        final company =  connection['company']?.toLowerCase() ?? '';
        return name.contains(lowerQuery) || email.contains(lowerQuery) || company.contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 4,
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back, color: Colors.black,)
        ),
        centerTitle: true,
        title: const Text(
          "My Conections",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _searchConnections,
              decoration: InputDecoration(
                hintText: "Search connections...",
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                )
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: filteredConnections.isEmpty ?
              const Center(child: Text("No connections found."))
              : ListView.builder(
                itemCount: filteredConnections.length,
                itemBuilder: (context, index) {
                  final connection = filteredConnections[index];
                  return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.blue[200],
                          backgroundImage: connection["imageUrl"] != null && connection["imageUrl"]!.isNotEmpty
                              ? NetworkImage(connection["imageUrl"]!)
                              : null,
                          child: connection["imageUrl"] == null || connection["imageUrl"]!.isEmpty
                              ? const Icon(Icons.person, color: Colors.white, size: 40,)
                              : null,
                      ),
                      title: Text(connection["name"]!),
                      // subtitle: Text(connection["email"]!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( connection["company"] ?? "No company",
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          Text(connection["email"] ?? "No email", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.more_vert),
                      //   onPressed: () {
                      //     // Future: actions like remove/block
                      //   },
                      // ),
                    ),
                  );
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}