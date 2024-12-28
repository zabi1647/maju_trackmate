import 'package:get/get.dart';

class AvailableRoomsController extends GetxController {
  var expandedBlocks = <int, bool>{}.obs;
  var expandExam = false.obs;

  void toggleBlock(int index) {
    expandedBlocks[index] = !(expandedBlocks[index] ?? false);
  }

  void toggleExam() {
    expandExam.value = !expandExam.value;
  }
}
