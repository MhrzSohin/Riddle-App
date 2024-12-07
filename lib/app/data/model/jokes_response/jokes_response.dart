import 'dart:convert';

import 'package:equatable/equatable.dart';

class JokesResponse extends Equatable {
	final String? joke;

	const JokesResponse({this.joke});

	factory JokesResponse.fromMap(Map<String, dynamic> data) => JokesResponse(
				joke: data['joke'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'joke': joke,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [JokesResponse].
	factory JokesResponse.fromJson(String data) {
		return JokesResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [JokesResponse] to a JSON string.
	String toJson() => json.encode(toMap());

	JokesResponse copyWith({
		String? joke,
	}) {
		return JokesResponse(
			joke: joke ?? this.joke,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [joke];
}
