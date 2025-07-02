enum MessageType { general, quotation }

enum MessageStatus { read, unread }

class Message {
  final String id;
  final String companyName;
  final String companyCode;
  final String content;
  final DateTime timestamp;
  final MessageType type;
  final MessageStatus status;
  final String? productName;
  final String? quantity;
  final String? deliveryLocation;
  final bool hasResponse;

  Message({
    required this.id,
    required this.companyName,
    required this.companyCode,
    required this.content,
    required this.timestamp,
    required this.type,
    required this.status,
    this.productName,
    this.quantity,
    this.deliveryLocation,
    this.hasResponse = false,
  });

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour ago';
    } else {
      return '${difference.inDays} day ago';
    }
  }
}
