import '../utils/basic_import.dart';
class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int maxLines;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const ExpandableTextWidget({
    super.key,
    required this.text,
    this.maxLines = 6,
    this.fontSize = 14,
    this.color,
    this.fontWeight,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;
  bool showSeeMore = false;
  late String firstHalf;
  late String secondHalf;

  @override
  void initState() {
    super.initState();
    // Estimate if text exceeds limit
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight ?? FontWeight.normal,
          ),
        ),
        maxLines: widget.maxLines,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: Get.width - Dimensions.defaultHorizontalSize * 2);

      if (textPainter.didExceedMaxLines) {
        setState(() => showSeeMore = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showSeeMore
          ? () {
              setState(() => isExpanded = !isExpanded);
            }
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            widget.text,
            maxLines: isExpanded ? null : widget.maxLines,
            fontSize: widget.fontSize,
            color: widget.color ?? Colors.grey,
            fontWeight: widget.fontWeight,
            textOverflow: isExpanded
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
          ),
          if (showSeeMore)
            Padding(
              padding: EdgeInsets.only(top: Dimensions.heightSize * 0.4),
              child: TextWidget(
                isExpanded ? "See less" : "See more...",
                fontSize: widget.fontSize * 0.95,
                color: CustomColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
