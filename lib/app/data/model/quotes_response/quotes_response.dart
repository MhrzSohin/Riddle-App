import 'dart:convert';

import 'package:equatable/equatable.dart';

class QuotesResponse extends Equatable {
	final String? quote;
	final String? author;
	final String? category;

	const QuotesResponse({this.quote, this.author, this.category});

	factory QuotesResponse.fromMap(Map<String, dynamic> data) {
		return QuotesResponse(
			quote: data['quote'] as String?,
			author: data['author'] as String?,
			category: data['category'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'quote': quote,
				'author': author,
				'category': category,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QuotesResponse].
	factory QuotesResponse.fromJson(String data) {
		return QuotesResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [QuotesResponse] to a JSON string.
	String toJson() => json.encode(toMap());

	QuotesResponse copyWith({
		String? quote,
		String? author,
		String? category,
	}) {
		return QuotesResponse(
			quote: quote ?? this.quote,
			author: author ?? this.author,
			category: category ?? this.category,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [quote, author, category];
}
