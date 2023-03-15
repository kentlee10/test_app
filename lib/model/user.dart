// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final Map? address;
  final String? phone;
  final String? website;
  final Map? company;

  const User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
    id: data['id'] as int?,
    name: data['name'] as String?,
    email: data['email'] as String?,
    address: data['address'] as Map?,
    phone: data['phone'] as String?,
    website: data['website'] as String?,
    company: data['company'] as Map?,
  );



  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    Map? address,
    String? phone,
    String? website,
    Map? company
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      address,
      phone,
      website,
      company
    ];
  }
}
