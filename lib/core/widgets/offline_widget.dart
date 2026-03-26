import '../utils/basic_import.dart';
import '../helpers/network_manager.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.dummy.bg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Icon or Premium Illustration
                Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: CustomColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.wifi_off_rounded,
                    size: 80.h,
                    color: CustomColors.primary,
                  ),
                ),
                Space.height.v30,

                TextWidget(
                  Strings.noInternetConnection,
                  fontSize: Dimensions.headlineSmall,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.whiteColor,
                  textAlign: TextAlign.center,
                ),
                Space.height.v10,

                TextWidget(
                  'Please check your connection and try again.',
                  fontSize: Dimensions.bodyMedium,
                  color: CustomColors.whiteColor.withOpacity(0.7),
                  textAlign: TextAlign.center,
                ),
                Space.height.v40,

                // Retry Button
                PrimaryButtonWidget(
                  title: 'Retry Connection',
                  onPressed: () async {
                    final hasInternet = await NetworkManager.hasConnection();
                    if (hasInternet) {
                      if (Get.key.currentState?.canPop() ?? false) {
                        Get.back();
                      } else {
                        Get.offAllNamed(Routes.splashScreen);
                      }
                    } else {
                      CustomSnackBar.error('Still no connection. Please check again.');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


