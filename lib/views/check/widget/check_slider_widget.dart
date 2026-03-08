import '../../../core/utils/basic_import.dart';
import '../../welcome/screen/welcome_screen.dart';

class CheckSliderWidget extends StatelessWidget {
  final Widget icon;
  final String label;
  final String valueLabel;
  final String minLabel;
  final String maxLabel;
  final double value;
  final double min;
  final double max;
  final LinearGradient activeGradient;
  final Function(double) onChanged;

  const CheckSliderWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.valueLabel,
    required this.minLabel,
    required this.maxLabel,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.activeGradient = const LinearGradient(
      colors: [Color(0xFF039CE0), Color(0xFFA4F4FE)],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return BlurWidget(
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
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            // ─── Label Row ────────────────────────────────
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                Row(
                  children: [
                    icon,
                    Space.width.v10,
                    TextWidget(
                      label,
                      fontSize: Dimensions.titleSmall,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.whiteColor,
                    ),
                  ],
                ),
                TextWidget(
                  valueLabel,
                  fontSize: Dimensions.titleSmall,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.whiteColor,
                ),
              ],
            ),

            // ─── Slider ───────────────────────────────────
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 5.h,
                thumbColor: activeGradient.colors.last,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 16.r),
                overlayColor: activeGradient.colors.last.withOpacity(0.25),
                activeTrackColor: Colors.transparent,
                inactiveTrackColor: Colors.white.withOpacity(0.15),
                trackShape: _GradientTrackShape(gradient: activeGradient),
              ),
              child: Slider(
                value: value,
                min: min,
                max: max,
                onChanged: onChanged,
              ),
            ),

            // ─── Min Max Labels ───────────────────────────
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                TextWidget(
                  minLabel,
                  fontSize: Dimensions.labelSmall,
                  color: CustomColors.whiteColor.withOpacity(0.5),
                ),
                TextWidget(
                  maxLabel,
                  fontSize: Dimensions.labelSmall,
                  color: CustomColors.whiteColor.withOpacity(0.5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GradientTrackShape extends SliderTrackShape {
  final LinearGradient gradient;
  const _GradientTrackShape({required this.gradient});

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 5;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    return Rect.fromLTWH(
      offset.dx,
      trackTop,
      parentBox.size.width,
      trackHeight,
    );
  }

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        Offset? secondaryOffset,
        bool isDiscrete = false,
        bool isEnabled = false,
      }) {
    final trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
    );

    final radius = Radius.circular(trackRect.height / 2);

    // Inactive track
    final inactivePaint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.fill;

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect, radius),
      inactivePaint,
    );

    // Active track with gradient
    final activeRect = Rect.fromLTRB(
      trackRect.left,
      trackRect.top,
      thumbCenter.dx,
      trackRect.bottom,
    );

    final activePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..style = PaintingStyle.fill;

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(activeRect, radius),
      activePaint,
    );
  }
}