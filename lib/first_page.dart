import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:getx_app_learning/controllers/tab_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    TabControllerGet controller = Get.find<TabControllerGet>();

    // Using Get.find() to access the existing instance of TabControllerGet
    // This allows us to use the same controller instance created in MyHomePage
    // without needing to create a new one, ensuring consistent state management
    // and avoiding unnecessary reinitialization of the controller.
    // This is different from Flutter's built-in TabController, which is used for managing tabs in a TabBar.
    // Here, we are using GetX's state management to handle the counter logic.
    // The controller manages an internal counter (_x) and provides methods to increment and decrement it.
    // The GetBuilder widget listens to changes in the TabControllerGet and rebuilds the UI
    // whenever the update() method is called in the controller.
    // This allows us to reactively update the UI based on the controller's state.
    // The UI consists of a counter display and a button to decrease the counter value.
    // The counter display shows the current value of _x from the controller,
    // and the button allows the user to decrease this value when tapped.
    // This approach allows for a clean separation of concerns,
    // where the controller handles the logic and state management,
    // while the UI focuses on displaying the data and responding to user interactions.
    // The use of GetX's reactive programming model simplifies state management
    // and makes it easy to build responsive UIs that update automatically
    // when the underlying data changes.
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
            GetBuilder<TabControllerGet>(
              builder: (controller) {
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
                      controller.x.toString(),
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

            GestureDetector(
              onTap: () {
                controller.decreaseX();
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
                    "Decrease X",
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
