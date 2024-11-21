import 'package:get/get.dart';

class AvailableRoomsController extends GetxController {
  var expandedBlocks = <int, bool>{}.obs;

  void toggleBlock(int index) {
    expandedBlocks[index] = !(expandedBlocks[index] ?? false);
  }
}
