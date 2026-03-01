import '../utils/basic_import.dart';
import 'loading_widget.dart';

import '../utils/basic_import.dart';
import 'loading_widget.dart';

// class GlowOutlineButton extends StatelessWidget {
//   final String title;
//   final VoidCallback onPressed;
//   final double? width;
//   final double? height;
//   final double? fontSize;
//   final Color glowColor;
//   final Color textColor;
//   final bool isLoading;
//
//   const GlowOutlineButton({
//     super.key,
//     required this.title,
//     required this.onPressed,
//     this.width,
//     this.height,
//     this.fontSize,
//     this.glowColor = const Color(0xFF039CE0),
//     this.textColor = Colors.white,
//     this.isLoading = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: isLoading ? null : onPressed,
//       child: CustomPaint(
//         painter: _GlowBorderPainter(glowColor: glowColor),
//         child: Container(
//           width: width ?? double.infinity,
//           height: height ?? Dimensions.buttonHeight,
//           color: Colors.transparent,
//           child: isLoading
//               ? Center(
//             child: SizedBox(
//               width: 20.h,
//               height: 20.h,
//               child: CircularProgressIndicator(
//                 strokeWidth: 2,
//                 color: glowColor,
//               ),
//             ),
//           )
//               : Center(
//             child: TextWidget(
//               title,
//               fontSize: fontSize ?? Dimensions.titleMedium,
//               fontWeight: FontWeight.w500,
//               color: textColor,
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _GlowBorderPainter extends CustomPainter {
//   final Color glowColor;
//
//   _GlowBorderPainter({required this.glowColor});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = RRect.fromRectAndRadius(
//       Offset.zero & size,
//       const Radius.circular(50),
//     );
//
//     final paint = Paint()
//       ..shader = LinearGradient(
//         colors: [
//           glowColor.withOpacity(0.15),
//           glowColor,
//           glowColor.withOpacity(0.15),
//         ],
//         begin: Alignment.centerLeft,
//         end: Alignment.centerRight,
//       ).createShader(Offset.zero & size)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.8;
//
//     canvas.drawRRect(rect, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }



import '../utils/basic_import.dart';
import 'loading_widget.dart';

class GlowOutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color glowColor;
  final Color textColor;
  final bool isLoading;

  const GlowOutlineButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.fontSize,
    this.glowColor = const Color(0xFF039CE0),
    this.textColor = Colors.white,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: CustomPaint(
        painter: _GlowBorderPainter(glowColor: glowColor),
        child: Container(
          width: width ?? double.infinity,
          height: height ?? Dimensions.buttonHeight,
          color: Colors.transparent,
          child: isLoading
              ? Center(
            child: SizedBox(
              width: 20.h,
              height: 20.h,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: glowColor,
              ),
            ),
          )
              : Center(
            child: TextWidget(
              title,
              fontSize: fontSize ?? Dimensions.titleMedium,
              fontWeight: FontWeight.w500,
              color: textColor,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class _GlowBorderPainter extends CustomPainter {
  final Color glowColor;

  _GlowBorderPainter({required this.glowColor});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndCorners(
      Offset.zero & size,
      topLeft: Radius.circular(size.height * 0.5),
      topRight: Radius.circular(size.height * 0.5),
      bottomLeft: Radius.circular(size.height * 0.5),
      bottomRight: Radius.circular(size.height * 0.5),
    );

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          glowColor.withOpacity(0.15),
          glowColor,
          glowColor.withOpacity(0.15),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Offset.zero & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.004545455;
    paint_0_stroke.color = Color(0xff039CE0).withOpacity(1.0);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(
        size.width * 0.05909091, size.height * 0.4391508,
        size.width * 0.8818182, size.height * 0.1202290),
        bottomRight: Radius.circular(size.width * 0.07159091),
        bottomLeft: Radius.circular(size.width * 0.07159091),
        topLeft: Radius.circular(size.width * 0.07159091),
        topRight: Radius.circular(size.width * 0.07159091)), paint_0_stroke);

    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(
        size.width * 0.05909091, size.height * 0.4391508,
        size.width * 0.8818182, size.height * 0.1202290),
        bottomRight: Radius.circular(size.width * 0.07159091),
        bottomLeft: Radius.circular(size.width * 0.07159091),
        topLeft: Radius.circular(size.width * 0.07159091),
        topRight: Radius.circular(size.width * 0.07159091)), paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}