
import 'package:manomanissa/views/welcome/screen/welcome_screen.dart';

import '../../../core/utils/basic_import.dart';

import 'package:manomanissa/views/welcome/screen/welcome_screen.dart';
import '../../../core/utils/basic_import.dart';
import '../controller/home_controller.dart';

class HomeHeaderWidget extends GetView<HomeController> {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            crossAxisAlignment: crossCenter,
            children: [
              Row(
                children: [
                  TextWidget(
                    Strings.hello,
                    fontSize: Dimensions.headlineMedium * 0.75,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.whiteColor,
                  ),
                  Space.width.v5,
                  TextWidget(
                    controller.userName,
                    fontSize: Dimensions.headlineMedium * 0.75,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.primary,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.notificationScreen),
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: CustomColors.primary,
                      width: 1.5,
                    ),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: CustomColors.primary,
                    size: Dimensions.iconSizeLarge,
                  ),
                ),
              ),
            ],
          ),
          Space.height.v15,

          // ─── Today's Score ────────────────────────────────
          BlurWidget(
            blurAmount: 2,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * 3),
                color: Colors.black.withOpacity(0.35),
                border: Border.all(
                  color: CustomColors.primary.withOpacity(0.25),
                  width: 1.2,
                ),
              ),
              child: TextWidget(
                '${Strings.todaysScore}: ${controller.todayScore}',
                fontSize: Dimensions.titleSmall,
                fontWeight: FontWeight.w500,
                color: CustomColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}