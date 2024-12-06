import 'dart:convert';

import 'package:equatable/equatable.dart';

class Emoji extends Equatable {
  final String? code;
  final String? character;
  final String? image;
  final String? name;
  final String? group;
  final String? subgroup;

  const Emoji({
    this.code,
    this.character,
    this.image,
    this.name,
    this.group,
    this.subgroup,
  });

  factory Emoji.fromMap(Map<String, dynamic> data) => Emoji(
        code: data['code'] as String?,
        character: data['character'] as String?,
        image: data['image'] as String?,
        name: data['name'] as String?,
        group: data['group'] as String?,
        subgroup: data['subgroup'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'code': code,
        'character': character,
        'image': image,
        'name': name,
        'group': group,
        'subgroup': subgroup,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Emoji].
  factory Emoji.fromJson(String data) {
    return Emoji.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Emoji] to a JSON string.
  String toJson() => json.encode(toMap());

  Emoji copyWith({
    String? code,
    String? character,
    String? image,
    String? name,
    String? group,
    String? subgroup,
  }) {
    return Emoji(
      code: code ?? this.code,
      character: character ?? this.character,
      image: image ?? this.image,
      name: name ?? this.name,
      group: group ?? this.group,
      subgroup: subgroup ?? this.subgroup,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      code,
      character,
      image,
      name,
      group,
      subgroup,
    ];
  }
}
