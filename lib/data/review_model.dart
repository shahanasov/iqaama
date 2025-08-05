class ReviewModel {
  final String title;
  final String subtitle;
  final String rent;
  final List<String> images;
  final List<String> amenities;
  final String leaseTerm;
  final String deposit;
  final String availableDate;

  ReviewModel({
    required this.title,
    required this.subtitle,
    required this.rent,
    required this.images,
    required this.amenities,
    required this.leaseTerm,
    required this.deposit,
    required this.availableDate,
  });

  factory ReviewModel.empty() {
    return ReviewModel(
      title: '',
      subtitle: '',
      rent: '',
      images: [],
      amenities: [],
      leaseTerm: '',
      deposit: '',
      availableDate: '',
    );
  }
}
