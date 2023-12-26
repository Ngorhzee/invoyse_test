class BusinessModel {
  final String businessName;
  final String businessAddress;
  final String? image;

  BusinessModel({
    required this.businessName,
    required this.businessAddress,
    this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessModel &&
          businessName == other.businessName &&
          businessAddress == other.businessAddress;

  @override
  int get hashCode =>
      // For example:
      businessName.hashCode ^ businessAddress.hashCode;
}
