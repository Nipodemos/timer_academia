import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_academia/app/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Obx(
              () => Text(
                controller.timeInText,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // I don't know to make the counter start,
              // so i've did this and it starts, but only on 2 seconds +
              controller.count++;
            },
            child: Text('Start'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.resetCounter();
            },
            child: Text('Stop'),
          )
        ],
      ),
    );
  }
}
