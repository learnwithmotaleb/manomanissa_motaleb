import '../../../core/utils/basic_import.dart';
import '../../home/controller/home_controller.dart';
import '../../home/widget/state_card_widget.dart';
import '../../welcome/screen/welcome_screen.dart';

import '../../../core/utils/basic_import.dart';
import '../../home/widget/state_card_widget.dart';

class HomeInfoCard extends GetView<HomeController> {
  const HomeInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Dummy values from controller (static, no Rx needed)
    final sleepVal = controller.sleepVal;
    final sleepTarget = controller.sleepTarget;
    final sleepProgress = sleepTarget > 0 ? sleepVal / sleepTarget : 0.0;

    final hydVal = controller.hydVal;
    final hydTarget = controller.hydTarget;
    final hydProgress = hydTarget > 0 ? hydVal / hydTarget : 0.0;

    final actVal = controller.actVal;
    final actTarget = controller.actTarget;
    final actProgress = actTarget > 0 ? actVal / actTarget : 0.0;

    final nutVal = controller.nutVal;
    final nutTarget = controller.nutTarget;
    final nutProgress = nutTarget > 0 ? nutVal / nutTarget : 0.0;

    return SizedBox(
        height: size.height * 0.4,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: size.height * 0.12,
              left: 0,
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.sleepScreen),
                child: SizedBox(
                  width: size.width * 0.38,
                  child: BlurWidget(
                    blurAmount: 0.8,
                    child: StatCardWidget(
                      label: Strings.sleep,
                      value: '${sleepVal}h',
                      target: '/${sleepTarget}h',
                      progress: sleepProgress.toDouble().clamp(0.0, 1.0),
                      progressGradient: const LinearGradient(
                        colors: [Color(0xFF039CE0), Color(0xFFA4F4FE)],
                        stops: [0.0, 1.0],
                      ),
                      icon: Icon(
                        Icons.bedtime,
                        color: CustomColors.primary,
                        size: 18.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: size.height * 0.12,
              right: 0,
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.hydrationScreen),
                child: SizedBox(
                  width: size.width * 0.38,
                  child: BlurWidget(
                    blurAmount: 0.8,
                    child: StatCardWidget(
                      label: Strings.hydration,
                      value: '${hydVal}L',
                      target: '/${hydTarget} Liters',
                      progress: hydProgress.toDouble().clamp(0.0, 1.0),
                      progressGradient: const LinearGradient(
                        colors: [Color(0xFF039CE0), Color(0xFFA4F4FE)],
                        stops: [0.0, 1.0],
                      ),
                      icon: Icon(
                        Icons.water_drop_rounded,
                        color: Colors.lightBlueAccent,
                        size: 18.h,
                      ),
                      progressColor: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: size.height * 0.00,
              left: 0,
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.activityScreen),
                child: SizedBox(
                  width: size.width * 0.38,
                  child: BlurWidget(
                    blurAmount: 0.8,
                    child: StatCardWidget(
                      label: Strings.activity,
                      value: '$actVal',
                      target: '/${actTarget} steps',
                      progress: actProgress.toDouble().clamp(0.0, 1.0),
                      progressGradient: const LinearGradient(
                        colors: [Color(0xFF039CE0), Color(0xFFA4F4FE)],
                        stops: [0.0, 1.0],
                      ),
                      icon: Icon(
                        Icons.directions_walk,
                        color: Colors.lightBlueAccent,
                        size: 22.h,
                      ),
                      progressColor: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: size.height * 0.00,
              right: 0,
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.nutritionScreen),
                child: SizedBox(
                  width: size.width * 0.38,
                  child: BlurWidget(
                    blurAmount: 0.8,
                    child: StatCardWidget(
                      label: Strings.nutrition,
                      value: '$nutVal',
                      target: '/$nutTarget Cal',
                      progress: nutProgress.toDouble().clamp(0.0, 1.0),
                      progressGradient: const LinearGradient(
                        colors: [
                          Color(0xFFF36800),
                          Color(0xFFFCD78D),
                          Color(0xFFFFFFFF),
                        ],
                      ),
                      icon: Image.asset(Assets.icons.orange.path),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}