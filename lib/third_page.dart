import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_learning/controllers/tab_controller.dart';
import 'package:getx_app_learning/my_home_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    TabControllerGet controllerGet = Get.find();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(MyHomePage());
                // Navigate back to MyHomePage
              },
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF89dad0), // Green color
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    controllerGet.x.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
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
