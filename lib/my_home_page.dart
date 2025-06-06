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
import 'package:getx_app_learning/first_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final List<String> texts = const ['Go To first', 'Tap', 'Tap', 'Tap'];

  void onTap2() {
    Get.to(FirstPage());
  }

  @override
  Widget build(BuildContext context) {
    TabControllerGet tabController = Get.put(TabControllerGet());
    void onTap() {
      tabController.increment();
    }
    // Using Get.put() to initialize the controller and make it available for dependency injection
    // This allows us to access the controller without needing to pass context around
    // and ensures that the controller is created only once and reused throughout the app.
    // This is different from Flutter's built-in TabController, which is used for managing tabs in a TabBar.
    // Here, we are using GetX's state management to handle the counter logic.
    // The controller manages an internal counter (_x) and provides an increment method to update it.
    // The GetBuilder widget listens to changes in the TabControllerGet and rebuilds the UI
    // whenever the update() method is called in the controller.
    // This allows us to reactively update the UI based on the controller's state.
    // The UI consists of a counter display and multiple tap-responsive containers.
    // The counter display shows the current value of _x from the controller,
    // and the tap-responsive containers increment this value when tapped.
    // This approach allows for a clean separation of concerns,
    // where the controller handles the logic and state management,
    // while the UI focuses on displaying the data and responding to user interactions.
    // The use of GetX's reactive programming model simplifies state management
    // and makes it easy to build responsive UIs that update automatically
    // when the underlying data changes.
    // The controller is initialized using Get.put() which registers it for dependency injection.
    // This allows us to access the controller without needing to pass context around
    // and ensures that the controller is created only once and reused throughout the app.
    // This is different from Flutter's built-in TabController, which is used for managing tabs in a TabBar.
    // Here, we are using GetX's state management to handle the counter logic.
    // The controller manages an internal counter (_x) and provides an increment method to update it.
    // The GetBuilder widget listens to changes in the TabControllerGet and rebuilds the UI
    // whenever the update() method is called in the controller.

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
                onTap: index == 0 ? onTap2 : onTap,
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
                      texts[index],
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
