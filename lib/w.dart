import 'dart:math' as math;
import 'dart:ui';
import 'package:manomanissa/core/utils/basic_import.dart';

class HistoryChartWidget extends StatefulWidget {
  const HistoryChartWidget({super.key});

  @override
  State<HistoryChartWidget> createState() => _HistoryChartWidgetState();
}

class _HistoryChartWidgetState extends State<HistoryChartWidget>
    with SingleTickerProviderStateMixin {
  bool is7Days = true;
  late AnimationController _animController;
  late Animation<double> _animation;

  final List<double> weekData = [1, 3, 4, 3.5, 4.5, 6, 6.5];
  final List<String> weekLabels = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                  _buildToggle(),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.verticalSize * 0.5,
            horizontal: Dimensions.defaultHorizontalSize * 0.5,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff1DB6F5).withOpacity(0.5),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Stack(
            children: [
              Positioned.fill(child: CustomPaint(painter: _BokehPainter())),
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, _) => CustomPaint(
                    painter: _ChartPainter(
                      data: weekData,
                      labels: weekLabels,
                      progress: _animation.value,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggle() {
    return Container(
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1830).withOpacity(0.9),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF1B3A5E), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _toggleItem("7 Day's", true),
          _toggleItem("30 Day's ★", false),
        ],
      ),
    );
  }

  Widget _toggleItem(String label, bool is7) {
    final isSelected = is7Days == is7;
    return GestureDetector(
      onTap: () {
        setState(() {
          is7Days = is7;
          _animController.forward(from: 0);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00C4D4) : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF5A85A8),
            fontSize: 11.5.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

// ─── CHART PAINTER ───────────────────────────
class _ChartPainter extends CustomPainter {
  final List<double> data;
  final List<String> labels;
  final double progress;

  _ChartPainter({
    required this.data,
    required this.labels,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double leftPad = 38.0;
    const double rightPad = 6.0;
    const double bottomPad = 28.0;
    const double topPad = 6.0;

    final double chartW = size.width - leftPad - rightPad;
    final double chartH = size.height - bottomPad - topPad;

    const double yMin = 0, yMax = 10;
    const int ySteps = 5; // 00,02,04,06,08,10

    // Outer border
    canvas.drawRect(
      Rect.fromLTWH(leftPad, topPad, chartW, chartH),
      Paint()
        ..color = Colors.white.withOpacity(0.85)
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke,
    );

    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.85)
      ..strokeWidth = 0.5;

    // Horizontal grid + Y labels
    for (int i = 0; i <= ySteps; i++) {
      final y = topPad + chartH - (i / ySteps) * chartH;
      final value = (yMin + (yMax - yMin) * i / ySteps).toInt();
      final label = value.toString().padLeft(2, '0');

      canvas.drawLine(
        Offset(leftPad, y),
        Offset(leftPad + chartW, y),
        gridPaint,
      );

      final tp = TextPainter(
        text: TextSpan(
          text: label,
          style: const TextStyle(
            color: Color(0xFF5A85A8),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(leftPad - tp.width - 5, y - tp.height / 2));
    }

    // Vertical grid lines
    final double stepX = chartW / (data.length - 1);
    for (int i = 0; i < data.length; i++) {
      canvas.drawLine(
        Offset(leftPad + i * stepX, topPad),
        Offset(leftPad + i * stepX, topPad + chartH),
        gridPaint,
      );
    }

    // Points
    List<Offset> points = List.generate(data.length, (i) {
      final x = leftPad + i * stepX;
      final y = topPad + chartH - ((data[i] - yMin) / (yMax - yMin)) * chartH;
      return Offset(x, y);
    });

    // Animated subset
    final totalSeg = points.length - 1;
    final drawnLen = progress * totalSeg;
    final animPts = <Offset>[];

    for (int i = 0; i <= totalSeg; i++) {
      if (i > drawnLen) {
        if (i > 0) {
          final seg = drawnLen - (i - 1);
          if (seg > 0) {
            animPts.add(
              Offset(
                points[i - 1].dx + (points[i].dx - points[i - 1].dx) * seg,
                points[i - 1].dy + (points[i].dy - points[i - 1].dy) * seg,
              ),
            );
          }
        }
        break;
      }
      animPts.add(points[i]);
    }

    if (animPts.length >= 2) {
      // Fill
      final fillPath = Path()..moveTo(animPts.first.dx, topPad + chartH);
      for (final p in animPts) fillPath.lineTo(p.dx, p.dy);
      fillPath
        ..lineTo(animPts.last.dx, topPad + chartH)
        ..close();

      canvas.drawPath(
        fillPath,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white.withOpacity(0.06), Colors.transparent],
          ).createShader(Rect.fromLTWH(0, topPad, size.width, chartH)),
      );

      // White line
      final linePath = Path()..moveTo(animPts.first.dx, animPts.first.dy);
      for (int i = 1; i < animPts.length; i++)
        linePath.lineTo(animPts[i].dx, animPts[i].dy);

      canvas.drawPath(
        linePath,
        Paint()
          ..color = Colors.white.withOpacity(0.85)
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );
    }

    // Dots + X labels
    for (int i = 0; i < points.length; i++) {
      final segP = (progress * totalSeg - i).clamp(0.0, 1.0);
      if (segP <= 0) continue;

      final pt = points[i];

      // Glow
      canvas.drawCircle(
        pt,
        9 * segP,
        Paint()..color = const Color(0xFF00C4D4).withOpacity(0.18 * segP),
      );
      // Dark fill
      canvas.drawCircle(
        pt,
        4.5 * segP,
        Paint()..color = const Color(0xFF060F20),
      );
      // Cyan border
      canvas.drawCircle(
        pt,
        4.5 * segP,
        Paint()
          ..color = const Color(0xFF00C4D4)
          ..strokeWidth = 1.8
          ..style = PaintingStyle.stroke,
      );

      // X label
      if (i < labels.length) {
        final xTp = TextPainter(
          text: TextSpan(
            text: labels[i],
            style: const TextStyle(
              color: Color(0xFF5A85A8),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        xTp.paint(
          canvas,
          Offset(pt.dx - xTp.width / 2, size.height - bottomPad + 5),
        );
      }
    }
  }

  @override
  bool shouldRepaint(_ChartPainter old) =>
      old.progress != progress || old.data != data;
}

// ─── BOKEH PAINTER ───────────────────────────
class _BokehPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rnd = math.Random(42);

    // Tiny white star dots only
    for (int i = 0; i < 80; i++) {
      final x = rnd.nextDouble() * size.width;
      final y = rnd.nextDouble() * size.height;
      final r = rnd.nextDouble() * 0.9 + 0.15;
      final op = rnd.nextDouble() * 0.45 + 0.08;
      canvas.drawCircle(
        Offset(x, y),
        r,
        Paint()..color = Colors.white.withOpacity(op),
      );
    }

    final b2 = math.Random(99);
    for (int i = 0; i < 14; i++) {
      canvas.drawCircle(
        Offset(b2.nextDouble() * size.width, b2.nextDouble() * size.height),
        1.1,
        Paint()..color = Colors.white.withOpacity(b2.nextDouble() * 0.3 + 0.5),
      );
    }
  }

  @override
  bool shouldRepaint(_BokehPainter old) => false;
}
