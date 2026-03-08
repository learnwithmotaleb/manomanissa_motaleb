
import '../../../core/utils/basic_import.dart';

class StatCardWidget extends StatelessWidget {
  final String label;
  final String value;
  final String target;
  final double progress;
  final Widget icon;
  final Color progressColor;
  final LinearGradient? progressGradient;

  const StatCardWidget({
    super.key,
    required this.label,
    required this.value,
    required this.target,
    required this.progress,
    required this.icon,
    this.progressColor = CustomColors.primary,
    this.progressGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.2),
        color: Colors.black.withOpacity(0.45),
        border: Border.all(
          color: progressColor.withOpacity(0.25),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        mainAxisSize: mainMin,
        children: [
          Row(
            children: [
              icon,
              Space.width.v5,
              TextWidget(
                label,
                fontSize: Dimensions.bodyMedium,
                fontWeight: FontWeight.w700,
                color: CustomColors.whiteColor,
              ),
            ],
          ),
          Space.height.v5,
          Row(
            crossAxisAlignment: crossEnd,
            children: [
              TextWidget(
                value,
                fontSize: Dimensions.titleSmall,
                fontWeight: FontWeight.w700,
                color: CustomColors.whiteColor,
              ),
              Space.width.v5,
              TextWidget(
                target,
                fontSize: Dimensions.labelSmall,
                fontWeight: FontWeight.w400,
                color: CustomColors.whiteColor.withOpacity(0.5),
              ),
            ],
          ),
          Space.height.v10,
          _GradientProgressBar(
            progress: progress,
            gradient: progressGradient ??
                const LinearGradient(
                  colors: [Color(0xFFA4F4FE), Color(0xFFFFFFFF)],
                ),
          ),
        ],
      ),
    );
  }
}

class _GradientProgressBar extends StatelessWidget {
  final double progress;
  final LinearGradient gradient;

  const _GradientProgressBar({
    required this.progress,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final fillWidth = (totalWidth * progress.clamp(0.0, 1.0));

        return Container(
          height: 5.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: fillWidth,
              height: 5.h,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),
        );
      },
    );
  }
}