import 'package:fl_chart/fl_chart.dart';

import '../../../core/utils/basic_import.dart';
import '../../welcome/screen/welcome_screen.dart';


class ProgressionWidget extends StatefulWidget {
  const ProgressionWidget({super.key});

  @override
  State<ProgressionWidget> createState() => _ProgressionWidgetState();
}

class _ProgressionWidgetState extends State<ProgressionWidget> {
  bool is7Days = true;

  final List<FlSpot> spots7Days = const [
    FlSpot(0, 80),
    FlSpot(1, 100),
    FlSpot(2, 120),
    FlSpot(3, 110),
    FlSpot(4, 130),
    FlSpot(5, 105),
    FlSpot(6, 180),
  ];

  final List<FlSpot> spots30Days = const [
    FlSpot(0, 60),
    FlSpot(1, 90),
    FlSpot(2, 75),
    FlSpot(3, 130),
    FlSpot(4, 110),
    FlSpot(5, 150),
    FlSpot(6, 170),
  ];

  final List<String> days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        // ─── Header (chart এর বাইরে) ──────────────────────
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TextWidget(
              Strings.progression,
              fontSize: Dimensions.titleMedium,
              fontWeight: FontWeight.w700,
              color: CustomColors.whiteColor,
            ),
            Container(
              padding: EdgeInsets.all(3.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                color: Colors.black.withOpacity(0.4),
                border: Border.all(
                  color: const Color(0xFF039CE0).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  _ToggleChip(
                    label: Strings.sevenDays,
                    isActive: is7Days,
                    onTap: () => setState(() => is7Days = true),
                  ),
                  _ToggleChip(
                    label: Strings.thirtyDays,
                    isActive: !is7Days,
                    onTap: () => setState(() => is7Days = false),
                    showStar: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        Space.height.v15,

        // ─── Chart Box ────────────────────────────────────
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
            color: Colors.black.withOpacity(0.4),
            border: Border.all(
              color: const Color(0xFF039CE0).withOpacity(0.2),
              width: 1.2,
            ),
          ),
          child: SizedBox(
            height: 160.h,
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 220,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 50,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white.withOpacity(0.12),
                    strokeWidth: 1,
                  ),
                  getDrawingVerticalLine: (value) => FlLine(
                    color: Colors.white.withOpacity(0.12),
                    strokeWidth: 1,
                  ),
                ),                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 50,
                      reservedSize: 32.w,
                      getTitlesWidget: (value, meta) => TextWidget(
                        value.toInt().toString(),
                        fontSize: Dimensions.labelSmall,
                        color: CustomColors.whiteColor.withOpacity(0.4),
                      ),
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 28.h,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= days.length) {
                          return const SizedBox();
                        }
                        return TextWidget(
                          days[index],
                          fontSize: Dimensions.labelSmall,
                          color: CustomColors.whiteColor.withOpacity(0.5),
                        );
                      },
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: is7Days ? spots7Days : spots30Days,
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: const Color(0xFF039CE0),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, bar, index) =>
                          FlDotCirclePainter(
                            radius: 4.r,
                            color: const Color(0xFF039CE0),
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          ),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF039CE0).withOpacity(0.15),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Toggle Chip ──────────────────────────────────────────
class _ToggleChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final bool showStar;

  const _ToggleChip({
    required this.label,
    required this.isActive,
    required this.onTap,
    this.showStar = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          color: isActive ?  CustomColors.primary.withOpacity(0.5) : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: mainMin,
          children: [
            TextWidget(
              label,
              fontSize: Dimensions.labelSmall,
              fontWeight: FontWeight.w600,
              color: isActive
                  ? CustomColors.whiteColor
                  : CustomColors.whiteColor.withOpacity(0.5),
            ),
            if (showStar) ...[
              Space.width.v5,
              Icon(
                Icons.star,
                size: 15.h,
                color: isActive
                    ? Colors.amber
                    : Colors.amber.withOpacity(0.5),
              ),
            ],
          ],
        ),
      ),
    );
  }
}