import 'dart:developer';

import 'package:dio/dio.dart';

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

  @override
  String toString() => 'Brewery($name)\n';
}

void main() async {
  Dio dio = Dio();
  String url = 'https://api.openbrewerydb.org/v1/breweries';
  var res = await dio.get(url);

  var data = List<Map<String, dynamic>>.from(res.data);
  log('$data');
  var bdata = data.map((e) => Brewery.fromMap(e)).toList();

  print(bdata);

}