import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../infrastructure/models/game.dart';
import '../../../infrastructure/services/api_service.dart';

class HomeController extends GetxController {
  final _apiService = ApiService();

  RxList gameList = <Game>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    isLoading.value = true;
    _getProduct();
    super.onInit();
  }

  Future<void> _getProduct() async {
    Either<String, List<Game>> results = await _apiService.getProduct();

    results.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (dataList) {
        gameList.clear();
        gameList.assignAll(dataList);
      },
    );
    isLoading.value = false;
  }
}
