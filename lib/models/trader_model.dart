class Trader {
  final String id;
  final String name;
  final String company;
  final String role; // IMPORTER, EXPORTER, etc.
  final String location;
  final double rating;
  final int reviewCount;
  final String profileImage;
  final bool isOnline;
  final bool isVerified;
  final List<String> categories;
  final String joinedDate;

  Trader({
    required this.id,
    required this.name,
    required this.company,
    required this.role,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.profileImage,
    required this.isOnline,
    required this.isVerified,
    required this.categories,
    required this.joinedDate,
  });
}
