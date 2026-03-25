part of 'about_screen.dart';

class AboutScreenMobile extends GetView<AboutController> {
  const AboutScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: Column(
            children: [
              Space.height.v40,
              TextWidget(
                'About',
                fontSize: Dimensions.headlineSmall,
                fontWeight: FontWeight.w600,
                color: CustomColors.whiteColor,
              ),
              Space.height.v40,

              _SettingTile(
                icon: Icons.contact_support,
                label: Strings.contactSupportHelp,
                onTap: () {
                  Get.toNamed(Routes.supportScreen);
                },
              ),

              _SettingTile(
                icon: Icons.note,
                label: Strings.termsConditions,
                onTap: () {
                  Get.toNamed(Routes.terms_policyScreen, arguments: "Terms and Conditions");
                },
              ),
              _SettingTile(
                icon: Icons.privacy_tip,
                label: Strings.privacy,
                onTap: () {
                  Get.toNamed(Routes.terms_policyScreen, arguments: "Privacy Policy");
                },
              ),
            ],
          ),
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
              border: Border.all(color: color.withOpacity(0.5), width: 2),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 22.h,
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
