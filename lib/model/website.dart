// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Website extends Equatable {
  final int? id;
  final String? name;
  final String? pwa_url;
  final String? pwa_html;
  final String? icon;
  final int? sequence;
  final Map? status;
  final String? created_at;
  final String? updated_at;

  const Website({
    this.id,
    this.name,
    this.pwa_url,
    this.pwa_html,
    this.icon,
    this.sequence,
    this.status,
    this.created_at,
    this.updated_at
  });

  factory Website.fromMap(Map<String, dynamic> data) => Website(
    id: data['id'] as int?,
    name: data['name'] as String?,
    pwa_url: data['pwa_url'] as String?,
    pwa_html: data['pwa_html'] as String?,
    icon: data['icon'] as String?,
    sequence: data['sequence'] as int?,
    status: data['status'] as Map?,
    created_at: data['created_at'] as String?,
    updated_at: data['updated_at'] as String?,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pwa_url': pwa_url,
      'pwa_html': pwa_html,
      'icon': icon,
      'sequence': sequence,
      'status': status,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Website.fromJson(String data) {
    return Website.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Website copyWith({
    int? id,
    String? name,
    String? pwa_url,
    String? pwa_html,
    String? icon,
    int? sequence,
    Map? status,
    String? created_at,
    String? updated_at,
  }) {
    return Website(
      id: id ?? this.id,
      name: name ?? this.name,
      pwa_url: pwa_url ?? this.pwa_url,
      pwa_html: pwa_html ?? this.pwa_html,
      icon: icon ?? this.icon,
      sequence: sequence ?? this.sequence,
      status: status ?? this.status,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      pwa_url,
      pwa_html,
      icon,
      sequence,
      status,
      created_at,
      updated_at,
    ];
  }
}
