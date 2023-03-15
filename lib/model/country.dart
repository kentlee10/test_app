// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Country extends Equatable {
  final String? name;
  final String? alpha_2;
  final String? alpha_3;
  final String? country_code;
  final String? iso_3166_2;
  final String? region;
  final String? sub_region;
  final String? intermediate_region;
  final String? region_code;
  final String? sub_region_code;
  final String? intermediate_region_code;

  const Country({
    this.name,
    this.alpha_2,
    this.alpha_3,
    this.country_code,
    this.iso_3166_2,
    this.region,
    this.sub_region,
    this.intermediate_region,
    this.region_code,
    this.sub_region_code,
    this.intermediate_region_code});

  factory Country.fromMap(Map<String, dynamic> data) => Country(
    name: data['name'] as String?,
    alpha_2: data['alpha-2'] as String?,
    alpha_3: data['alpha-3'] as String?,
    country_code: data['country-code'] as String?,
    iso_3166_2: data['iso-3166-2'] as String?,
    region: data['region'] as String?,
    sub_region: data['sub-region'] as String?,
    intermediate_region: data['intermediate-region'] as String?,
    region_code: data['region-code'] as String?,
    sub_region_code: data['sub-region-code'] as String?,
    intermediate_region_code: data['intermediate-region-code'] as String?,
  );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Country.fromJson(String data) {
    return Country.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  Country copyWith({
    String? name,
    String? alpha_2,
    String? alpha_3,
    String? country_code,
    String? iso_3166_2,
    String? region,
    String? sub_region,
    String? intermediate_region,
    String? region_code,
    String? sub_region_code,
    String? intermediate_region_code
  }) {
    return Country(
      name: name ?? this.name,
      alpha_2: alpha_2 ?? this.alpha_2,
      alpha_3: alpha_3 ?? this.alpha_3,
      country_code: country_code ?? this.country_code,
      iso_3166_2: iso_3166_2 ?? this.iso_3166_2,
      region: region ?? this.region,
      sub_region: sub_region ?? this.sub_region,
      intermediate_region: intermediate_region ?? this.intermediate_region,
      region_code: region_code ?? this.region_code,
      sub_region_code: sub_region_code ?? this.sub_region_code,
      intermediate_region_code: intermediate_region_code ?? this.intermediate_region_code,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      alpha_2,
      alpha_3,
      country_code,
      iso_3166_2,
      region,
      sub_region,
      intermediate_region,
      region_code,
      sub_region_code,
      intermediate_region_code
    ];
  }
}
