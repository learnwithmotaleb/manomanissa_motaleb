import '../../../core/api/services/api_request.dart';
import '../../../core/languages/strings.dart';
import '../../../core/utils/basic_import.dart';
import '../../questions/model/faq_model.dart';

class BlynController extends GetxController {
  final faqList = <Faqs>[].obs;
  final isLoading = false.obs;

  final faqIcons = [
    Icons.help_outline,
    Icons.storage_outlined,
    Icons.directions_walk,
    Icons.cancel_outlined,
    Icons.notifications_off_outlined,
    Icons.question_answer_outlined,
  ];

  @override
  void onInit() {
    super.onInit();
    getFaqs();
  }

  Future<void> getFaqs() async {
    await ApiRequest().get(
      fromJson: FaqModel.fromJson,
      endPoint: '/faq',
      isLoading: isLoading,
      onSuccess: (result) {
        faqList.assignAll(result.data);
      },
    );
  }

  IconData getIcon(int index) {
    if (index < faqIcons.length) return faqIcons[index];
    return Icons.question_answer_outlined;
  }

}