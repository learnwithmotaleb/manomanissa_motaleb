import 'package:manomanissa/core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../model/notification_model.dart';

class NotificationController extends GetxController {


  RxList<Notifications> notificationsList = <Notifications>[].obs;

  RxBool isLoading = false.obs;
  Future<NotificationModel> fetchNotifications() async {
    return await ApiRequest().get(
      fromJson: NotificationModel.fromJson,
      endPoint: '/notification',
      isLoading: isLoading,
      onSuccess: (result) {
        notificationsList.assignAll(result.data);
      },
    );
  }
}
