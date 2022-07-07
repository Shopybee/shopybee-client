class AddressModel {
  final String id;
  final String city;
  final String state;
  final String pincode;
  final String addressLine;
  final String? landmark;

  AddressModel(
      {required this.city,
      required this.id,
      required this.state,
      required this.pincode,
      required this.addressLine,
      required this.landmark});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(

        city: json['city'],
        id: json['id'],
        state: json['state'],
        pincode: json['pincode'],
        addressLine: json['addressLine'],
        landmark: json['landmark']);
  }
}
