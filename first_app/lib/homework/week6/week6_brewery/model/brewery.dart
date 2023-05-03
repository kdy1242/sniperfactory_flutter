class Brewery {
  String id;
  String name;
  String breweryType;
  String? address1;
  String? address2;
  String? address3;
  String city;
  String stateProvince;
  String postalCode;
  String country;
  String? longitude;
  String? latitude;
  String? phone;
  String? websiteUrl;
  String state;
  String? street;
  String imgUrl;

  Brewery({
    required this.id,
    required this.name,
    required this.breweryType,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.stateProvince,
    required this.postalCode,
    required this.country,
    required this.longitude,
    required this.latitude,
    required this.phone,
    required this.websiteUrl,
    required this.state,
    required this.street,
    this.imgUrl = 'https://picsum.photos/100/100',
  });

  factory Brewery.fromMap(Map<String, dynamic> map) {
    return Brewery(
      id: map['id'],
      name: map['name'],
      breweryType: map['brewery_type'],
      address1: map['address_1'],
      address2: map['address_2'],
      address3: map['address_3'],
      city: map['city'],
      stateProvince: map['state_province'],
      postalCode: map['postal_code'],
      country: map['country'],
      longitude: map['longitude'],
      latitude: map['latitude'],
      phone: map['phone'],
      websiteUrl: map['website_url'],
      state: map['state'],
      street: map['street'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brewery_type': breweryType,
      'address_1': address1,
      'address_2': address2,
      'address_3': address3,
      'city': city,
      'state_province': stateProvince,
      'postal_code': postalCode,
      'country': country,
      'longitude': longitude,
      'latitude': latitude,
      'phone': phone,
      'website_url': websiteUrl,
      'state': state,
      'street': street,
    };
  }

  @override
  String toString() => 'Brewery($name), $breweryType';
}