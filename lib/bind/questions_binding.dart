import 'package:get/get.dart';
import '../views/questions/controller/questions_controller.dart';

class QuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsController>(() => QuestionsController());
  }
}
