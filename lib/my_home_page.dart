/// A Flutter widget that displays a home page with interactive tap counters using GetX for state management.
///
/// This page demonstrates the use of GetX's state management capabilities by:
/// 1. Initializing a [TabControllerGet] using Get.put() which registers the controller
///    for dependency injection and makes it available throughout the app.
/// 2. Using GetBuilder<TabControllerGet> to reactively rebuild UI when the controller's
///    state changes. GetBuilder rebuilds only when update() is called in the controller.
/// 3. Displaying the current value of the counter from the controller.
/// 4. Generating multiple tap containers that increment the counter value when tapped.
///
/// Key GetX concepts demonstrated:
/// - Dependency injection with Get.put()
/// - State management with GetBuilder
/// - Controller access without context
/// - UI updates using GetX reactive approach
///
/// The UI consists of a counter display at the top and four tap-responsive containers
/// that increment the counter when tapped.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_learning/controllers/tab_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TabControllerGet tabController = Get.put(TabControllerGet());
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<TabControllerGet>(
              builder: (_) {
                return Container(
                  margin: EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF89dad0), // Green color
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      tabController.x.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),

            ...List.generate(
              4,
              (index) => GestureDetector(
                onTap: () {
                  tabController.increment();
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
                      'Tap',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
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
