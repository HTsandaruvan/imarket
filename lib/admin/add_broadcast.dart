import 'package:flutter/material.dart';
import 'admin_main_page.dart';

class AddBroadcastPage extends StatefulWidget {
  final Map<String, dynamic>? editData;

  const AddBroadcastPage({super.key, this.editData});

  @override
  State<AddBroadcastPage> createState() => _AddBroadcastPageState();
}

class _AddBroadcastPageState extends State<AddBroadcastPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  DateTime? selectedDateTime;

  final List<String> audienceGroups = [
    'All Users',
    'Active Users',
    'Exporters',
    'Importers',
  ];

  String selectedAudience = 'All Users';

  @override
  void initState() {
    super.initState();
    if (widget.editData != null) {
      _titleController.text = widget.editData!['title'];
      _messageController.text = widget.editData!['message'];
      selectedAudience = widget.editData!['audience'];
      selectedDateTime = widget.editData!['datetime'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminMainPage(
      initialIndex: 3, // Ensure Broadcast tab stays selected
      overridePage: Scaffold(
        backgroundColor: const Color(0xFFEFF6FF),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          title: Text(
            widget.editData != null ? 'Edit Broadcast Message' : 'Add New Broadcast Message',
            //'Add New Broadcast Message',
            style: const TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Broadcast Title *', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter broadcast title',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Target Audience', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...audienceGroups.map((group) => ChoiceChip(
                            label: Text(group),
                            selected: selectedAudience == group,
                            onSelected: (_) => setState(() => selectedAudience = group),
                            selectedColor: Colors.blue,
                            labelStyle: TextStyle(color: selectedAudience == group ? Colors.white : Colors.black),
                          )),
                      ElevatedButton(
                        onPressed: _openAddGroupModal,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        child: const Text('+ Add New Group'),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Messages *', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _messageController,
                    maxLines: 5,
                    maxLength: 500,
                    decoration: InputDecoration(
                      hintText: 'Enter your message here....',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Date & Time', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: _pickDateTime,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDateTime != null
                                ? '${selectedDateTime!.toLocal()}'.split('.')[0]
                                : 'Select Date & Time',
                            style: TextStyle(
                              color: selectedDateTime != null ? Colors.black : Colors.grey,
                            ),
                          ),
                          const Icon(Icons.calendar_today, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Save draft logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        ),
                        child: const Text('Save as Draft'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Send message logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.send_rounded, size: 20),
                            SizedBox(width: 8),
                            Text('Send'),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        setState(() {
          selectedDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }


  void _openAddGroupModal() {
    final TextEditingController groupNameController = TextEditingController();
    final TextEditingController membersController = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Create New Group', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextField(
                controller: groupNameController,
                decoration: const InputDecoration(
                  labelText: 'Group Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: membersController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Members (comma-separated emails/usernames)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String groupName = groupNameController.text.trim();
                  if (groupName.isNotEmpty) {
                    setState(() {
                      audienceGroups.add(groupName);
                      selectedAudience = groupName;
                    });
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                child: const Text('Add Group'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }



}
