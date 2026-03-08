import '../../views/welcome/screen/welcome_screen.dart';
import '../utils/basic_import.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final String hint;
  final String? label;
  final DateTime? initialDate;
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({
    super.key,
    this.hint = "Select Date",
    this.initialDate,
    required this.onDateSelected,
    this.label,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? _selectedDate;
  final DateFormat _formatter = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: CustomColors.primary,
              onPrimary: Colors.white,
              surface: const Color(0xFF1E1E2E),
              onSurface: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: CustomColors.primary,
              ),
            ),
            dialogTheme: DialogThemeData(
              backgroundColor: const Color(0xFF1E1E2E),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlurWidget(
      blurAmount: 3,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          if (widget.label != null)
            Padding(
              padding: EdgeInsets.only(
                bottom: Dimensions.spaceBetweenInputTitleAndBox * 0.6,
              ),
              child: TextWidget(
                widget.label!,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
                fontSize: Dimensions.titleMedium * 0.9,
                fontWeight: FontWeight.w500,
                color: CustomColors.blackColor,
              ),
            ),
          InkWell(
            onTap: () => _pickDate(context),
            borderRadius: BorderRadius.circular(Dimensions.radius * 2),
            child: InputDecorator(
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: CustomStyle.bodyMedium.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.titleMedium * 0.95,
                ),
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: CustomColors.primary,
                  size: Dimensions.iconSizeDefault * 1.2,
                ),
                suffixIcon: Icon(
                  Icons.keyboard_arrow_right,
                  size: Dimensions.iconSizeLarge,
                  color: CustomColors.primary,
                ),
                // filled: true,
                // fillColor: CustomColors.whiteColor.withAlpha(45),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColors.primary.withAlpha(45),
                    width: 1.4,
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColors.primary,
                    width: 1.4,
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                ),
              ),
              child: TextWidget(
                _selectedDate == null
                    ? widget.hint
                    : _formatter.format(_selectedDate!),
                fontSize: Dimensions.titleMedium * 0.95,
                fontWeight: FontWeight.w400,
                color: _selectedDate == null ? Colors.white70 : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
