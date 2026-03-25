import '../../../core/utils/basic_import.dart';
import '../../../core/api/model/basic_success_model.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/api/end_point/api_end_points.dart';

class TermsPolicyController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      appBarTitle = Get.arguments as String;
    } else {
      appBarTitle = Strings.termsConditions;
    }
    getTermsCondition();
  }

  RxBool isLoading = false.obs;
  String appBarTitle = '';
  String privacyDescription = '';

  Future<void> getTermsCondition() async {
    String endPoint = appBarTitle == "Privacy Policy" 
        ? ApiEndPoints.privacyPolicy 
        : ApiEndPoints.termsConditions;

    await ApiRequest().get(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: endPoint,
      isLoading: isLoading,
      onSuccess: (result) {
        if (result.data != null) {
            privacyDescription = result.data['content'] ?? '';
        }
      },
    );
  }
}
