/// A controller class for managing tab-related state using the GetX state management library.
///
/// This controller maintains an internal counter [_x] that can be incremented.
/// It uses GetX's [update()] method to notify listeners when the state changes.
///
/// Example:
/// ```dart
/// final controller = Get.put(TabControllerGet());
/// controller.increment(); // Increases x by 1 and updates UI
/// ```
///
/// Note: This is different from Flutter's built-in TabController.
/// This controller uses GetX for state management and UI updates.
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TabControllerGet extends GetxController {
  int _x = 0;
  RxInt _y = 0.obs;
  RxInt _z = 0.obs;

  // Reactive variable using RxInt
  // RxInt is a reactive integer that automatically updates the UI when changed
  // This is different from Flutter's built-in TabController, which is used for managing tabs in a TabBar.
  // Here, we are using GetX's state management to handle the counter logic.
  // The controller manages an internal counter (_x) and provides methods to increment and decrement it.
  int get x => _x;
  RxInt get y => _y;

  RxInt get z => _z;

  // Getter for _x to access its value outside the controller
  // Getter for _y to access its reactive value outside the controller
  void increment() {
    _x++;
    update(); // Notify listeners to update the UI
  }

  void decreaseX() {
    _x--;
    update(); // Notify listeners to update the UI
  }

  void incrementY() {
    _y.value++;
  }

  void decreaseY() {
    _y.value--;
  }

  void total() {
    _z.value = _x + _y.value;
    print("Total: $_z");
  }
}
