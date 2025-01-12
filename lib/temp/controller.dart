import 'package:get/get.dart';

class ListController extends GetxController {
  final List<int> first = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  final List<int> second = [1, 2, 3, 4, 5,6];

  final RxList<int> filteredList = <int>[].obs;

  void filterList(bool value) {
    filteredList.value = value ? first : second;
  }
}
