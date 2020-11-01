class UsersModel {
  List<UserItemModel> content;

  UsersModel({this.content = const []});

  factory UsersModel.fromJson(List<dynamic> json) {
    return UsersModel(
        content: json == null ? [] : (json).map((e) => UserItemModel.fromJson(e)).toList());
  }
}

class UserItemModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  UserItemModel({
    this.id = 0,
    this.name = '',
    this.username = '',
    this.email = '',
    this.phone = '',
    this.website = '',
    this.address,
    this.company
  });

  factory UserItemModel.fromJson(Map<String, dynamic> json) {
    return UserItemModel(
        id: json['id'] ?? -1,
        name: json['name'] ?? '',
        username: json['username'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        website: json['website'] ?? '',
        address: Address.fromJson(json['address']),
        company: Company.fromJson(json['company']));
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    this.street = '',
    this.suite = '',
    this.city = '',
    this.zipcode = '',
    this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'] ?? '',
        suite: json['suite'] ?? '',
        city: json['city'] ?? '',
        zipcode: json['zipcode'] ?? '',
        geo: Geo.fromJson(json['geo']));
  }
}

class Geo {
  final String lat ;
  final String lng;

  Geo({this.lat = '',
    this.lng = ''});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'] ?? '',
      lng: json['lng'] ?? '');
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({this.name = '',
    this.catchPhrase = '',
    this.bs = ''});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] ?? '',
      catchPhrase: json['catchPhrase'] ?? '',
      bs: json['bs'] ?? '',);
  }
}