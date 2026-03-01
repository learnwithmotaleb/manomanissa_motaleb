import '../utils/basic_import.dart';
class ConfirmationWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const ConfirmationWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: crossCenter,
        mainAxisAlignment: mainCenter,
        children: [
          SvgPicture.asset(iconPath),
          TextWidget(
            padding: EdgeInsetsGeometry.only(
              top: Dimensions.heightSize * 2,
              bottom: Dimensions.heightSize,
            ),
            title,
            fontWeight: titleStyle?.fontWeight ?? FontWeight.bold,
            fontSize: titleStyle?.fontSize ?? Dimensions.titleMedium * 1.2,
            color: titleStyle?.color,
          ),
          TextWidget(
            textAlign: TextAlign.center,
            subtitle,
            color: subtitleStyle?.color ?? CustomColors.grayShade,
            fontSize: subtitleStyle?.fontSize ?? Dimensions.titleSmall,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
