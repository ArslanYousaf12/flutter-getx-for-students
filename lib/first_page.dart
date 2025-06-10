import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:getx_app_learning/controllers/tab_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    TabControllerGet controller = Get.find<TabControllerGet>();
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        backgroundColor: Color(0xFF89dad0),
        leading: IconButton(
          onPressed: () {
            Get.back(); // Navigate back to the previous page
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ), // Green color
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFF89dad0), // Green color
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  controller.x.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
