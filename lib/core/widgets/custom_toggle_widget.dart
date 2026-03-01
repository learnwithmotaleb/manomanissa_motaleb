import '../utils/basic_import.dart';

//            // With 3 options
//             CustomToggleWidget(
//               options: ['Daily', 'Weekly', 'Monthly'],
//               initialIndex: 1,
//               onChanged: (index) {
//                 print('Selected index: ');
//               },
//             ),
//             // Fully customized
//             CustomToggleWidget(
//               options: ['Option 1', 'Option 2', 'Option 3'],
//               height: 60.h,
//               margin: EdgeInsets.symmetric(horizontal: 20.w),
//               selectedColor: Colors.blue,
//               unselectedColor: Colors.grey.shade100,
//               borderColor: Colors.blue,
//               selectedTextColor: Colors.white,
//               unselectedTextColor: Colors.black,
//               borderWidth: 2.0,
//               borderRadius: 15,
//               initialIndex: 0,
//               onChanged: (index) {
//                 // Handle selection
//               },
//             ),

//            CustomToggleWidget(
//               options: ['English', 'Greek'],
//               initialIndex: AppStorage.languageCode == 'en' ? 0 : 1,
//               onChanged: (index) async {
//                 if (index == 0) {
//                   await AppStorage.saveLanguage('en');
//                   Get.updateLocale(Locale('en', 'US'));
//                 } else {
//                   await AppStorage.saveLanguage('gr');
//                   Get.updateLocale(Locale('gr', 'GK'));
//                 }
//               },
//             ),

class CustomToggleWidget extends StatefulWidget {
  final List<String> options;
  final int initialIndex;
  final Function(int)? onChanged;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? borderColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final double? borderWidth;
  final double? borderRadius;

  const CustomToggleWidget({
    super.key,
    required this.options,
    this.initialIndex = 0,
    this.onChanged,
    this.height,
    this.margin,
    this.selectedColor,
    this.unselectedColor,
    this.borderColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.borderWidth,
    this.borderRadius,
  });

  @override
  State<CustomToggleWidget> createState() => _CustomToggleWidgetState();
}

class _CustomToggleWidgetState extends State<CustomToggleWidget> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.height ?? 50.h;
    final margin =
        widget.margin ?? (Dimensions.defaultHorizontalSize.edgeHorizontal * 5);
    final selectedColor = widget.selectedColor ?? CustomColors.primary;
    final unselectedColor = widget.unselectedColor ?? Colors.transparent;
    final borderColor = widget.borderColor ?? CustomColors.primary;
    final selectedTextColor =
        widget.selectedTextColor ?? CustomColors.whiteColor;
    final unselectedTextColor =
        widget.unselectedTextColor ?? CustomColors.primary;
    final borderWidth = widget.borderWidth ?? 1.5;
    final borderRadius = widget.borderRadius ?? (Dimensions.radius * 2);

    return Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: List.generate(
          widget.options.length,
          (index) => Expanded(
            child: Row(
              children: [
                if (index > 0)
                  Container(width: borderWidth, color: borderColor),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      widget.onChanged?.call(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? selectedColor
                            : unselectedColor,
                        borderRadius: _getBorderRadius(
                          index,
                          borderRadius,
                          borderWidth,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: TextWidget(
                        widget.options[index],
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        color: selectedIndex == index
                            ? selectedTextColor
                            : unselectedTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius? _getBorderRadius(int index, double radius, double borderWidth) {
    final adjustedRadius = radius - borderWidth;

    if (widget.options.length == 1) {
      return BorderRadius.circular(adjustedRadius);
    }
    if (index == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(adjustedRadius),
        bottomLeft: Radius.circular(adjustedRadius),
      );
    } else if (index == widget.options.length - 1) {
      return BorderRadius.only(
        topRight: Radius.circular(adjustedRadius),
        bottomRight: Radius.circular(adjustedRadius),
      );
    }
    return null;
  }
}
