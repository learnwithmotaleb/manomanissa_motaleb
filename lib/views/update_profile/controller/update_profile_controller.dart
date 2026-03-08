import '../../../core/utils/basic_import.dart';
class UpdateProfileController extends GetxController {
  final nameController = TextEditingController();
  final selectedDate = Rxn<DateTime>();
  final selectedGender = ''.obs;
  final isLoading = false.obs;

  String get formattedDate {
    if (selectedDate.value == null) return '';
    final d = selectedDate.value!;
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${d.day} ${months[d.month - 1]} ${d.year}';
  }

  Future<void> onPickDate() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value ?? DateTime(2002, 6, 10),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: CustomColors.primary,
            onPrimary: Colors.white,
            surface: Color(0xFF1E1E2E),
            onSurface: Colors.white,
          ),
          dialogTheme: const DialogThemeData(
            backgroundColor: Color(0xFF1E1E2E),
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) selectedDate.value = picked;
  }

  void onPickGender() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2A),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius * 2),
          ),
          border: Border.all(
            color: CustomColors.primary.withOpacity(0.3),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Male', 'Female', 'Other'].map((g) => ListTile(
            title: TextWidget(
              g,
              color: CustomColors.whiteColor,
              fontSize: Dimensions.titleSmall,
            ),
            onTap: () {
              selectedGender.value = g;
              Get.back();
            },
          )).toList(),
        ),
      ),
    );
  }

  void onUpdate() {
    if (nameController.text.trim().isEmpty) {
      CustomSnackBar.error(Strings.pleaseFillOutTheField);
      return;
    }
    // TODO: API call
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}