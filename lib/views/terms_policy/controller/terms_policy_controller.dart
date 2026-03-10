import '../../../core/utils/basic_import.dart';
class TermsPolicyController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    // getTermsCondition();
  }

  RxBool isLoading = false.obs;
  String privacyDescription = '';

  // Future<TermsModel> getTermsCondition() async {
  //   return ApiRequest().get(
  //     fromJson: TermsModel.fromJson,
  //     endPoint: ApiEndPoints.policy,
  //     isLoading: isLoading,
  //     onSuccess: (result) => privacyDescription = result.data.content,
  //   );
  // }
  //
  //
  //
  //






}
