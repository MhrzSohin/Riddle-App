import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riddle, Jokes & Quotes'),
        backgroundColor: const Color.fromARGB(255, 224, 221, 221),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: const Color.fromARGB(255, 163, 163, 163),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Riddles",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.amberAccent,
                              blurRadius: 5,
                              offset: Offset(2, 2))
                        ]),
                    child: Column(
                      children: [
                        Obx(
                          () => Text(
                            controller.title.value,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible: controller.isAnswerVisible.value,
                            child: Text(
                              controller.riddlResults.value.data?.answer ?? '',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  controller.title.value;
                                  controller.isAnswerVisible.value = false;
                                  controller.fetchData();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 87, 34),
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Show Riddles')),
                            Spacer(),
                            ElevatedButton(
                                onPressed: () {
                                  controller.isAnswerVisible.value =
                                      !controller.isAnswerVisible.value;
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 77, 77),
                                    foregroundColor: Colors.white),
                                child: Text("Show Answer")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Jokes",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.amberAccent,
                              blurRadius: 5,
                              offset: Offset(2, 2))
                        ]),
                    child: Column(
                      children: [
                        Obx(
                          () => Text(
                            controller.jokesList.value,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              controller.jokesList.value;
                              controller.fetchJokes();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 255, 87, 34),
                              foregroundColor: Colors.white,
                            ),
                            child: Text("Show Jokes")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Quotes",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.amberAccent,
                                blurRadius: 5,
                                offset: Offset(2, 2))
                          ]),
                      child: Column(
                        children: [
                          Obx(
                            () => Text(
                              controller.quotesList.value,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                controller.quotesList.value;
                                controller.fetchQuotes();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 87, 34),
                                foregroundColor: Colors.white,
                              ),
                              child: Text("Show Quotes")),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
