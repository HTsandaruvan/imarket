import 'package:flutter/material.dart';
import '../../models/message_model.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All Messages';
  List<Message> _filteredMessages = [];

  // Mock message data
  final List<Message> _allMessages = [
    Message(
      id: '1',
      companyName: 'Global Grains Ltd.',
      companyCode: 'EX-2024-001',
      content:
          'Thank you for your interest in our Basmati rice. We can offer competitive pricing for...',
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      type: MessageType.general,
      status: MessageStatus.read,
    ),
    Message(
      id: '2',
      companyName: 'TechTrade Solutions',
      companyCode: 'IM-2024-002',
      content:
          'We have updated our electronic components catalog. Please check the...',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      type: MessageType.quotation,
      status: MessageStatus.unread,
      productName: 'Electronic Components Import',
      quantity: '100 tons',
      deliveryLocation: 'Colombo, Sri Lanka',
      hasResponse: false,
    ),
    Message(
      id: '3',
      companyName: 'EcoFabrics International',
      companyCode: 'EX-2024-003',
      content:
          'The organic cotton samples have been shipped. You should receive them by...',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      type: MessageType.general,
      status: MessageStatus.unread,
    ),
    Message(
      id: '4',
      companyName: 'Spice Masters Co.',
      companyCode: 'EX-2024-004',
      content:
          'Our premium spice collection is now available for export. Would you like to...',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      type: MessageType.general,
      status: MessageStatus.read,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filteredMessages = _allMessages;
  }

  void _filterMessages() {
    setState(() {
      if (_selectedFilter == 'All Messages') {
        _filteredMessages = _allMessages;
      } else if (_selectedFilter == 'Unread') {
        _filteredMessages = _allMessages
            .where((msg) => msg.status == MessageStatus.unread)
            .toList();
      } else if (_selectedFilter == 'Quotations') {
        _filteredMessages = _allMessages
            .where((msg) => msg.type == MessageType.quotation)
            .toList();
      }

      // Apply search filter
      if (_searchController.text.isNotEmpty) {
        final query = _searchController.text.toLowerCase();
        _filteredMessages = _filteredMessages
            .where(
              (msg) =>
                  msg.companyName.toLowerCase().contains(query) ||
                  msg.content.toLowerCase().contains(query),
            )
            .toList();
      }
    });
  }

  int get unreadCount =>
      _allMessages.where((msg) => msg.status == MessageStatus.unread).length;
  int get quotationCount =>
      _allMessages.where((msg) => msg.type == MessageType.quotation).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Messages',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Connect with trade partners',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        toolbarHeight: 80,
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => _filterMessages(),
                decoration: const InputDecoration(
                  hintText: 'Search conversations...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),

          // Filter Tabs
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                _buildFilterTab('All Messages'),
                const SizedBox(width: 16),
                _buildFilterTab('Unread ($unreadCount)'),
                const SizedBox(width: 16),
                _buildFilterTab('Quotations ($quotationCount)'),
              ],
            ),
          ),

          // Messages List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredMessages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildMessageCard(_filteredMessages[index]),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Broadcast Message Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                _showBroadcastDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A6CF7),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Broadcast Message',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label) {
    final isSelected =
        _selectedFilter == label.split(' (')[0]; // Remove count for comparison
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label.split(' (')[0]; // Remove count for filter
        });
        _filterMessages();
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF4A6CF7) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFF4A6CF7) : Colors.grey[600],
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageCard(Message message) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(
                  'https://tse4.mm.bing.net/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?pid=Api&P=0&h=180',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          message.companyName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        if (message.status == MessageStatus.unread)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4A6CF7),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    Text(
                      message.companyCode,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Text(
                message.timeAgo,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Message Content
          Text(
            message.content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 16),

          // Action Buttons
          Row(
            children: [
              _buildActionButton(Icons.message, Colors.grey[600]!, () {
                // Handle message
              }),
              const SizedBox(width: 12),
              _buildActionButton(Icons.phone, Colors.grey[600]!, () {
                // Handle call
              }),
              const SizedBox(width: 12),
              _buildActionButton(Icons.videocam, Colors.grey[600]!, () {
                // Handle video call
              }),
              const SizedBox(width: 12),
              _buildActionButton(Icons.more_horiz, Colors.grey[600]!, () {
                // Handle more options
              }),
              const Spacer(),
              if (message.type == MessageType.quotation && !message.hasResponse)
                ElevatedButton(
                  onPressed: () {
                    _showQuotationResponseDialog(message);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Respond',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }

  void _showQuotationResponseDialog(Message message) {
    final quantityController = TextEditingController();
    final pricingController = TextEditingController();
    final deliveryController = TextEditingController();
    final paymentController = TextEditingController();
    final additionalController = TextEditingController();
    final alternativeController = TextEditingController();
    final shippingDaysController = TextEditingController();

    String selectedStockStatus = 'Full Stock Available';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const Text(
                    'Respond to Quotation',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Request Summary
                  const Text(
                    'Request Summary',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 219, 229, 248),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        _buildSummaryRow(
                          'Product:',
                          message.productName ?? 'Electronic Components Import',
                        ),
                        _buildSummaryRow(
                          'Requested Quantity:',
                          message.quantity ?? '100 tons',
                        ),
                        _buildSummaryRow(
                          'Delivery:',
                          message.deliveryLocation ?? 'Colombo, Sri Lanka',
                        ),
                        _buildSummaryRow('Urgency:', 'Standard (15-30 days)'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Stock Availability
                  const Text(
                    'Stock Availability',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildStockOption(
                    'Full Stock Available',
                    'We have the full quantity in stock',
                    Colors.green,
                    Icons.check_circle,
                    selectedStockStatus,
                    (value) => setState(() => selectedStockStatus = value),
                  ),
                  const SizedBox(height: 8),
                  _buildStockOption(
                    'Partial Stock Available',
                    'We have the full quantity in stock',
                    Colors.orange,
                    Icons.inventory,
                    selectedStockStatus,
                    (value) => setState(() => selectedStockStatus = value),
                  ),
                  const SizedBox(height: 8),
                  _buildStockOption(
                    'Out of Stock',
                    'Product not available, we can suggest alternatives',
                    Colors.red,
                    Icons.warning,
                    selectedStockStatus,
                    (value) => setState(() => selectedStockStatus = value),
                  ),

                  const SizedBox(height: 20),

                  // Conditional Form Fields based on stock status
                  if (selectedStockStatus == 'Out of Stock') ...[
                    // Alternative Products Section
                    const Text(
                      'Alternative products/solutions',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 223, 223),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: alternativeController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText:
                              'Describe alternative products or solutions you can offer...',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 180, 180, 180),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Shipping Terms (simplified)
                    const Text(
                      'Shipping Terms',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: shippingDaysController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '3',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Text(
                              'days',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    // Full form for in-stock items
                    _buildFormField(
                      'Quantity',
                      quantityController,
                      'quantity',
                      'Units',
                    ),
                    const SizedBox(height: 16),
                    _buildFormField(
                      'Final Pricing',
                      pricingController,
                      'Final price per unit',
                      'Per Unit',
                    ),
                    const SizedBox(height: 16),
                    _buildFormField(
                      'Delivery Terms',
                      deliveryController,
                      'Delivery Time (15-30 days)',
                      null,
                    ),
                    const SizedBox(height: 16),
                    _buildFormField(
                      'Payment Terms',
                      paymentController,
                      'eg. 30% advanced, 70% delivery',
                      null,
                    ),
                  ],

                  const SizedBox(height: 16),

                  // Additional Terms (always shown)
                  _buildFormField(
                    'Additional Terms (Optional)',
                    additionalController,
                    null,
                    null,
                    maxLines: 3,
                  ),

                  const SizedBox(height: 30),

                  // Send Quotation Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: isLoading
                          ? null
                          : () async {
                              // Validate required fields based on stock status
                              if (selectedStockStatus == 'Out of Stock') {
                                if (alternativeController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please provide alternative products/solutions',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                              } else {
                                if (quantityController.text.isEmpty ||
                                    pricingController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please fill in required fields',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                              }

                              setState(() => isLoading = true);

                              // Simulate API call
                              await Future.delayed(const Duration(seconds: 2));

                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    selectedStockStatus == 'Out of Stock'
                                        ? 'Alternative solutions sent successfully!'
                                        : 'Quotation response sent successfully!',
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                      icon: isLoading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Icon(Icons.send, size: 18),
                      label: Text(isLoading ? 'Sending...' : 'Send Quotation'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A6CF7),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStockOption(
    String title,
    String subtitle,
    Color color,
    IconData icon,
    String selectedValue,
    Function(String) onChanged,
  ) {
    final isSelected = selectedValue == title;
    return GestureDetector(
      onTap: () => onChanged(title),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? color : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icon, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? color : Colors.black87,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            if (isSelected) Icon(Icons.check_circle, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(
    String label,
    TextEditingController controller,
    String? hint,
    String? suffix, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              if (suffix != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Text(
                    suffix,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  void _showBroadcastDialog() {
    final messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Broadcast Message',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: messageController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Type your broadcast message here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Broadcast message sent!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A6CF7),
                      ),
                      child: const Text('Send'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
