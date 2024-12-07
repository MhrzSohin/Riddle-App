import 'package:api_app/app/core/config/api.dart';
import 'package:api_app/app/core/config/http_config.dart';
import 'package:api_app/app/data/model/emoji_response/emoji_response.dart';
import 'package:api_app/app/data/model/jokes_response/jokes_response.dart';
import 'package:api_app/app/data/model/quotes_response/quotes_response.dart';
import 'package:api_app/app/data/model/riddle_response/riddle_response.dart';

class RiddleService {
  static Future<RiddleResponse?> getRiddles() async {
    try {
      var res = await Api().get(
        HttpConfig.getRiddles,
      );
      var response =
          RiddleResponse.fromMap(res.data[0] as Map<String, dynamic>);
      return response;
    } catch (err) {
      return null;
    }
  }

  static Future<JokesResponse?> getJokes() async {
    try {
      var res = await Api().get(
        HttpConfig.getJokes,
      );
      var response = JokesResponse.fromMap(res.data[0] as Map<String, dynamic>);
      return response;
    } catch (err) {
      return null;
    }
  }

  static Future<QuotesResponse?> getQuotes() async {
    try {
      var res = await Api().get(
        HttpConfig.getQuotes,
      );
      var response =
          QuotesResponse.fromMap(res.data[0] as Map<String, dynamic>);
      return response;
    } catch (err) {
      return null;
    }
  }

  // static Future<List<Emoji?>> getEmoji({
  //   required String name,
  // }) async {
  //   try {
  //     var res = await Api().get(HttpConfig.getEmoji,
  //         addRequestInterceptor: true,
  //         queryParameters: {
  //           'name': name,
  //         } //no need for this project
  //         );
  //     return (res.data as List<dynamic>?)
  //             ?.map((data) => Emoji.fromMap(data))
  //             .toList() ??
  //         [];
  //   } catch (err) {
  //     return [];
  //   }
  // }
}
