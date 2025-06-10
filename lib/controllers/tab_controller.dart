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
import 'package:get/get_state_manager/get_state_manager.dart';

class TabControllerGet extends GetxController {
  int _x = 0;
  int get x => _x;
  void increment() {
    _x++;
    update(); // Notify listeners to update the UI
  }

  void decreaseX() {
    _x--;
    update(); // Notify listeners to update the UI
  }
}
