import 'package:chayxana/pages/main/home/home_page.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  /// #Nasibali
  List<bool> isTabs = [false, false, false, false, false, false, false, false];
  bool isClean = false;
  List<bool> selectedTabs = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  onTab(int index) {
    isTabs[index] = !isTabs[index];

    for (int i = 0; i < isTabs.length; i++) {
      if (!isTabs[i]) {
        isClean = false;
        continue;
      } else {
        isClean = true;
        break;
      }
    }
    update();
  }

  clearTabs() {
    for (int i = 0; i < isTabs.length; i++) {
      isTabs[i] = false;
    }
    isClean = false;
    selectedTabs = [false, false, false, false, false, false, false, false];
    update();
  }

  selectTabs() {
    selectedTabs = isTabs;
    update();
  }
}
