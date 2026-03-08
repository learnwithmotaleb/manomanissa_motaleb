import '../../../core/languages/strings.dart';
import '../../../core/utils/basic_import.dart';

class BlynController extends GetxController {
  final faqList = [
    {'question': Strings.faq1, 'answer': Strings.faqAnswer},
    {'question': Strings.faq2, 'answer': Strings.faqAnswer},
    {'question': Strings.faq3, 'answer': Strings.faqAnswer},
    {'question': Strings.faq4, 'answer': Strings.faqAnswer},
    {'question': Strings.faq5, 'answer': Strings.faqAnswer},
  ];

  final faqIcons = [
    Icons.help_outline,
    Icons.storage_outlined,
    Icons.directions_walk,
    Icons.cancel_outlined,
    Icons.notifications_off_outlined,
  ];

}