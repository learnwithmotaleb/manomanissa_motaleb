import 'package:manomanissa/core/widgets/terms_and_policy.dart';

import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/empty_data_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../controller/terms_policy_controller.dart';

part 'terms_policy_screen_mobile.dart';

class TermsPolicyScreen extends GetView<TermsPolicyController> {
  const TermsPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: TermsPolicyScreenMobile());
  }
}
