part of 'setting_screen.dart';

class SettingScreenMobile extends GetView<SettingController> {
  const SettingScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            Space.height.v20,

            TextWidget(
              Strings.settings,
              fontSize: Dimensions.headlineSmall,
              fontWeight: FontWeight.w700,
              color: CustomColors.whiteColor,
            ),
            Space.height.v100,
            Space.height.v40,


            _SettingTile(
              icon: Icons.person_outline,
              label: Strings.editProfile,
              onTap: controller.onEditProfile,
            ),
            _SettingTile(
              icon: Icons.language_outlined,
              label: Strings.language,
              onTap: controller.onLanguage,
            ),
            _SettingTile(
              icon: Icons.track_changes_outlined,
              label: Strings.goals,
              onTap: controller.onGoals,
            ),
            _SettingTile(
              icon: Icons.favorite_outline,
              label: Strings.healthConditions,
              onTap: controller.onHealthConditions,
            ),
            _SettingTile(
              icon: Icons.security_outlined,
              label: Strings.security,
              onTap: controller.onSecurity,
            ),
            _SettingTile(
              icon: Icons.star_outline,
              label: Strings.subscription,
              onTap: controller.onSubscription,
            ),
            _SettingTile(
              icon: Icons.info_outline,
              label: Strings.about,
              onTap: controller.onAbout,
            ),
            _SettingTile(
              icon: Icons.power_settings_new,
              label: Strings.logOut,
              onTap: controller.onLogOut,
              isLogOut: true,
            ),

            Space.height.v30,
          ],
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isLogOut;

  const _SettingTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isLogOut = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isLogOut ? CustomColors.rejected : CustomColors.primary;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: onTap,
        child: BlurWidget(
          blurAmount: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 3),
              color: Colors.black.withOpacity(0.35),
              border: Border.all(
                color: color.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: color, size: 22.h,
                  fontWeight: FontWeight.bold,

                ),
                Space.width.v15,
                Expanded(
                  child: TextWidget(
                    label,
                    fontSize: Dimensions.bodyMedium,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.whiteColor,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: color,
                  fontWeight: FontWeight.bold,
                  size: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}