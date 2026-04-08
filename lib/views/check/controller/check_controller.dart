import 'package:manomanissa/views/home/controller/home_controller.dart';
import 'package:manomanissa/views/navigation/controller/navigation_controller.dart';

import '../../../core/api/model/basic_success_model.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
class CheckController extends GetxController {
  final sleepValue = 7.5.obs;
  final hydrationValue = 1.5.obs;
  final activityValue = 9000.0.obs;
  final nutritionValue = 2000.0.obs;
  final isLoading = false.obs;

  Future<BasicSuccessModel> onConfirm() async {
    final homeController = Get.find<HomeController>();
    final navigationController = Get.find<NavigationController>();

    return await ApiRequest().post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: '/metrics/check-in',
      showSuccessSnackBar: true,
      isLoading: isLoading,
      body: {
        "sleep": {"hours": sleepValue.value},
        "hydration": {"waterMl": (hydrationValue.value * 1000).toInt()},
        "activity": {"steps": activityValue.value.toInt()},
        "nutrition": {"calories": nutritionValue.value.toInt(),},
      },
      onSuccess: (result) {
        navigationController.changePage(0);
        homeController.fetchHomeData(days: 7);
        homeController.fetchHomeData(days: 30);

      },
    );
  }
}