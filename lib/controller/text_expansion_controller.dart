import 'package:get/get.dart';

class TexExpansionController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
}