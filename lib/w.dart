import 'dart:math' as math;
import 'dart:ui';
import 'package:manomanissa/core/utils/basic_import.dart';

import 'package:fl_chart/fl_chart.dart';
import '../../../core/utils/basic_import.dart';

import 'dart:math' as math;
import 'dart:ui';
import 'package:manomanissa/core/utils/basic_import.dart';

import 'package:fl_chart/fl_chart.dart';
import '../../../core/utils/basic_import.dart';

class HistoryChartWidget extends StatefulWidget {
  final String title;
  final List<FlSpot> spots7Days;
  final List<FlSpot> spots30Days;
  final List<String> bottomLabels;
  final double minY;
  final double maxY;
  final double interval;
  final void Function(int days)? onTabChanged;

  const HistoryChartWidget({
    super.key,
    required this.title,
    required this.spots7Days,
    required this.spots30Days,
    required this.bottomLabels,
    this.minY = 0,
    this.maxY = 10,
    this.interval = 2,
    this.onTabChanged,
  });

  @override
  State<HistoryChartWidget> createState() => _HistoryChartWidgetState();
}

class _HistoryChartWidgetState extends State<HistoryChartWidget> {
  bool is7Days = true;

  @override
  Widget build(BuildContext context) {
    final spots = is7Days ? widget.spots7Days : widget.spots30Days;
    final labels = widget.bottomLabels;

    return Column(
      crossAxisAlignment: crossStart,
      children: [

        /// 🔹 Header
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TextWidget(
              widget.title,
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
                    onTap: () {
                      setState(() => is7Days = true);
                      widget.onTabChanged?.call(7);
                    },
                  ),
                  _ToggleChip(
                    label: Strings.thirtyDays,
                    isActive: !is7Days,
                    onTap: () {
                      setState(() => is7Days = false);
                      widget.onTabChanged?.call(30);
                    },
                    showStar: true,
                  ),
                ],
              ),
            ),
          ],
        ),

        Space.height.v15,

        /// 🔹 Chart Container
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

            /// 🔥 FIXED CONDITION
            child: (spots.isEmpty || labels.isEmpty)
                ? Center(
              child: TextWidget(
                "No data available",
                color: CustomColors.whiteColor.withOpacity(0.5),
              ),
            )

            /// 🔥 SAFE CHART
                : LineChart(
              LineChartData(
                minY: widget.minY,
                maxY: widget.maxY,

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: widget.interval,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white.withOpacity(0.12),
                    strokeWidth: 1,
                  ),
                  getDrawingVerticalLine: (value) => FlLine(
                    color: Colors.white.withOpacity(0.12),
                    strokeWidth: 1,
                  ),
                ),

                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: widget.interval,
                      reservedSize: 32.w,
                      getTitlesWidget: (value, meta) => TextWidget(
                        value.toStringAsFixed(0),
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
                        if (index < 0 || index >= labels.length) {
                          return const SizedBox();
                        }
                        return TextWidget(
                          labels[index],
                          fontSize: Dimensions.labelSmall,
                          color: CustomColors.whiteColor.withOpacity(0.5),
                        );
                      },
                    ),
                  ),
                ),

                lineBarsData: [
                  LineChartBarData(
                    spots: spots.isEmpty
                        ? [FlSpot(0, 0)] // 🔥 EXTRA SAFETY
                        : spots,
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          color: isActive
              ? CustomColors.primary.withOpacity(0.5)
              : Colors.transparent,
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
                color: isActive ? Colors.amber : Colors.amber.withOpacity(0.5),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
