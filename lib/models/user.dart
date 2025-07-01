class User {
  final String id;
  final String name;
  final String businessName;
  final String email;
  final String phone;
  final String location;
  final String website;
  final String about;
  final List<String> specialties;
  final bool isVerified;
  final bool isPremium;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.businessName,
    required this.email,
    required this.phone,
    required this.location,
    required this.website,
    required this.about,
    required this.specialties,
    required this.isVerified,
    required this.isPremium,
    required this.imageUrl,
  });
}
