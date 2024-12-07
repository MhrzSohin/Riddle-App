import 'package:api_app/app/data/model/emoji_response/emoji_response.dart';
import 'package:api_app/app/data/model/jokes_response/jokes_response.dart';
import 'package:api_app/app/data/model/quotes_response/quotes_response.dart';
import 'package:api_app/app/data/model/result.dart';
import 'package:api_app/app/data/model/riddle_response/riddle_response.dart';
import 'package:api_app/app/data/service/riddle_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  var title = 'Home'.obs;
  var jokesList = 'Jokes'.obs;
  var quotesList = 'Quotes'.obs;
  var emoji = TextEditingController();
  var dataBox = GetStorage();
  var isAnswerVisible = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    title.value = dataBox.read('riddle') ?? 'No Riddle';
    jokesList.value = dataBox.read('joke') ?? 'No Jokes';
    quotesList.value = dataBox.read('quote') ?? 'No Quotes';
  }

  var riddlResults = APIResult<RiddleResponse>().obs;
  // final dio = Dio();

  void fetchData() async {
    riddlResults.value = APIResult.loading();

    var response = await RiddleService.getRiddles();
    if (response != null) {
      riddlResults.value = APIResult.success(response);
    } else {
      riddlResults.value = APIResult.error("Something went wrong.");
    }
    if (riddlResults.value.isSuccessful) {
      title.value = riddlResults.value.data?.question ?? 'no data';
      dataBox.write('riddle', riddlResults.value.data?.question);
      Get.snackbar("Success", "Data fetched successfully.");
    } else {
      Get.snackbar("error", "Something went wrong ERROR");
    }
  }

  var jokesResults = APIResult<JokesResponse>().obs;

  void fetchJokes() async {
    jokesResults.value = APIResult.loading();
    var response = await RiddleService.getJokes();
    if (response != null) {
      jokesResults.value = APIResult.success(response);
    } else {
      jokesResults.value = APIResult.error("Something went wrong.");
    }
    if (jokesResults.value.isSuccessful) {
      jokesList.value = jokesResults.value.data?.joke ?? 'no data';
      dataBox.write('joke', jokesResults.value.data?.joke);
      Get.snackbar("Success", "Data fetched successfully.");
    } else {
      Get.snackbar("error", "Something went wrong ERROR");
    }
  }

  var quotesResults = APIResult<QuotesResponse>().obs;

  void fetchQuotes() async {
    quotesResults.value = APIResult.loading();
    var response = await RiddleService.getQuotes();
    if (response != null) {
      quotesResults.value = APIResult.success(response);
    } else {
      quotesResults.value = APIResult.error("Something went wrong.");
    }
    if (quotesResults.value.isSuccessful) {
      quotesList.value = quotesResults.value.data?.quote ?? 'no data';
      dataBox.write('quote', quotesResults.value.data?.quote);
      Get.snackbar("Success", "Data fetched successfully.");
    } else {
      Get.snackbar("error", "Something went wrong ERROR");
    }
  }

  // var response = await dio.get(
  //   'https://api.api-ninjas.com/v1/riddles',
  //   options: Options(
  //     headers: {'X-Api-Key': '1wDtvZuDeIn+MyJkLZp12g==zU8rGfoGQv54ePeW'},
  //   ),
  // );
  // title.value = response.data[0]['question'];
}

  // var emojiResult = APIResult<List<Emoji?>>().obs;
  // void fetchEmoji() async {
  //   emojiResult.value = APIResult.loading();

  //   var response = await RiddleService.getEmoji(name: emoji.text);
  //   if (response.isNotEmpty) {
  //     emojiResult.value = APIResult.success(response);
  //   } else {
  //     emojiResult.value = APIResult.error("Something went wrong.");
  //   }
  //   if (emojiResult.value.isSuccessful) {
  //     Get.snackbar("Success", "Data fetched successfully.");
  //   } else {
  //     Get.snackbar("error", "Something went wrong ERROR");
  //   }
  // }
