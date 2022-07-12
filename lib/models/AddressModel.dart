class AddressModel {
  final String id;
  final String city;
  final String state;
  final String pincode;
  final String addressLine;
  final String? landmark;
  final String phone;

  AddressModel(
      {required this.city,
      required this.id,
      required this.phone,
      required this.state,
      required this.pincode,
      required this.addressLine,
      required this.landmark});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        city: json['city'],
        phone: json['phone'],
        id: json['id'],
        state: json['state'],
        pincode: json['pincode'],
        addressLine: json['addressLine'],
        landmark: json['landmark']);
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'phone': phone,
      'id': id,
      'state': state,
      'pincode': pincode,
      'addressLine': addressLine,
      'landmark': landmark,
    };
  }
}
