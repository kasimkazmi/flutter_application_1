import 'package:get/get.dart';

class BottomNavControler extends GetxController {
  var selectedIndex = 0.obs;
  void onItemTapped(int index) {
    print("Mubjks --$index");
    selectedIndex.value = index;
  }
}
