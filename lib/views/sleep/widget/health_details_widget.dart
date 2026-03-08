import 'package:fl_chart/fl_chart.dart';
import '../../../core/utils/basic_import.dart';
import '../../../w.dart';
import '../../welcome/screen/welcome_screen.dart';

class HealthDetailWidget extends StatelessWidget {
  final Widget icon;
  final String progressLabel;
  final double progressValue;
  final String infoText;
  final String chartTitle;
  final double chartMinY;
  final double chartMaxY;
  final double chartInterval;
  final List<String> chartBottomLabels;
  final List<FlSpot> spots7Days;
  final List<FlSpot> spots30Days;
  final String suggestionTitle;
  final List<String> suggestions;
  final LinearGradient? progressGradient;

  const HealthDetailWidget({
    super.key,
    required this.icon,
    required this.progressLabel,
    required this.progressValue,
    required this.infoText,
    required this.chartTitle,
    required this.chartBottomLabels,
    required this.spots7Days,
    required this.spots30Days,
    required this.suggestions,
    this.chartMinY = 0,
    this.chartMaxY = 10,
    this.chartInterval = 2,
    this.suggestionTitle = '',
    this.progressGradient,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        Space.height.v20,

        // ─── Progress Card ────────────────────────────────
        BlurWidget(
          blurAmount: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
              color: Colors.black.withOpacity(0.4),
              border: Border.all(
                color: const Color(0xFF039CE0).withOpacity(0.2),
                width: 1.2,
              ),
            ),
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                Row(
                  children: [
                    icon,
                    Space.width.v10,
                    TextWidget(
                      progressLabel,
                      fontSize: Dimensions.titleSmall,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.whiteColor,
                    ),
                  ],
                ),
                Space.height.v15,
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: 6.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width:
                              constraints.maxWidth *
                              progressValue.clamp(0.0, 1.0),
                          decoration: BoxDecoration(
                            gradient:
                                progressGradient ??
                                const LinearGradient(
                                  colors: [
                                    Color(0xFF039CE0),
                                    Color(0xFFA4F4FE),
                                  ],
                                ),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Space.height.v20,

        // ─── Info Card ────────────────────────────────────
        BlurWidget(
          blurAmount: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
              color: Colors.black.withOpacity(0.4),
              border: Border.all(
                color: const Color(0xFF039CE0).withOpacity(0.2),
                width: 1.2,
              ),
            ),
            child: TextWidget(
              infoText,
              fontSize: Dimensions.bodyMedium,
              color: CustomColors.whiteColor.withOpacity(0.85),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Space.height.v30,

        // ─── History Chart ────────────────────────────────
        HistoryChartWidget(
          title: chartTitle,
          minY: chartMinY,
          maxY: chartMaxY,
          interval: chartInterval,
          bottomLabels: chartBottomLabels,
          spots7Days: spots7Days,
          spots30Days: spots30Days,
        ),
        Space.height.v30,

        // ─── Suggestions ──────────────────────────────────
        TextWidget(
          suggestionTitle.isEmpty
              ? Strings.suggestionOfTheDay
              : suggestionTitle,
          fontSize: Dimensions.titleMedium,
          fontWeight: FontWeight.w700,
          color: CustomColors.whiteColor,
        ),
        Space.height.v15,

        ...suggestions.map(
          (tip) => Padding(
            padding: EdgeInsets.only(bottom: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: crossStart,
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: CustomColors.primary,
                  size: 18.h,
                ),
                Space.width.v10,
                Expanded(
                  child: TextWidget(
                    tip,
                    fontSize: Dimensions.bodyMedium,
                    color: CustomColors.whiteColor.withOpacity(0.85),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Space.height.v30,
      ],
    );
  }
}
